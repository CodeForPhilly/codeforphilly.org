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



<section class="page-section bg-light" id="projects">
    <div class="container">
        <div class="text-center">
            <h2 class="section-heading text-uppercase">Join a Project</h2>
            <!-- <h3 class="section-subheading text-muted">Look around!</h3> -->
        </div>
        <div class="row">
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal1">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/phlask.png" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">PHLASK</div>
                        <div class="portfolio-caption-subheading text-muted">Access to Public Water</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal2">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/paws.png" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">PAWS</div>
                        <div class="portfolio-caption-subheading text-muted">Homes for all Pets</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4 mb-lg-0">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal4">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/plse.png" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">PLSE</div>
                        <div class="portfolio-caption-subheading text-muted">Legal Support and Expungement</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6 mb-4 mb-sm-0">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal5">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/flowers.jpg" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">Only Plant Natives PA</div>
                        <div class="portfolio-caption-subheading text-muted">Propagate PA Wildflowers</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4 col-sm-6">
                <div class="portfolio-item">
                    <a class="portfolio-link" data-toggle="modal" href="#portfolioModal6">
                        <div class="portfolio-hover">
                            <div class="portfolio-hover-content"><i class="fas fa-plus fa-3x text-danger"></i></div>
                        </div>
                        <img class="img-fluid" src="/img/portfolio/code-for-philly.png" alt="" />
                    </a>
                    <div class="portfolio-caption">
                        <div class="portfolio-caption-heading">CfP Website Design</div>
                        <div class="portfolio-caption-subheading text-muted">Homepage</div>
                    </div>
                </div>
            </div>
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
<!-- Modal 1-->
<div class="portfolio-modal modal fade" id="portfolioModal1" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">PHLASK</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/phlask.png" alt="" />
                          <p class="text-justify"> PHLASK is an Ecosystem for Finding and Sharing Water in
                              Philadelphia Water should remain abundant, clean and accessible to everyone.
                              <br />PHLASK's mission is to help people find publicly available sources of water,
                              and to impel private enterprises to provide public access to their water
                              infrastructure - simply by PHLasking.
                              <br />
                              If you would like to help reduce the use of wasteful plastic bottles and increase
                              access to water, please join the PHLASK Coalition!
                          </p>
                          <!-- <p>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-link" viewBox="0 0 16 16">
                                  <path
                                      d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                  <path
                                      d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                              </svg>
                              <a href="http://www.phlask.me">www.phlask.me</a>
                              &nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-envelope" viewBox="0 0 16 16">
                                  <path
                                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                              </svg>
                              <a href="mailto:hello@phlask.me">hello@phlask.me</a>
                          </p> -->
                            <a href="/projects/phlask--life-liberty_and_the_pursuit_of_water" target="_blank" class="btn btn-primary">Project Page</a>
                            <a href="http://www.phlask.me" target="_blank" class="btn btn-primary">Project Website</a>
                            <a href="https://github.com/phlask" target="_blank" class="btn btn-primary">Github</a>
                            <div class="modal-join-slack">
                                <p>Want to join this project? Introduce yourself in the #phlask Slack channel.</p>
                                <a href="/chat?channel=phlask" target="_blank" class="btn btn-primary">Join Slack</a>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
