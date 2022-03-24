{extends "designs/site-bootstrap4.tpl"}

{block "content"}

    <!-- Youtube video https://codepen.io/GusRuss89/pen/bVwNrE -->



<section class="page-section" id="main-video">

    <div class="">

        <div class="row">

            <div class="col-12 col-xl-8" style="padding-right:0;">

                <div class="">
                    <video class="" style="width: 100%;" autoplay muted loop poster="videos/video.jpg">
                        <source src="videos/video-small.mp4" type="video/mp4">
                        <source src="videos/video-small.webm" type="video/webm">
                        <source src="videos/video-small.ogv" type="video/ogg">
                    </video>
                </div>


            </div>


            <div class="col-12 col-xl-4">
                <div style="display:flex;
                align-items: flex-end;
                height: 100%;
                padding: 1rem 2rem 5rem;">
                    <div>
                        <h4 class="main-blue-text" style="margin-bottom:1rem;">Contribute towards technology-related projects that benefit the
                            City
                            of Philadelphia.</h4>
                        <h4 class="main-red-text" style="margin-bottom:2rem;">No coding experience required.</h4>

                        <a href="/volunteer"
                            class="main-volunteer-link">Volunteer!</a>
                    </div>
                </div>

            </div>

        </div>

        <!-- CFP 101 Video -->
        <!-- <div class="container"></div>
      <br>
      <br>
      <br>
      <br>
      <iframe width="560" height="315" src="https://www.youtube.com/embed/jntSWZQPcE0" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
  </div> -->


    </div>
</section>





<!-- Masthead-->

<!--


  <header class="masthead">
      <div class="container"> -->

<!-- <div class="masthead-subheading">Welcome To Our Studio!</div> -->

<!-- <div class="masthead-heading text-uppercase">It's Nice To Meet You</div>
      <a class="btn btn-danger btn-xl text-uppercase js-scroll-trigger" href="#services">Tell Me More</a>
&nbsp;&nbsp;&nbsp;&nbsp;
      <a class="btn btn-danger btn-xl text-uppercase js-scroll-trigger" target="_blank" href="https://www.youtube.com/watch?v=jntSWZQPcE0">Watch Video</a>

  </div>

</header>

-->



<!-- Portfolio Grid-->

{template projectTile name  portfolioModal short image logo=no}    
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href={$portfolioModal}>
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/{$image}" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">{$name}</div>
                        <div class="portfolio-caption-subheading text-muted">{$short}</div>
                    </div>
                </div>
            </div>
{/template}	

<section class="page-section bg-light" id="projects">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Join a Project</h2>
            <!-- <h3 class="section-subheading text-muted">Look around!</h3> -->
        </div>
        <div class="row">

			{projectTile name="PHLASK" portfolioModal="#portfolioModal1" short="Access to Public Water" image="phlask.png" }
			{projectTile name="PAWS" portfolioModal="#portfolioModal2" short="Homes for all Pets" image="paws.png" }
			{projectTile name="PLSE" portfolioModal="#portfolioModal4" short="Legal Support and Expungement" image="plse.png" }
			{projectTile name="Choose Native Plants PA" portfolioModal="#portfolioModal5" short="Propagate PA Wildflowers" image="flowers.jpg" }
			{projectTile name="CfP Website Design" portfolioModal="#portfolioModal6" short="Homepage" image="code-for-philly.png" }


        </div>
    </div>
</section>

<!-- Services-->
<section class="page-section" id="services">
  <div class="container">
      <div class="text-center">
          <h2 class="section-heading text-uppercase">Get Involved</h2>
          <h3 class="section-subheading text-muted">We use tech, data, and design as a mode of civic engagement
              with our local communities.</h3>
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

