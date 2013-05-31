<?php

$GLOBALS['Session']->requireAccountLevel('Developer');
	
	
// get repo
if(empty($_REQUEST['repo'])) {
	die('Parameter "repo" required');
}

$repoName = $_REQUEST['repo'];

if(!array_key_exists($repoName, Git::$repositories)) {
	die("Repo '$repoName' is not defined in Git::\$repositories");
}

$repoCfg = Git::$repositories[$repoName];

$exportOptions = array(
	'localOnly' => fas
);

if(!empty($repoCfg['localOnly'])) {
	$exportOptions['localOnly'] = true;
}

// get message
if(empty($_POST['message'])) {
	die(
		'<form method="POST">'
			.'<label>Commit message: <input type="text" name="message" size="50"></label>'
			.'<input type="submit" value="Commit">'
		.'</form>'
	);
}


// start the process
set_time_limit(0);
Benchmark::startLive();
Benchmark::mark("configured request: repoName=$repoName");


// get paths
$repoPath = "$_SERVER[SITE_ROOT]/site-data/git/$repoName";
$keyPath = "$repoPath.key";
$gitWrapperPath = "$repoPath.git.sh";
putenv("GIT_SSH=$gitWrapperPath");


// check if there is an existing repo
if(!is_dir("$repoPath/.git")) {
	die("$repoPath does not contain .git");
}


// get repo
chdir($repoPath);
$repo = new PHPGit_Repository($repoPath, !empty($_REQUEST['debug']));
Benchmark::mark("loaded git repo in $repoPath");


// verify repo state
if($repo->getCurrentBranch() != $repoCfg['workingBranch']) {
	die("Current branch in $repoPath is not $repoCfg[workingBranch]; aborting.");
}
Benchmark::mark("verified working branch");


// sync trees
foreach($repoCfg['trees'] AS $srcPath => $dstPath) {
	if(!is_string($srcPath)) {
		$srcPath = $dstPath;
	}
	$exportResult = Emergence_FS::exportTree($srcPath, $dstPath, $exportOptions);
	Benchmark::mark("exported $srcPath to $dstPath: ".http_build_query($exportResult));
}


// commit changes
$repo->git('add --all');

$repo->git(sprintf(
	'commit -n -m "%s" --author="%s <%s>"'
	,addslashes($_POST['message'])
	,$GLOBALS['Session']->Person->FullName
	,$GLOBALS['Session']->Person->Email
));
Benchmark::mark("committed all changes");


// push changes
$repo->git("push origin $repoCfg[workingBranch]");
Benchmark::mark("pushed to $repoCfg[workingBranch]");