<!-- Modal 2-->
<div class="portfolio-modal modal fade" id="portfolioModal2" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">PAWS</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/paws.png" alt="" />
                          <p class="text-justify">WHO IS PAWS - As the city's largest animal rescue partner and no-kill animal shelter,
                              PAWS is working to make Philadelphia a place where every healthy and treatable pet
                              is guaranteed a home. Since inception over 10 years ago, PAWS has rescued and placed
                              27,000+ animals in adoptive and foster homes, and has worked to prevent pet
                              homelessness by providing 86,000+ low-cost spay/neuter services and affordable vet
                              care to 227,000+ clinic patients. Just in 2018, 3,584 animals were rescued and
                              36,871 clinic patients were served. PAWS is funded 100% through donations, with 91
                              cents of every dollar collected going directly to the animals. Therefore, PAWS'
                              rescue work (including 3 shelters and all rescue and animal care programs),
                              administration and development efforts are coordinated by only about 70 staff
                              members complemented by over 1500 volunteers.</p>
                          <p class="text-justify">DATA IS UNDERUTILIZED - Through this chain of operational and service activities,
                              PAWS accumulates data regarding donations, adoptions, fosters, volunteers,
                              merchandise sales, event attendees (to name a few), each in their own system and/or
                              manual (Google Sheet) tally. This vital data that can drive insights remains siloed
                              and is usually difficult to extract, manipulate, and analyze. Taking all of this
                              data, making is readily available, and drawing inferences through analysis can drive
                              many benefits: PAWS operations can be better informed and use data-driven decisions
                              to guide programs and maximize effectiveness; supporters can be further engaged by
                              suggesting additional opportunities for involvement based upon pattern analysis;
                              multi-dimensional supporters can be consistently (and accurately) acknowledged for
                              all the ways they support PAWS (i.e. a volunteer who donates and also fosters
                              kittens), not to mention opportunities to further tap the potential of these
                              enthusiastic supporters. And there are bound to be more leverage points as we get
                              further into this project!</p>
                          <p class="text-justify">PROJECT MISSION - This project seeks to provide PAWS with an easy-to-use and
                              easy-to-support tool to extract data from multiple source systems, confirm accuracy
                              and appropriateness and process data where necessary (a data hygiene and wrangling
                              step), and then load relevant data into one or more repositories to facilitate (1) a
                              highly-accurate and rich 360-degree view of PAWS constituents (Salesforce is a
                              likely candidate target system; already in use at PAWS) and (2) flexible ongoing
                              data analysis and insights discovery (e.g. a data warehouse).</p>
                              <!-- <p>
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                      class="bi bi-link" viewBox="0 0 16 16">
                                      <path
                                          d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                      <path
                                          d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                                  </svg>
                                  <a href="/projects/paws_data_pipeline">codeforphilly.org/projects/paws_data_pipeline</a>
                                  &nbsp;&nbsp;&nbsp;
                                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                      class="bi bi-envelope" viewBox="0 0 16 16">
                                      <path
                                          d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                                  </svg>
                                  <a href="mailto:email@email.here">email@email.here</a>
                              </p> -->
                                <a href="/projects/paws_data_pipeline" target="_blank" class="btn btn-primary">Project Page</a>
                                <a href="https://phillypaws.org/" target="_blank" class="btn btn-primary">Nonprofit Website</a>
                                <a href="https://github.com/CodeForPhilly/paws-data-pipeline" target="_blank" class="btn btn-primary">Github</a>
                                <div class="modal-join-slack">
                                    <p>Want to join this project? Introduce yourself in the #paws_data_pipeline Slack channel.</p>
                                    <a href="/chat?channel=paws_data_pipeline" target="_blank" class="btn btn-primary">Join Slack</a>
                                </div>
                      </div>

                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