<!--Checkbox Radio Switches-->
<!-- <section class="page-section bg-light" id="projects">
      <div class="container">


          <div class="container">
              <div class="row">
                <div class="col-sm">

                  <strong>Search for a CfP project:</strong><br><br>
                  <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch1">
                      <label class="custom-control-label" for="customSwitch1">Python</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch2">
                      <label class="custom-control-label" for="customSwitch2">Javascript</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch3">
                      <label class="custom-control-label" for="customSwitch3">Project Management</label>
                    </div>
                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch4">
                      <label class="custom-control-label" for="customSwitch4">Django</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch5">
                      <label class="custom-control-label" for="customSwitch5">HTML</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch6">
                      <label class="custom-control-label" for="customSwitch6">Rust</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch7">
                      <label class="custom-control-label" for="customSwitch7">SQL</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch8">
                      <label class="custom-control-label" for="customSwitch8">Postgres</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch9">
                      <label class="custom-control-label" for="customSwitch9">PHP</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch10">
                      <label class="custom-control-label" for="customSwitch10">Flutter</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch11">
                      <label class="custom-control-label" for="customSwitch11">Golang</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch12">
                      <label class="custom-control-label" for="customSwitch12">Frontend</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch13">
                      <label class="custom-control-label" for="customSwitch13">Backend</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch14">
                      <label class="custom-control-label" for="customSwitch14">MERN</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch15">
                      <label class="custom-control-label" for="customSwitch15">Git</label>
                    </div>

                    <div class="custom-control custom-switch">
                      <input type="checkbox" class="custom-control-input" id="customSwitch16">
                      <label class="custom-control-label" for="customSwitch16">UX Designer</label>
                    </div>

                  <br>
                    <button type="button" class="btn btn-danger">Search</button>

                  </div>

                <div class="col-sm">
                  <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="/img/portfolio/pp.png" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">Prevention Point</h5>
                        <p class="card-text">Needle exchange program for Philadelphia.
                        </p>
                      </div>
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Languages:</strong> Python, Javascript, Flutter, Tensor Flow</li>
                        <li class="list-group-item"><strong>Needs:</strong>
                          <br>Project Managers <span style="color:red">(0 of 4)</span>
                          <br>Django developers <span style="color:orange">(1 of 2)</span>
                          <br>Postgres developers <span style="color:green">(1 of 1)</span>
                        </li>
                        <li class="list-group-item"><strong>Meets:</strong> Tuesdays @ 7pm</li>
                        <li class="list-group-item"><strong>PM:</strong> Billy</li>
                        <li class="list-group-item"><strong>Status:</strong> &nbsp;&nbsp;&nbsp; <span class="dotGreen"></span></li>
                      </ul>
                      <div class="card-body">
                        <p class="text-center">
                            <a href="#">Slack</a> &bull;
                            <a href="#">Zoom</a> &bull;
                            <a href="#">Twitter</a> &bull;
                            <a href="#">Github</a>
<br>

                            <a data-tweet-limit="2" class="twitter-timeline" href="https://twitter.com/CodeForPhilly?ref_src=twsrc%5Etfw"></a>
                            <script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>



                        </p>
                      </div>
                    </div>
                </div>

                <div class="col-sm">

                  <div class="card" style="width: 18rem;">
                      <img class="card-img-top" src="/img/portfolio/auto.png" alt="Card image cap">
                      <div class="card-body">
                        <h5 class="card-title">Philly Auto and Parole</h5>
                        <p class="card-text">Give the formerly incarcerated opportunity for a living wage.
                        </p>
                      </div>
                      <ul class="list-group list-group-flush">
                        <li class="list-group-item"><strong>Languages:</strong> Python, Javascript, Flutter, Tensor Flow</li>
                        <li class="list-group-item"><strong>Needs:</strong>
                          <br>Project Managers <span style="color:red">(0 of 4)</span>
                          <br>Django developers <span style="color:orange">(1 of 2)</span>
                          <br>Postgres developers <span style="color:green">(1 of 1)</span>
                        </li>
                        <li class="list-group-item"><strong>Meets:</strong> Tuesdays @ 7pm</li>
                        <li class="list-group-item"><strong>PM:</strong> Billy Hanafee</li>
                        <li class="list-group-item"><strong>Status:</strong> &nbsp;&nbsp;&nbsp; <span class="dotOrange"></span></li>
                      </ul>
                      <div class="card-body">
                        <p class="text-center">
                            <a href="#">Slack</a> &bull;
                            <a href="#">Zoom</a> &bull;
                            <a href="#">Twitter</a> &bull;
                            <a href="#">Github</a>
                        </p>
                      </div>
                    </div>

                </div>
              </div>
            </div>



  </div>
</section> -->



<!-- About-->
<!-- <section class="page-section" id="about">
      <div class="container">
          <div class="text-center">
              <h2 class="section-heading text-uppercase">About</h2>
              <h3 class="section-subheading text-muted">Lorem ipsum dolor sit amet consectetur.</h3>
          </div>
          <ul class="timeline">
              <li>
                  <div class="timeline-image"><img class="rounded-circle img-fluid" src="/img/about/1.jpg" alt="" /></div>
                  <div class="timeline-panel">
                      <div class="timeline-heading">
                          <h4>2009-2011</h4>
                          <h4 class="subheading">Our Humble Beginnings</h4>
                      </div>
                      <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                  </div>
              </li>
              <li class="timeline-inverted">
                  <div class="timeline-image"><img class="rounded-circle img-fluid" src="/img/about/2.jpg" alt="" /></div>
                  <div class="timeline-panel">
                      <div class="timeline-heading">
                          <h4>March 2011</h4>
                          <h4 class="subheading">An Agency is Born</h4>
                      </div>
                      <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                  </div>
              </li>
              <li>
                  <div class="timeline-image"><img class="rounded-circle img-fluid" src="/img/about/3.jpg" alt="" /></div>
                  <div class="timeline-panel">
                      <div class="timeline-heading">
                          <h4>December 2012</h4>
                          <h4 class="subheading">Transition to Full Service</h4>
                      </div>
                      <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                  </div>
              </li>
              <li class="timeline-inverted">
                  <div class="timeline-image"><img class="rounded-circle img-fluid" src="/img/about/4.jpg" alt="" /></div>
                  <div class="timeline-panel">
                      <div class="timeline-heading">
                          <h4>July 2014</h4>
                          <h4 class="subheading">Phase Two Expansion</h4>
                      </div>
                      <div class="timeline-body"><p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sunt ut voluptatum eius sapiente, totam reiciendis temporibus qui quibusdam, recusandae sit vero unde, sed, incidunt et ea quo dolore laudantium consectetur!</p></div>
                  </div>
              </li>
              <li class="timeline-inverted">
                  <div class="timeline-image">
                      <h4>
                          Be Part
                          <br />
                          Of Our
                          <br />
                          Story!
                      </h4>
                  </div>
              </li>
          </ul>
      </div>
  </section> -->





