<!DOCTYPE html>
{load_templates designs/site.templates.tpl}
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title>{block title}Code for Philly{/block}</title>
		<link rel="shortcut icon" href="/favicon.ico" />
		
		{block meta}
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<meta name="description" content="Code for America Brigade for Philadelphia" />
		{/block}

		{block css}
			{*
				Compresses all CSS files into a single request.
				Add ?css-debug=1 to any URL to load separate uncompressed files
			*}
			{cssmin array(
    			'bootstrap.css'
    			,'bootstrap-responsive.css'
    			,'bootstrap-combobox.css'
    			,'bootstrap-tagsinput.css'
    			,'site.css'
    			,'pages/*'
			)}
		{/block}

		{block js}{/block}
	</head>
	<body>
		<header class="site">
			{block header}
			<nav class="navbar navbar-inverse navbar-fixed-top">
				<section class="navbar-inner">
					<div class="container">
					
						<!-- .btn-navbar is used as the toggle for collapsed navbar content -->
						<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
							<span class="icon-bar"></span>
						</a>
	
						<a class="brand" href="/">Code for Philly</a>
	
						<div class="nav-collapse collapse">
							<ul class="nav">
								{*<li><a href="/about">About</a></li>*}
								<li><a href="/mission">Mission</a></li>
								<li><a href="/how-to-help">How to Help</a></li>
								<li><a href="/contact">Contact</a></li>
							</ul>

							<ul class="nav pull-right">
								{if $.User}
									<li class="dropdown">
										<a class="dropdown-toggle" data-toggle="dropdown" href="#">{avatar $.User 18} {$.User->FirstName} <b class="caret"></b></a>
										<ul class="dropdown-menu" role="menu">
											<li><a href="/members/{$.User->Username}">View My Profile</a></li>
											<li><a href="/profile">Edit My Profile</a></li>
											<li><a href="/logout">Logout</a></li>
										</ul>
									</li>
								{else}
									<li><a href="/login">Login</a></li>
									<li><a href="/register">Sign up!</a></li>
								{/if}
							</ul>
						</div>
					</div>
				</section>
			</nav>
			{/block}
		</header>
	
		{block content-wrapper-open}<div class="container">{/block}
		{block content}{/block}
		{block content-wrapper-close}</div>{/block}
		
		{block footer}
			<footer class="site">
				Built and maintained by <a href="http://codeforphilly.org">Code for Philly</a>.
			</footer>
		{/block}
	
		{block js-bottom}
			{*
				Compresses all JS files into a single request.
				Add ?js-debug=1 to any URL to load separate uncompressed files
			*}
			{jsmin array(
				'jquery.js'
				,'bootstrap/bootstrap-collapse.js'
				,'bootstrap/bootstrap-typeahead.js'
				,'bootstrap/bootstrap-dropdown.js'
				,'bootstrap/bootstrap-modal.js'
				,'bootstrap/bootstrap-modal.js'
				,'bootstrap/bootstrap-tooltip.js'
				,'bootstrap-combobox.js'
				,'bootstrap-tagsinput.js'
			)}
		{/block}

		{block "js-analytics"}
			<script type="text/javascript">
			{if $.User}
				var clicky_custom = {
					session: {
						username: '{$.User->Username}'
						,email: '{$.User->Email}'
						,full_name: '{$.User->FullName}'
					}
				};
			{/if}
			
			var clicky_site_ids = clicky_site_ids || [];
			clicky_site_ids.push(100554785);
			(function() {
				var s = document.createElement('script');
				s.type = 'text/javascript';
				s.async = true;
				s.src = '//static.getclicky.com/js';
				( document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0] ).appendChild( s );
			})();
			</script>
			<noscript><p><img alt="Clicky" width="1" height="1" src="//in.getclicky.com/100554785ns.gif" /></p></noscript>
		{/block}

		{* enables site developers to dump the internal session log here by setting ?log_report=1 on any page *}
		{log_report}
	</body>
</html>