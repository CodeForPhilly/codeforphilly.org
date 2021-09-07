<!DOCTYPE html>
{load_templates designs/site.subtemplates.tpl}
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    {block "meta-info"}
        {include includes/site.meta-info.tpl}
    {/block}

    {* now use {$dwoo.parent} on subpages to automatically fill in the site name *}
    <title>{block "title"}{Laddr::$siteName|escape}{/block}</title>

    <link rel="icon" type="image/x-icon" href="/favicon.ico">
    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous">
    </script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700" rel="stylesheet" type="text/css">
    <!-- Core theme CSS (includes Bootstrap)-->
    {cssmin "styles.css+custom_styles.css"}
</head>

{* using the responseID as a class on the body can help with subpage-specific styles *}
<body class="{block 'body-class'}{str_replace('/', '_', $.responseId)}-tpl{/block}">
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav">
    {block "nav"}
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="/"><img src="/favicon.ico" alt="favicon" style="height: 2rem;"></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars ml-1"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav text-uppercase ml-auto">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Get Involved
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item nav-link" href="/volunteer">Volunteer</a>
                            <a class="dropdown-item nav-link" href="/sponsor">Sponsor</a>
                            <a class="dropdown-item nav-link" href="/projects">Find a Project</a>
                            <a class="dropdown-item nav-link" href="/pages/project_guidelines">Projects 101</a>
                            <a class="dropdown-item nav-link" href="/pages/hackathons">Launchpads &amp; Hackathons</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/chat" target="_blank">Chat <small>(Slack)</small></a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            About
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item nav-link" href="/mission">Mission</a>
                            <a class="dropdown-item nav-link" href="/pages/code_of_conduct/">Code of Conduct</a>
                            <a class="dropdown-item nav-link" href="/pages/leadership/">Organizing Team</a>
                            <a class="dropdown-item nav-link" href="/pages/leadership-support_team_open_positions/">Join the Organizing Team</a>
                            <a class="dropdown-item nav-link" href="/contact">Contact Us</a>
                            <a class="dropdown-item nav-link" href="/members">Member Directory</a>
                        </div>
                    </li>
                    <li class="nav-item dropdown d-none d-lg-block">
                        <input class="form-control mr-sm-2" id="js-site-search" type="search" placeholder="Search" aria-label="Search">
                        <ul class="dropdown-menu search" id="navbarSearchBarDropdown" aria-labelledby="navbarDropdown">
                        </ul>
                    </li>
                    {if $.User}
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                {avatar $.User 18} {$.User->FirstName}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                {include includes/site-bootstrap4.nav-userlinks.tpl}
                            </div>
                        </li>
                    {else}
                        <li class="nav-item show">
                            <a class="nav-link" href="/login?return={$.server.REQUEST_URI|escape:url}" id="navbarDropdown" role="button" aria-haspopup="false" aria-expanded="false">
                                {_ "Login"}
                            </a>
                        </li>
                        <li class="nav-item show">
                            <a class="nav-link" href="/register?return={$.server.REQUEST_URI|escape:url}" id="navbarDropdown" role="button" aria-haspopup="false" aria-expanded="false">
                                {_ "Signup"}
                            </a>
                        </li>
                    {/if}
                </ul>
            </div>
        </div>
        <div class="d-lg-none container pt-3">
            <input class="form-control mr-sm-2" id="js-site-search-2" type="search" placeholder="Search" aria-label="Search">
            <ul class="dropdown-menu search" id="navbarSearchBarDropdown-2" aria-labelledby="navbarDropdown">
            </ul>
        </div>
    {/block}
    </nav>

    {block content}{/block}

    <!-- Footer-->
    <hr class="mx-5">
    <footer class="footer py-4">
        <div class="container">
            <div class="row pb-3">
                <div class="col-12 col-sm-4">
                    <a href="/projects">Active Projects</a>
                    <br>
                    <a href="https://code-for-philly.gitbook.io/partnerships/creating-new-partnerships/first-steps">Start a Project</a>
                    <br>
                    <a href="/pages/hackathons">Hackathons</a>
                </div>

                <div class="col-12 col-sm-4">
                    <a href="/pages/mission">Mission</a>
                    <br>
                    <a href="/pages/code_of_conduct/">Code Of Conduct</a>
                    <br>
                    <a href="/pages/leadership/">Leadership</a>
                </div>

                <div class="col-12 col-sm-4">
                    <a href="/chat">Slack</a>
                    <br>
                    <a href="/contact">Contact</a>
                    <br>
                    <a href="/pages/hack_night_program_details/">Weekly Meetups</a>
                </div>
            </div>
            <div class="row align-items-center">
                <div class="col-lg-4 text-lg-left">Copyright © Code For Philly 2021</div>
                <div class="col-lg-4 my-3 my-lg-0">
                    <a class="btn btn-dark btn-social mx-2" href="http://twitter.com/codeforphilly"><i class="fab fa-twitter"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="https://www.meetup.com/Code-for-Philly"><i class="fab fa-facebook-f"></i></a>
                    <a class="btn btn-dark btn-social mx-2" href="http://codeforphilly.slack.com"><i class="fab fa-linkedin-in"></i></a>
                </div>
                <!-- <div class="col-lg-4 text-lg-right">
                        <a class="mr-3" href="#!">Privacy Policy</a>
                        <a href="#!">Terms of Use</a>
                    </div> -->
            </div>
        </div>
    </footer>

    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <!-- Core theme JS-->
    {jsmin "scripts.js+debounce.js+search.js"}

    {block "js-analytics"}
        {include includes/site.analytics.tpl}
    {/block}
</body>

</html>
