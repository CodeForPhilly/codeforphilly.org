{extends "designs/site-bootstrap4.tpl"}

{block "content"}

    <!-- Youtube video https://codepen.io/GusRuss89/pen/bVwNrE -->

<section class="page-section" id="main-video">
  <div class="">
    <div class="row">
      <div class="col-12 col-xl-7 mx-xl-auto" style="padding-right:0;">
        <div class="">
          <video class="" style="width: 100%;" autoplay muted loop poster="videos/video.jpg">
            <source src="videos/video-small.mp4" type="video/mp4">
            <source src="videos/video-small.webm" type="video/webm">
            <source src="videos/video-small.ogv" type="video/ogg">
            <track label="English" kind="subtitles" srclang="en" src="videos/CFP-en.vtt" default>
          </video>
        </div>
      </div>
      <div class="col-12 col-xl-4">
        <div style="display:flex;
        align-items: flex-end;
        height: 100%;
        padding: 1rem 2rem 5rem;">
          <div>
            <h4 class="main-blue-text" style="margin-bottom:1rem;">Contribute towards technology-related projects that benefit the City of Philadelphia.</h4>
            <h4 class="main-red-text" style="margin-bottom:2rem;">No coding experience required.</h4>
            <a href="/volunteer" class="main-volunteer-link">Volunteer!</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>


<!-- Portfolio Grid-->
{template projectTile name  portfolioModal short image logo=no}    
  <div class="col-lg-4 col-sm-6 mb-4">
    <div class="portfolio-item">
      <a class="portfolio-link" data-toggle="modal" href={$portfolioModal}>
        <div class="portfolio-hover">
            <div class="portfolio-hover-content">
              <i class="fas fa-plus fa-3x text-danger"></i>
            </div>
        </div>
        <img class="img-fluid shadow" src="/img/portfolio/{$image}" alt="" />
      </a>
      <div class="portfolio-caption">
        <div class="portfolio-caption-heading">{$name}</div>
        <div class="portfolio-caption-subheading text-muted">{$short}</div>
      </div>
    </div>
  </div>
{/template}	

<section class="page-section" id="projects">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Join a Project</h2>
    </div>
    <div class="row">

      {projectTile name="PHLASK" portfolioModal="#portfolioModal1" short="Access to Public Water" image="phlask.png" }
      {projectTile name="PAX" portfolioModal="#portfolioModal4" short="Legal Support and Expungement" image="plse.png" }
      {projectTile name="Choose Native Plants PA" portfolioModal="#portfolioModal5" short="Propagate PA Wildflowers" image="flowers.jpg" }
      {projectTile name="CfP Website Design" portfolioModal="#portfolioModal6" short="Website Redesign" image="code-for-philly.png" }
      {projectTile name="Balancer" portfolioModal="#portfolioModal7" short="AI-assisted BPD bipolar medication decision app" image="code-for-philly.png" }
      {projectTile name="Clean and Green Philly" portfolioModal="#portfolioModal8" short="Map of empty lots in Philly" image="cleanandgreen.png" }
      {projectTile name="Votewise" portfolioModal="#portfolioModal9" short="Non-partisan aid to make ballot decisions" image="votewise.png" }

    </div>
  </div>
</section>

<!-- Services-->
<section class="page-section" id="services">
  <div class="container">
    <div class="text-center">
      <h2 class="section-heading text-uppercase">Get Involved</h2>
      <h3 class="section-subheading text-muted">We use tech, data, and design as a mode of civic engagement with our local communities.</h3>
    </div>
    <div class="row text-center">
      <div class="col-md-4">
        <a href="/sponsor">
          <span class="fa-stack fa-4x">
            <i class="fas fa-hand-holding-medical fa-stack-2x text-danger"></i>
            <i c.lass="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
        </a>
        <h4 class="my-3">Sponsor</h4>
        <p class="text-muted">Sponsor an event</p>
      </div>
      <div class="col-md-4">
        <a href="https://code-for-philly.gitbook.io/partnerships/creating-new-partnerships/first-steps" target="_blank">
          <span class="fa-stack fa-4x">
            <i class="fas fa-laptop-code fa-stack-2x text-danger"></i>
            <i c.lass="fas fa-laptop fa-stack-1x fa-inverse"></i>
          </span>
        </a>
        <h4 class="my-3">Start a Project</h4>
        <p class="text-muted">Start or get help on a project</p>
      </div>
      <div class="col-md-4">
        <a href="/volunteer">
          <span class="fa-stack fa-4x">
            <i class="fas fa-hands-helping fa-stack-2x text-danger"></i>
            <i c.lass="fas fa-hands-helping fa-stack-1x fa-inverse"></i>
          </span>
        </a>
        <h4 class="my-3">Volunteer</h4>
        <p class="text-muted">Join our projects</p>
      </div>
    </div>
  </div>
</section>

<!-- Portfolio Modals-->