<!-- Team-->

<!-- <section class="page-section bg-light" id="team">
  <div class="container">
      <div class="text-center">
          <h2 class="section-heading text-uppercase">Leadership</h2>
          <h3 class="section-subheading text-muted"><a href="/blog/leadership-support_team_open_positions/"><span style="color:red">Want to join us?</span></a></h3>
      </div>
      <div class="row">
          <div class="col-lg-3">
              <div class="team-member">
                  <img class="mx-auto rounded-circle" src="/img/team/1.jpg" alt="" />
                  <h4>Marieke Jackson and Machow</h4>
                  <p class="text-muted">Co-Directors</p>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3">
              <div class="team-member">
                  <img class="mx-auto rounded-circle" src="/img/team/2.jpg" alt="" />
                  <h4>Julia Schuchard</h4>
                  <p class="text-muted">Communications Co-Lead<br>
                      jschuchard@codeforphilly.org</p>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3">
              <div class="team-member">
                  <img class="mx-auto rounded-circle" src="/img/team/3.jpg" alt="" />
                  <h4>Barb Donnini</h4>
                  <p class="text-muted">Community Co-Lead<br>
                      bdonnini@codeforphilly.org</p>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
          <div class="col-lg-3">
              <div class="team-member">
                  <img class="mx-auto rounded-circle" src="/img/team/4.jpg" alt="" />
                  <h4>Walt Ribeiro</h4>
                  <p class="text-muted">Projects Co-Lead<br>
                      wribeiro@codeforphilly.org</p>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-twitter"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-facebook-f"></i></a>
                  <a class="btn btn-dark btn-social mx-2" href="#!"><i class="fab fa-linkedin-in"></i></a>
              </div>
          </div>
      </div> -->







<!-- <div class="row">
              <div class="col-lg-8 mx-auto text-center"><p class="large text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Aut eaque, laboriosam veritatis, quos non quis ad perspiciatis, totam corporis ea, alias ut unde.</p></div>
          </div> -->
</div>
</section>

<!-- Portfolio Modals-->

{template projectModal2 modal id image }
	<div class="portfolio-modal modal fade " id="{$modal}" tabindex="-1" role="dialog" aria-hidden="true">
	  <div class="modal-dialog">
		  <div class="modal-content">
			  <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
			  </div>
			  <div class="container">
				  <div class="row justify-content-center">
					  <div class="col-lg-8">
						  <div class="modal-body">
								
									{$object = Laddr\Project::getByField('ID', $id)}
									<h2 class='text-uppercase'>{$object->Title}</h2>;
								
							    <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/{$image}" alt="" />
								<div class="content-readme content-markdown well text-justify">
								<div class="content-markdown content-readme">{$object->README|escape|markdown}</div>
								
								</div>
								<a href="/projects/<?php echo $object->Handle ?>" target="_blank" class="btn btn-primary">Project Page</a>
								<a href="{$object->UsersUrl}" target="_blank" class="btn btn-primary">Project Website</a>
								<a href="{$object->DevelopersUrl}" target="_blank" class="btn btn-primary">Github</a>
								<div class="modal-join-slack">
									<p>Want to join this project? Introduce yourself in the #{$object->ChatChannel} Slack channel.</p>
									<a href="/chat?channel={$object->ChatChannel}" target="_blank" class="btn btn-primary">Join Slack</a>
								</div>
						  </div>
					  </div>
				  </div>
			  </div>
		  </div>
	  </div>
	</div>
{/template}

{projectModal2 id="243" modal="portfolioModal1" image="phlask.png" }
{projectModal2 id="291" modal="portfolioModal2" image="paws.png" }
{projectModal2 id="285" modal="portfolioModal4" image="plse.png" }
{projectModal2 id="319" modal="portfolioModal5" image="flowers.jpg" }
{projectModal2 id="318" modal="portfolioModal6" image="code-for-philly.png" }

{/block}
