<!DOCTYPE html>
{load_templates designs/site.templates.tpl}
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<title>{block "title"}Code for Philly{/block}</title>
		
		{block meta}
			<meta name="viewport" content="width=device-width, initial-scale=1.0" />
			<meta name="description" content="Code for America Brigade for Philadelphia" />
		{/block}
		
		{block css}
			{*
				Compresses all CSS files into a single request.
				Add ?css-debug=1 to any URL to load separate uncompressed files
			*}
			{cssmin "bootstrap.css+bootstrap-responsive.css+site.css+responsive.css+site-widgets/*"}

			<!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
			<!--[if lt IE 9]>
			<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
			<![endif]-->
		{/block}
		
		{block icons}
			{*
			<link rel="apple-touch-icon-precomposed" sizes="144x144" href="/ico/apple-touch-icon-144-precomposed.png" />
			<link rel="apple-touch-icon-precomposed" sizes="114x114" href="/ico/apple-touch-icon-114-precomposed.png" />
			<link rel="apple-touch-icon-precomposed" sizes="72x72" href="/ico/apple-touch-icon-72-precomposed.png" />
			<link rel="apple-touch-icon-precomposed" href="/ico/apple-touch-icon-57-precomposed.png" />
			*}
			<link rel="shortcut icon" href="/favicon.ico" />
		{/block}
	</head>
	<body>
		{block navbar}
			<div class="container">
				<div class="navbar navbar-inverse">
					<div class="navbar-inner">
						<div class="container">
							<a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
								<span class="icon-bar"></span>
							</a>
							<a class="brand" href="/">Code For Philly</a>
							<div class="nav-collapse collapse">
								<ul class="nav pull-right">
									<li><a href="/">Home</a></li>
									<li><a href="/mission">Mission</a></li>
									<li><a href="/how-to-help">How to Help</a></li>
									{*<li><a href="/requests">Request Board</a></li>*}
									<li><a href="/projects">Projects</a></li>
									<li><a href="/members">Members</a></li>
									{if $.User}
										<li class="dropdown">
											<a class="dropdown-toggle" data-toggle="dropdown" href="#">Tools <b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="/resources">Resources</a></li>
												<li><a href="/chat">Chat</a></li>
												{if $.User->hasAccountLevel('Developer')}
													<li class="divider"></li>
													<li><a href="/develop" target="_blank">Hack this site!</a></li>
													<li><a href="/members/!checkout-all">Check-out everyone</a></li>
												{/if}
											</ul>
										</li>
										<li class="dropdown">
											<a class="dropdown-toggle" data-toggle="dropdown" href="#">{avatar $.User 10} {$.User->FirstName} <b class="caret"></b></a>
											<ul class="dropdown-menu" role="menu">
												<li><a href="/members/{$.User->Username}">My Profile</a></li>
												<li class="divider"></li>
												{if $.User->OpenCheckin}
													<form id="inout" action="/members/{$.User->Username}/checkout" method="POST" style="display:none;">
														<input type="submit" value="Check-out" />
													</form>
													<li id="inoutlink"><a href="#">Check-out</a></li>
												{else}
													<form id="inout" action="/members/{$.User->Username}/checkin" method="POST" style="display:none">
														<input type="submit" value="Check in" />
													</form>
													<li id="inoutlink"><a href="#">Check-in</a></li>
												{/if}
												<li><a href="/logout">Logout</a></li>
											</ul>
										</li>
									{else}
										<li><a href="/login">Login</a></li>
										<li><a href="/register">Sign up!</a></li>
									{/if}
									</li>		
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		{/block}
		
		{block header}{/block}
		
		<div class="container">
			{block "content"}{/block}
		</div>
		
		{block footer}
			<div class="container">
				<hr />
				<footer>
					<p>Built and maintained by <a href="http://codeforphilly.org">Code for Philly</a>.</p>
				</footer>
			</div>
		{/block}
		
		{block "js-bottom"}
			{*
				Compresses all JS files into a single request.
				Add ?js-debug=1 to any URL to load separate uncompressed files
			*}
			{jsmin "jquery.js+bootstrap/bootstrap-tooltip.js+bootstrap/*+magic.js+features/member-badges.js"}
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