{template projectModal modal name image description project site github slack logo=no}   
	<div class="portfolio-modal modal fade" id="{$modal}" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog">
		  <div class="modal-content">
			  <div class="close-modal" data-dismiss="modal">
          <img src="/img/close-icon.svg" alt="Close modal" />
			  </div>
			  <div class="container">
				  <div class="row justify-content-center">
					  <div class="col-lg-8">
						  <div class="modal-body">
                <!-- Project Details Go Here-->
                <h2 class="text-uppercase">{$name}</h2>
                <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/{$image}" alt="" />
                <p class="text-justify">{$description}</p>
								<a href="/projects/{$project}" target="_blank" class="btn btn-primary">Project Page</a>
								<a href="{$site}" target="_blank" class="btn btn-primary">Project Website</a>
								<a href="{$github}" target="_blank" class="btn btn-primary">Github</a>
								<div class="modal-join-slack">
									<p>Want to join this project? Introduce yourself in the #{$slack} Slack channel.</p>
									<a href="/chat?channel={$slack}" target="_blank" class="btn btn-primary">Join Slack</a>
								</div>
						  </div>
					  </div>
				  </div>
			  </div>
		  </div>
	  </div>
	</div>
{/template}	

{projectModal name="PHLASK" modal="portfolioModal1" image="phlask.png" 
description="PHLASK is an Ecosystem for Finding and Sharing Water in Philadelphia Water should remain abundant, clean and accessible to everyone.<br><br>
PHLASK's mission is to help people find publicly available sources of water, and to impel private enterprises to provide public access to their water infrastructure - simply by PHLasking.<br><br>
If you would like to help reduce the use of wasteful plastic bottles and increase access to water, please join the PHLASK Coalition!"  
project="phlask--life-liberty_and_the_pursuit_of_water" site="http://www.phlask.me" github="https://github.com/phlask" slack="phlask" }

{projectModal name="PAX" modal="portfolioModal4" image="plse.png" 
description="PAX is an expungement petition generator for PLSE. The application takes in PDFs of clients' criminal dockets and returns fully formatted petitions to expunge the clients' criminal records. Having a clear criminal record helps those clients to better find work, housing, and services."  
project="philadelphia_lawyers_for_social_equity_-_record_expungement" site="https://www.plsephilly.org/" github="https://github.com/natev/Expungement-Generator" slack="pax" }

{projectModal name="Choose Native Plants PA" modal="portfolioModal5" image="flowers.jpg" 
description="Native plants are really <a href='https://www.audubon.org/content/why-native-plants-matter'>important...</a><br><br>
But it is a bit overwhelming to select plants (e.g. wildflowers and grasses). This google sheet + tableau solution is designed to assist as a entry point to further research.
I'm seeking user experience feedback from the Code for Philly community. Also - If anyone wants to help with the database, please join the project."  
project="pa_wildflower_selector" site="https://choosenativeplants.com/" github="https://github.com/CodeForPhilly/pa-wildflower-selector" slack="pa-wildflower-selector" }

{projectModal name="CfP Website Design" modal="portfolioModal6" image="code-for-philly.png" 
description="The goal of this particular project is just to re-do the homepage first, and connect it to the existing old pages and laddr. The issues on our 'Issues' page in this repo are ones that the leadership team has identified as things they would like changed. However we're open to other ideas of course."  
project="code_for_philly_website_redesign" site="https://codeforphilly.org/" github="https://github.com/CodeForPhilly/codeforphilly.org" slack="cfp-homepage-redesign"}

{projectModal name="Balancer" modal="portfolioModal7" image="code-for-philly.png" 
description="Balancer (formerly named "MedAssist") seeks to solve the problems created by the trial-and-error decision-making process that psychiatrists/medication prescribers and patients go through when choosing medications for bipolar disorder."  
project="balancer" site="https://balancerproject.com/" github="https://github.com/CodeForPhilly/balancer-data" slack="balancer"}

{projectModal name="Clean & Green Philly" modal="portfolioModal8" image="cleanandgreen.png" 
description="Philadelphia has a gun violence problem. This dashboard aims to help solve it by empowering community groups to carry out cleaning and greening interventions in the vacant properties where they can have the biggest impact."  
project="vacant_and_abandoned_properties_dashboard" site="https://www.cleanandgreenphilly.org/" github="https://github.com/CodeForPhilly/clean-and-green-philly" slack="clean-and-green-philly"}

{projectModal name="Votewise" modal="portfolioModal9" image="votewise.png" 
description="VoteWise.net is a non-partisan non-profit website that connects voters, organizations, and politicians without advertising dollars getting in the way. Right now, politicians have serious challenges reaching voters without advertising. This means that politicians have to waste a lot of time begging for money instead of doing what they want to do — help the community."  
project="votewisenet" site="http://www.votewise.net/" github="https://github.com/spencersnygg/VoteWise" slack="votewise"}

{/block}