<!-- Modal 3-->
<div class="portfolio-modal modal fade" id="portfolioModal3" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">Prevention Point</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/pp.png" alt="" />
                          <p class="text-justify">Prevention Point is a private nonprofit organization providing harm reduction
                              services to Philadelphia and the surrounding area.</p>
                          <p class="text-justify">Currently, they are storing data from their programs in separate Excel spreadsheets,
                              disparate EHRs, and partner data systems. This prevents them from being able to see
                              all activities associated with an individual program participant, and also makes it
                              impossible for them to do meaningful analyses that monitor program health and
                              evaluate efforts.</p>
                          <p class="text-justify">This project would work to migrate all of the disparate data sources into one system,
                              make a UI that allows Prevention Point to access all participant data in one system,
                              and increase the ease with which program coordinators can evaluate and monitor
                              activities.</p>
                          <!-- <p>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-link" viewBox="0 0 16 16">
                                  <path
                                      d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                  <path
                                      d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                              </svg>
                              <a href="/projects/prevention_point_unified_reporting_system">codeforphilly.org/projects/prevention_point_unified_reporting_system</a>
                              &nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-envelope" viewBox="0 0 16 16">
                                  <path
                                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                              </svg>
                              <a href="mailto:email@goes.here">email@goes.here</a>
                          </p> -->
                            <a href="/projects/prevention_point_unified_reporting_system" target="_blank" class="btn btn-primary">Project Page</a>
                            <a href="https://ppponline.org/" target="_blank" class="btn btn-primary">Nonprofit Website</a>
                            <a href="https://github.com/CodeForPhilly/prevention-point" target="_blank" class="btn btn-primary">Github</a>
                            <div class="modal-join-slack">
                                <p>Want to join this project? Introduce yourself in the #preventionpoint Slack channel.</p>
                                <a href="/chat?channel=preventionpoint" target="_blank" class="btn btn-primary">Join Slack</a>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
<!-- Modal 4-->
<div class="portfolio-modal modal fade" id="portfolioModal4" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">PLSE</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/plse.png" alt="" />
                          <p class="text-justify">Philadelphia Lawyers for Social Equity (PLSE) is a non-profit legal aid organization
                              that focuses on helping people overcome the barriers they face as a result of
                              criminal records.</p>
                          <p class="text-justify">On July 1st, they will encounter a problem that will severely hinder their ability to
                              efficiently provide expungements within their current 6-12 month timeframe. The new
                              “automatic sealing” of the Clean Slate Law will go into effect, which will remove
                              their access to criminal records. These documents are needed to draft the legal
                              paperwork necessary for an expungement, or a complete erasure of one’s criminal
                              record.</p>
                          <p class="text-justify">This project involves “scraping” criminal history record information from a
                              publicly-available database and storing it on secure servers only available to PLSE
                              staff for the purpose of expungements. The data will need to be properly organized
                              in order to easily pull up an individual’s full record. This project is the only way
                              they could continue providing quick, life-changing services to Philadelphia
                              communities.</p>
                          <!-- <p>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-link" viewBox="0 0 16 16">
                                  <path
                                      d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                  <path
                                      d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                              </svg>
                              <a href="/projects/philadelphia_lawyers_for_social_equity_-_record_expungement">codeforphilly.org/projects/philadelphia_lawyers_for_social_equity_-_record_expungement</a>
                              &nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-envelope" viewBox="0 0 16 16">
                                  <path
                                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                              </svg>
                              <a href="mailto:hello@phlask.me">hello@phlask.me</a>
                          </p> -->
                            <a href="/projects/philadelphia_lawyers_for_social_equity_-_record_expungement" target="_blank" class="btn btn-primary">Project Page</a>
                            <a href="https://www.plsephilly.org/" target="_blank" class="btn btn-primary">Nonprofit Website</a>
                            <a href="https://github.com/natev/Expungement-Generator" target="_blank" class="btn btn-primary">Github</a>
                            <div class="modal-join-slack">
                                <p>Want to join this project? Introduce yourself in the #plse-expungement Slack channel.</p>
                                <a href="/chat?channel=plse-expungement" target="_blank" class="btn btn-primary">Join Slack</a>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
