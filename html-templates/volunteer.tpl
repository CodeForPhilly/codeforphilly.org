{extends "designs/site-bootstrap4.tpl"}

{block "content"}
    <main id="secondary__main">
    <div class="pl-5 pr-5 pb-5 secondary-page-intro secondary-page-div text-center">
        <h1 class="pb-5">Get Involved!</h1>
        <p>The way to volunteer with Code for Philly is to start contributing to one of our projects. Here is the
            process to
            follow in order to volunteer with Code for Philly.</p>
        <div class="d-none d-lg-flex row flex-nowrap">
            <div class="col p-4 pt-5">
                <b>Step 1:</b><br>
                Find a project you're interested in
                <span class="fa-stack fa-4x">
                    <i class="far fa-edit"></i>
                </span>
            </div>
            <div class="col p-4 pt-5">
                <b>Step 2:</b><br>
                Join the Slack channel for that project
                <span class="fa-stack fa-4x">
                    <i class="fab fa-slack"></i>
                </span>
            </div>
            <div class="col p-4 pt-5">
                <b>Step 3:</b><br>
                Introduce yourself in the Slack channel
                <span class="fa-stack fa-4x">
                    <i class="far fa-comment-dots"></i>
                </span>
            </div>
        </div>
        <div class="d-lg-none">
            <div style="display: flex; align-items: center;">
                <div><b>Step 1:</b> Find a project you're interested in</div>
                <span class="fa-stack fa-4x">
                    <i class="far fa-edit"></i>
                </span>
            </div>
            <div style="display: flex; align-items: center;">
                <div><b>Step 2:</b> Join the Slack channel for that project</div>
                <span class="fa-stack fa-4x">
                    <i class="fab fa-slack"></i>
                </span>
            </div>
            <div style="display: flex; align-items: center;">
                <div><b>Step 3:</b> Introduce yourself in the Slack channel</div>
                <span class="fa-stack fa-4x">
                    <i class="far fa-comment-dots"></i>
                </span>
            </div>
        </div>
    </div>
    <div class="container pb-5">
        <div class="card m-5 p-5">
            <h3 class="card-title text-center">Step 1: Find a Project</h3>
            <p class="pt-4">Our website is the best place to find a current list of projects. You can even filter projects by cause,
                technology used, and project stage to find the best project for you. For example, let’s say you are
                interested
                in health projects. Play the video to see a way to find health projects.</p>
            <video class="pt-4" controls="">
                <source src="videos/cfp_find_a_project.mp4" type="video/mp4">
                Sorry, your browser doesn't support embedded videos.
            </video>
            <hr class="m-5">
            <div class="row">
                <p class="col-xs-6 pt-4">You can also attend our 101 meetings to learn about active projects. If you aren’t
                    sure if
                    the project needs your particular skills, or have questions about that particular project, the best
                    first step
                    is to contact the Project Lead. You can do that by going to the project’s page on our website, and
                    clicking on
                    the members to see what contact information they’ve published. You can hover over their circles to
                    get their
                    titles as well.</p>
                <img src="/img/volunteer/rate_my_nurse_screen_shot.png" class="col-xs-6 card-img pt-4" alt="rate my nurse screen shot">
            </div>
            <hr class="m-5">
            <p class="text-center">Having trouble figuring out what projects are active, finding contact information for
                a
                project lead, or which project might be best for you? Email <a class="card-link" href="mailto:hello@codeforphilly.org">hello@codeforphilly.org</a></p>

            <div id="info-about-meetings-container">
                <div class="card">
                    <div class="card-header" id="info-about-meetings-heading">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#info-about-meetings" aria-expanded="false" aria-controls="info-about-meetings">
                                Click for more info about meetings
                            </button>
                        </h5>
                    </div>

                    <div id="info-about-meetings" class="collapse" aria-labelledby="info-about-meetings-heading" data-parent="#info-about-meetings-container">
                        <div class="card-body">
                            <p>It is not required to attend a meeting in order to volunteer. We recommend attending one
                                of our 101
                                Meetups in order to learn more about Code for Philly, but you can skip this step and go
                                straight to a
                                project if you desire!</p>

                            <p>Our 101 meetings talk about who we are, what we do, and how to get involved. They are a
                                great place to
                                ask questions about CFP, and also just to meet others in the community!</p>

                            <p>We have other types of meetings as well - hack days, socials, etc. Everyone is welcome to
                                attend any
                                meeting, you do not have to attend any particular meeting in any particular order.</p>

                            <p>You can find a schedule for all of our upcoming meetings/events on our Meetup page. Make
                                sure you RSVP
                                for our meetings on that page.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card m-5 p-5">
            <h3 class="card-title text-center">Step 2: Join the Slack Channel for that Project</h3>
            <div class="row pt-4">
                <p class="col-md-6">Once you’ve identified a project you are interested in, log into our Slack and find
                    the
                    channel for the project. The channel is always listed on the project description page</p>
                <img src="/img/volunteer/project_slack_channel.png" class="col-md-6 card-img" alt="TODO">
            </div>
            <hr class="m-5">
            <p class="text-center">Having trouble logging into Slack or finding the correct Slack channel? Email <a class="card-link" href="mailto:hello@codeforphilly.org">hello@codeforphilly.org</a>.</p>

            <div id="info-about-slack-container">
                <div class="card">
                    <div class="card-header" id="info-about-slack-heading">
                        <h5 class="mb-0">
                            <button class="btn btn-link" data-toggle="collapse" data-target="#info-about-slack" aria-expanded="false" aria-controls="info-about-slack">
                                Click for more info about Slack
                            </button>
                        </h5>
                    </div>

                    <div id="info-about-slack" class="collapse" aria-labelledby="info-about-slack-heading" data-parent="#info-about-slack-container">
                        <div class="card-body">
                            <p>Code for Philly uses Slack as its main form of communication. Much of our organization’s
                                communication
                                outside of meetings occurs on Slack. Every project at Code for Philly has a Slack
                                channel, and that is
                                the primary place where communication occurs for the project. You will be missing out if
                                you don’t join
                                the Slack, so this should be one of the first things you do when you decide to join!</p>

                            Here’s how to join the Code for Philly Slack:
                            <ul>
                                <li><a class="card-link" href="/register">Register for an
                                        account</a> on the
                                    CFP website.</li>
                                <li><a class="card-link" href="/chat">Login to Slack using your
                                        CFP website
                                        account.</a></li>
                                <li>See <a class="card-link" href="https://slack.com/help/articles/205239967-Join-a-channel">Slack’s
                                        help article for finding a channel</a> to find your project’s channel.</li>
                            </ul>

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="card m-5 p-5">
            <h3 class="card-title text-center">Step 3: Introduce yourself in the Slack channel</h3>
            <p class="pt-4">This is the last step in the process - once you have joined the Slack channel, post a message. The
                message
                should include a brief intro for yourself, and, if applicable, what particular way you want to help with
                the
                project. If you are willing to help in any way, you can say that too!</p>

            <p>Too shy to post in the Slack channel? Email <a class="card-link" href="mailto:hello@codeforphilly.org">hello@codeforphilly.org</a> and we can make an introduction to
                the team
                leader for you.</p>
            <hr class="m-5">
            That’s it! After that it’s on you to remain active with the project. Remaining active typically involves:
            <ul>
                <li>Attending project meetings (usually on Tuesday evenings, but not always).</li>
                <li>Following updates in the Slack Channel</li>
                <li>Tackling issues/tasks in GitHub (or whatever task management software the project is using).</li>
            </ul>
        </div>
    </div>
</main>
{/block}