<!-- Modal 5-->
<div class="portfolio-modal modal fade" id="portfolioModal5" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">Only Plant Natives PA</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/flowers.jpg" alt="" />
                          <p class="text-justify">Native plants are really <a href="https://www.audubon.org/content/why-native-plants-matter">important…</a><br><br>
                            But it is a bit overwhelming to select plants (e.g. wildflowers and grasses). This google sheet + tableau solution is designed to assist as a entry point to further research.
                            I'm seeking user experience feedback from the Code for Philly community. Also - If anyone wants to help with the database, please join the project.
                            </p>

                          <!-- <p>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-link" viewBox="0 0 16 16">
                                  <path
                                      d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                  <path
                                      d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                              </svg>
                              <a href="/projects/philadelphia_bail_fund_interactive_data_portal">codeforphilly.org/projects/philadelphia_bail_fund_interactive_data_portal</a>
                              &nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-envelope" viewBox="0 0 16 16">
                                  <path
                                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                              </svg>
                              <a href="mailto:email@goes.here">email@goes.here</a>
                          </p> -->
                            <a href="/projects/pa_wildflower_selector " target="_blank" class="btn btn-primary">Project Page</a>
                            <a href="https://github.com/CodeForPhilly/pa-wildflower-selector" target="_blank" class="btn btn-primary">Github</a>
                            <div class="modal-join-slack">
                                <p>Want to join this project? Introduce yourself in the #pa-wildflower-selector Slack channel.</p>
                                <a href="/chat?channel=pa-wildflower-selector " target="_blank" class="btn btn-primary">Join Slack</a>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
<!-- Modal 6-->
<div class="portfolio-modal modal fade" id="portfolioModal6" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog">
      <div class="modal-content">
          <div class="close-modal" data-dismiss="modal"><img src="/img/close-icon.svg" alt="Close modal" />
          </div>
          <div class="container">
              <div class="row justify-content-center">
                  <div class="col-lg-8">
                      <div class="modal-body">
                          <!-- Project Details Go Here-->
                          <h2 class="text-uppercase">CfP Website Design</h2>
                          <img class="img-fluid d-block mx-auto img-modal" src="/img/portfolio/code-for-philly.png" alt="" />
                          <p class="text-justify">The goal of this particular project is just to re-do the homepage first, and connect it to the existing old pages and laddr. The issues on our "Issues" page in this repo are ones that the leadership team has identified as things they would like changed. However we're open to other ideas of course.
                          </p>
                          <!-- <p>
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-link" viewBox="0 0 16 16">
                                  <path
                                      d="M6.354 5.5H4a3 3 0 0 0 0 6h3a3 3 0 0 0 2.83-4H9c-.086 0-.17.01-.25.031A2 2 0 0 1 7 10.5H4a2 2 0 1 1 0-4h1.535c.218-.376.495-.714.82-1z" />
                                  <path
                                      d="M9 5.5a3 3 0 0 0-2.83 4h1.098A2 2 0 0 1 9 6.5h3a2 2 0 1 1 0 4h-1.535a4.02 4.02 0 0 1-.82 1H12a3 3 0 1 0 0-6H9z" />
                              </svg>
                              <a href="https://github.com/CodeForPhilly/cfp-mockup/">https://github.com/CodeForPhilly/cfp-mockup/</a>
                              &nbsp;&nbsp;&nbsp;
                              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                  class="bi bi-envelope" viewBox="0 0 16 16">
                                  <path
                                      d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2zm13 2.383-4.758 2.855L15 11.114v-5.73zm-.034 6.878L9.271 8.82 8 9.583 6.728 8.82l-5.694 3.44A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.739zM1 11.114l4.758-2.876L1 5.383v5.73z" />
                              </svg>
                              <a href="mailto:email@goes.here">email@goes.here</a>
                          </p> -->
                            <a href="/projects/code_for_philly_website_redesign" target="_blank"class="btn btn-primary">Project Page</a>
                            <a href="https://github.com/CodeForPhilly/cfp-mockup/" target="_blank" class="btn btn-primary">Github</a>
                            <div class="modal-join-slack">
                                <p>Want to join this project? Introduce yourself in the #cfp-homepage-redesign Slack channel.</p>
                                <a href="/chat?channel=cfp-homepage-redesign" target="_blank" class="btn btn-primary">Join Slack</a>
                            </div>
                      </div>
                  </div>
              </div>
          </div>
          <!-- <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          </div> -->
      </div>
  </div>
</div>
{/block}
