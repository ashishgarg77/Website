


@extends('web.template')

@section('content')

	 
	 <style>
	 #animation-container.main , .main, .animation{height:auto !important;}
	 #footer{
		padding-top:200px;
	}
	.footer-top-outer{
		margin-top:0;
	}
	
	
		.page-section{min-height: 400px;}
	.ss2{ position: relative;}
	.ss2 a{position: absolute; z-index: 1; background: red; font-size: 20px; transition: all 0.7s; pointer-events: none !important;}
	.ss2 a.active{
		z-index: 9;
	}
	.content, .parent-overflow{
		height:auto;
	}
	
	main {
  display: flex;
}

.parent {
  flex: 1;
  margin: 0 3px;
  padding: 1rem;
  display: flex;
  flex-flow: row nowrap;
  align-items: flex-start;
  overflow: visible;
}
.parent-sticky .sticky {
  position: sticky;
}
.parent-overflow {
  height: 1000px;
  overflow: hidden;
}
.parent-worst .content, .parent-worst .sticky {
  background: linear-gradient(to bottom, tomato, red);
}
.parent-best .content, .parent-best .sticky {
  background: linear-gradient(to bottom, #11ee11, #22cc22);
  color: black;
}

.sticky {
  width: 50%;
  top: 1rem;
  margin-bottom: 1rem;
  padding: 0.3rem;
  background: linear-gradient(to bottom, #999, #555);
}

.content {
  flex: 1;
  height: 2500px;
  padding: 0.3rem;
  background: linear-gradient(to bottom, #999, #555);
}
	
	
	
	
	@media screen and (max-width:1400px){
		.secv.is-visible .ab-studio-inner{
			    margin-top: -29vh;
		}
	}
	@media screen and (max-width:1024px){
		.secv.is-visible .ab-studio-inner{
			    margin-top: -15vh;
		}
	}
	@media screen and (max-width:767px){
		 #footer{
				padding-top:80px;
			}
			.afi-section-hd {
				padding-bottom: 50vh;
			}
			.secv.is-visible .ab-studio-inner{
				margin-top:-20vh;
			}
			
	}
	 </style>

 <section class="home-banner">
        <div class="bannervideo">
            <header>
                <div class="logo"><a href="{{ url('/') }}"><img src="{{ url('/') }}/images/logo.svg" alt="logo" /></a></div>
                <div class="trigger mytrigger"><a href="javascript:;">
                        <!--span></span>
                        <span></span-->
						<img src="{{ url('/') }}/images/menu-br.svg" class="mytrigger">
                    </a></div>
            </header>


         
			
			<ul id="nav-links" class="ready">
				<li class="anchor"><a class="footern" href="#footern">Contact</a></li>
				<li class="anchor"><a class="space" href="#space">Space</a></li>
				<li class="anchor"><a class="event" href="#event">Event</a></li>
				<li class="anchor"><a class="home active" href="#home">Home</a></li>
			</ul>
			
            <!--video width="320" height="240" muted autoplay loop="true">
                <source src="{{ url('/') }}/images/video.mp4" type="video/mp4">
                <source src="{{ url('/') }}/images/video.mp4" type="video/ogg">
            </video-->
			
			
			<div class="main-video-ekkon" id="home">
                <div id="video-ekkon1" class="active">
                    <div class="bc_1_bl"></div>
                    <video width="320" height="240" muted autoplay id="video11">
                        <source src="{{ url('/') }}/images/Left1_1.mp4" type="video/mp4">
                        <source src="{{ url('/') }}/images/Left1_1.mp4" type="video/ogg">
                    </video>
                    <video width="320" height="240" muted autoplay id="video13">
                        <source src="{{ url('/') }}/images/Left2.mp4" type="video/mp4">
                        <source src="{{ url('/') }}/images/Left2.mp4" type="video/ogg">
                    </video>
                </div>
                <div id="video-ekkon2">
                    <div class="bc_1_bl"></div>
                    <video width="320" height="240" muted  id="video12">
                        <source src="{{ url('/') }}/images/Right-1.mp4" type="video/mp4">
                        <source src="{{ url('/') }}/images/Right-1.mp4" type="video/ogg">
                    </video>
                    <video width="320" height="240" muted  autoplay id="video14">
                        <source src="{{ url('/') }}/images/Right2.mp4" type="video/mp4">
                        <source src="{{ url('/') }}/images/Right2.mp4" type="video/ogg">
                    </video>
                </div>
            </div>
			
			
            <div class="banner-black-hover">
            </div>
            <div class="home-banner-caption">
                <img src="{{ url('/') }}/images/banner-caption.svg" data-aos="fade-up" data-aos-duration="1500">
                <h3 data-aos="fade-up" data-aos-duration="1500">One space<div><span class="abl">MANY</span> <span class="btl">STORIES</span></div></h3>
            </div>
        </div>
    </section>
	
	
	
		
	
	
	
	
	
	
	
	

    <section class="home-section2">
        <div class="home-section2-inner">
            <p data-aos="fade-up" data-aos-duration="1500">At Studio Ekko, we believe creating a space can create <span>culture, communities</span> and
                <span>collaborations.</span></p>
            <p data-aos="fade-up"  data-aos-duration="1500">We are an <span>adaptive studio</span> space that comes alive with a new purpose everyday.</p>
        </div>
    </section>

    <section class="home-section3">
        <div class="wrapper">
            <div class="home-cat-main">
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat1.png);"><a href="javascript:;"><span>exhibition</span></a></div>
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat2.png);"><a href="javascript:;"><span>Fitness</span></a></div>
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat3.png);"><a href="javascript:;"><span>Arts</span></a></div>
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat4.png);"><a href="javascript:;"><span>Entertainment</span></a></div>
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat5.png);"><a href="javascript:;"><span>Corporate</span></a></div>
                <div class="home-cat" style="background-image: url({{ url('/') }}/images/cat6.png);"><a href="javascript:;"><span>Campaign </span></a></div>
            </div>
			
			<div class="draw-line">
			<p>Scroll Down for More</p>
				<div class="line">
					<div class="draw-line-inner hscroll-line">
					</div>
				</div>
			</div>
			
			
        </div>
    </section>
	
	<!-- EVENT SECTION START -->
	<section class="event-area">
		<div class="grid-wrap">
			<div class="grid">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			
		</div>
	
        <div class="ev_new_wrapper">
        <div class="event min_rgt">
            <div class="event-inner">
                <div class="event-inner-left ssradius">
                    <img src="{{ url('/') }}/images/n1th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div>
                <div class="event-inner-right ssradius">
                    <img src="{{ url('/') }}/images/n2th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div> 
            </div>
           <div class="event-inner">
				<div class="event-inner-left">
					<div class="txt_bx">
						<h2 data-aos="fade-up" data-aos-duration="1500"><span>FOR</span> freelancers <br><span>& </span> businesses</h2>
						<p data-aos="fade-up" data-aos-duration="1500">Our platform helps in attracting the <br>right audience, scaling up, marketing <br>and monetizing your skills.</p>
					</div>
				</div>
                <div class="event-inner-right ssradius">
                    <img src="{{ url('/') }}/images/n3th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div>
            </div>
		   
		   <div class="event-inner">
                <div class="event-inner-left">
                </div>
                <div class="event-inner-right">
                   <div class="arow-down" data-aos="zoom-in" data-aos-duration="1500"><a href="javascript:;"><img src="{{ url('/') }}/images/arrow-down.svg" alt="" title="" /></a></div>
                </div> 
            </div>
    
        </div>
		
		<div class="event min_lft">
            <div class="event-inner">
                <div class="event-inner-left ssradius">
                    <img src="{{ url('/') }}/images/n4th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div>
                <div class="event-inner-right ssradius">
                    <img src="{{ url('/') }}/images/n5th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div> 
            </div>
           <div class="event-inner">
				<div class="event-inner-left">
					<div class="txt_bx pl-5">
						<h2 data-aos="fade-up" data-aos-duration="1500"><span>FOR</span> CURIOUS <span>SOULS</span><br/> <span>&</span> SEEKERS <span>OF FUN</span></h2>
						<p data-aos="fade-up" data-aos-duration="1500">For anyone new to the city, it's a great place<br/> to mingle, make new friends, explore new<br/> skills and find your community.  </p>
					</div>
				</div>
                <div class="event-inner-right ssradius">
                    <img src="{{ url('/') }}/images/n6th.jpg" data-aos="zoom-out" data-aos-duration="1500">
                </div>
            </div>
		   
		   <div class="event-inner">
                <div class="event-inner-left" data-aos="zoom-in" data-aos-duration="1500">
					<div class="arow-right"><a href="javascript:;"><img src="{{ url('/') }}/images/arow-right.svg" alt="" title="" /></a></div>
                </div>
                <div class="event-inner-right">
                   <div class="arow-down event-btn" data-aos="fade-up" data-aos-duration="1500"><a href="{{route('events')}}">EVENTS</a></div>
                </div> 
            </div>
    
        </div>
		
		
		
		
		 <div class="event min_rgt Mobileevent">
            <div class="event-inner Mobileevent_inner1">
                <div class="event-inner-left">
                    <div class="txt_bx">
                        <h2><span>FOR</span> freelancers <br><span>& rising</span> businesses</h2>
                    </div>
                </div>
            </div>
            <div class="event-inner Mobileevent_inner2">
                <div class="event-inner-left">
                    <img src="{{ url('/') }}/images/n1th.jpg">
                </div>
                <div class="event-inner-left">
                    <img src="{{ url('/') }}/images/n2th.jpg">
                </div>
            </div>
            
            <div class="event-inner Mobileevent_inner3">
                <div class="event-inner-right">
                    <div class="arow-down"><a href="javascript:;"><img src="{{ url('/') }}/images/arrow-down.svg" alt="" title="" /></a></div>
                </div> 
            </div>
            <div class="event-inner-left Mobileevent_inner4">
                <div class="txt_bx pl-5">
                    <p>Our platform helps in attracting the
right audience, scaling up, marketing
and monetizing your skills. </p>
                </div>
            </div>

           
    
        </div>
        
        <div class="event min_rgt Mobileevent2">
            <div class="event-inner Mobileevent_inner1">
                <div class="event-inner-left">
                    <div class="txt_bx">
                      <h2><span>FOR</span> CURIOUS <span>SOULS</span><br/> <span>& rising</span> SEEKERS <span>OF FUN</span></h2>
					
                    </div>
                </div>
            </div>
            <div class="event-inner Mobileevent_inner2">
                <div class="event-inner-left">
                    <img src="{{ url('/') }}/images/n3th.jpg">
                </div>
                <div class="event-inner-left">
                    <img src="{{ url('/') }}/images/n4th.jpg">
                </div>
            </div>
            
            <div class="event-inner Mobileevent_inner3">
                <div class="event-inner-right">
                    <div class="arow-down"><a href="javascript:;"><img src="{{ url('/') }}/images/arrow-down.svg" alt="" title="" /></a></div>
                </div> 
            </div>
            <div class="event-inner-left Mobileevent_inner4">
                <div class="txt_bx pl-5">
                   	<p>For anyone new to the city, it's a great place
to mingle, make new friends, explore new
skills and find your community.  </p>
					
                </div>
            </div>

            <div class="event-inner-left Mobileevent_inner4 Mobileevent_inner5">
                <div class="txt_bx pl-5">
                    <h4><a href="javascript:;">EVENTS</a></h4>
                </div>
            </div>
    
        </div>
		
		
		
		
		
		
        </div>
    </section>
	<!-- EVENT SECTION END -->
	
	
	
	
	<div id="my-mobile-event">
	
	  <div class="mob-slider-evn">
	  <div class="home-event1 mobile-home-event1">
                    <h2>STAY CONNECTED WITH THE UPCOMING EVENTS</h2>
                </div>
				
                <div class="eventmobile-slider">
                <div class="owl-carousel owl-theme">
                    <?php  foreach($events as $key =>$value){  #echo '<pre>'; print_R($value); echo '</pre>'; ?>
                    <div class="item">
                    <div class="home-event2">
                        <?php if ($value->images->first() != null) { ?>
                            <div class="home-event-th"><img src="{{ url('/') }}/{{  $value->images()->first()->image_path}}"></div>
                        <?php }else { ?>
                            <div class="home-event-th"><img src="{{ url('/') }}/images/home-event1.png"></div>
                         <?php } ?>
                            <div class="home-event-hour">{{  date('H:m', strtotime($value->start_date))}}</div>
                            <div class="home-event-title"><a href="{{ $value->event_url }}">{{  $value->title}}</a></div>
                            <div class="home-event-place">{{  $value->venue_name }}</div>
                           
                            @if(($value->categories()))  <div class="home-event-cat"> {!! implode('</br>',$value->categories()->pluck('title')->toArray()) !!}</div> @endif
                        </div>
                    </div>
                    <?php } ?>

                   
                  </div>
                </div>
            </div>




            <div class="mbc">
                <div class="view-all-events">
                    <a href="javascript:;"><img class="comeoversvg" src="{{ url('/') }}/images/footer-sc1.svg">VIEW THE FULL<br/> CALENDAR</a>
                </div>
            </div>
	
	
	</div>


   

	
	
	
	 <section class="afi-section" id="space">
        <div class="wrapper">
            <div class="afi-section-hd" data-aos="fade-up" data-aos-duration="1500">If staying indoors is not your idea of a day well-spent, <span>come on over to
                    Studio Ekko!</span> <img class="comeoversvg" src="{{ url('/') }}/images/footer-sc1.svg">
			</div>
        </div>
        <div class="ab-studio">
		<div class="ab-studio-inner-main">
		<div class="secv">
            <div class="ab-studio-inner ab-studio-inner1">
                <div class="ab-studio-inner-left">
                    <img src="{{ url('/') }}/images/evt1.png" >
                </div>
                <div class="ab-studio-inner-right">
                    <p>Energize your body and spirit with <span>aerial yoga</span>, attend an <span>art workshop</span>,
                        watch a movie <span>screening</span> or bounce a <span>startup</span> idea off a bunch of
                        unbiased listeners. </p>
                </div>
            </div>
			</div>
			</div>
			<div class="cup-height"></div>
				<div class="ab-studio-inner-main">
					<div class="secv">
            <div class="ab-studio-inner ab-studio-inner2">
                <div class="ab-studio-inner-left">
					<picture>
					  <source media="(max-width:767px)" srcset="{{ url('/') }}/images/evt2-mobile.png">
					  <img src="{{ url('/') }}/images/evt2.png">
					</picture>
                </div>
                <div class="ab-studio-inner-right">
                    <p>Towards the end of the day, kick your feet up over a <span>sundowner</span> in the lawn - some
                        artisanal coffee or hand churned sorbet and share stories. </p>
                </div>
            </div>
			</div>
			</div>
			<div class="cup-height"></div>
				<div class="ab-studio-inner-main">
					<div class="secv">
            <div class="ab-studio-inner ab-studio-inner3">
                <div class="ab-studio-inner-left">
                    <img src="{{ url('/') }}/images/evt3.png">
                </div>
                <div class="ab-studio-inner-right">
                    <p>Find the <span>stimulus</span> you need to take your personal project forward. </p>
                </div>
            </div>
			</div>
			</div>
			<div class="cup-height"></div>
				<div class="ab-studio-inner-main">
					<div class="secv">
            <div class="ab-studio-inner ab-studio-inner4">
                <div class="ab-studio-inner-left">
                    <img src="{{ url('/') }}/images/evt4.png">
                </div>
                <div class="ab-studio-inner-right">
                    <p>
                        Ekko resonates with the spirit of conscious, supportive, like-minded people coming together -
                        <span>a place and community you can call your own. </span> </p>
                </div>
            </div>
			</div>
			</div>
			<div class="cup-height"></div>
        </div>
		
		
		
	
		
		
		
		
		
		
		
    </section>
	
	
	


<section class="newrelat">
    <section class="ekkon-exp">
        <div class="wrapper">
            <div class="ekkonexp-heading" data-aos="fade-up" data-aos-duration="100">THE EKKO EXPERIENCE</div>
        </div>
        <div class="ekkon-video">
            <div class="ekkon-video-inner">
                <div class="ekkon-video-border">
                    <video width="320" height="240" muted autoplay loop="true">
                        <source src="{{ url('/') }}/images/my-video2.mp4" type="video/mp4">
                        <source src="{{ url('/') }}/images/my-video2.mp4" type="video/ogg">
                    </video>
                </div>
            </div>
        </div>
    </section>


    <section class="home-gate1 home-gate3">
        <div class="wrapper">
            <div class="home-gate-section1 home-gate-section3"> 
                <div class="home-gate-section1-inner home-gate-section1-inner2" data-aos="fade-right" data-aos-duration="1500">
                    <h1>28.48° <span>N</span><br />
                        77.13° <span>E</span> </h1>
                    <p>Studio Ekko is an open, multifunctional studio space that can host a variety of events and
                        workshops. With a 18ft high ceiling, it is ideal for activities with a large spatial
                        requirement like fitness classes, art exhibitions, social gatherings and live performances. </p>
                </div>
            </div>
        </div>
        <div class="main-gate">
            <!--img src="{{ url('/') }}/images/tree-bg.png"-->
			<img src="{{ url('/') }}/images/ekko-experience-banner-new-final-min.png">
			
        </div>
    </section>

















    <section class="home-gate1">
        <div class="wrapper">
            <div class="home-gate-section1 home-gate-section2">
                <div class="home-gate-section1-inner home-gate-section1-inner2" data-aos="fade-right" data-aos-duration="1500">
                    <h1><span>L1</span> / <span>L2</span> / <span>XL</span> </h1>
                    <p>With a collapsible partition, the studio can be transformed into 2 partial spaces and 1 complete
                        space to suit your requirement. </p>
                </div>
            </div>
        </div>
        <!--div class="main-gate">
            <img src="{{ url('/') }}/images/white-gate.png"-->
            <!-- <img src="{{ url('/') }}/images/gate.png"> -->
          <!-- partial -->
        <!--/div-->

        <!--section class="comparisonSection" style="display:none;">
            <div class="comparisonImage beforeImage">
              <img src="{{ url('/') }}/images/white-gate.png" alt="before">
			  <img src="{{ url('/') }}/images/Doors_1.png" alt="before">
            </div>
            <div class="comparisonImage afterImage">
              <img src="{{ url('/') }}/images/bl-bg.jpg" alt="after">
            </div>
          </section-->
  <lottie-player id="firstLottie" src="{{ url('/') }}/images/door_animation-v2.json"></lottie-player>

    </section>





    <section class="home-gate">
        <div class="wrapper">
            <div class="home-gate-section1">
                <div class="home-gate-section1-inner" data-aos="fade-right" data-aos-duration="1500">
                    <h1><span>2000</span> sq. ft.</h1>
                    <p>The bare, expansive walls serve as the ideal canvas for film or photography. With all this space
                        in the bustling cultural and entrepreneurial locale of the Delhi-Gurgaon border. </p>
                </div>
            </div>
        </div>
        <div class="main-gate">
            <img src="{{ url('/') }}/images/2000sqft-banner-new-min.png" data-aos="zoom-out" data-aos-duration="1500">
        </div>
        <div class="gate-read-more" data-aos="fade-up" data-aos-duration="1500">
            <p>Ekko is packed with the potential needed to host both indoor and outdoor events.</p>
            <p><a href="{{ url('/') }}/images/pitch-deck.pdf" target="_blank">Know MORE</a></p>
        </div>
    </section>
	
	
	
	
	 <section class="home-event-section" id="event">
        <div class="wrapper">
            <div class="home-event-main">
                <div class="home-event1" data-aos="fade-right" data-aos-duration="1200">
                    <h2>STAY CONNECTED WITH UPCOMING EVENTS</h2>
                    <div class="view-all-events">
						<a href="{{route('events')}}"><!--img src="{{ url('/') }}/images/view-event-icon.png"-->
						<img src="{{ url('/') }}/images/footer-sc1.svg" class="footer-sc1">
						VIEW THE FULL CALENDAR</a>
					</div>
                </div>
                <?php  foreach($events as $key =>$value){  #echo '<pre>'; print_R($value); echo '</pre>'; ?>
                   
                        <div class="home-event2">
                        <?php if ($value->images->first() != null) { ?>
                            <div class="home-event-th" style="background:url({{ url('/') }}/{{  $value->images()->first()->image_path}}) no-repeat top center"><img src="{{ url('/') }}/{{  $value->images()->first()->image_path}}"></div>
                        <?php }else { ?>
                            <div class="home-event-th" style="background:url({{ url('/') }}/images/home-event1.png) no-repeat top center"><img src="{{ url('/') }}/images/home-event1.png"></div>
                         <?php } ?>
                            <div class="home-event-hour">{{  date('H:m', strtotime($value->start_date))}}</div>
                            <div class="home-event-title"><a href="javascript:;">{{  $value->title}}</a></div>
                            <div class="home-event-place">{{  $value->venue_name }}</div>
                            @if(($value->categories()))  <div class="home-event-cat"> {!! implode('</br>',$value->categories()->pluck('title')->toArray()) !!}</div> @endif
                        </div>
                   
                    <?php } ?>
                
            </div>
			
			
			 
			
			
			
        </div>
    </section>


	
	
	
	
	
	
	

    <section class="something-setion" style="display:none;">
        <div class="wrapper">
            <div class="something-setion-inner">
                <h3><span>SOMETHING</span> FOR EVERYONE</h3>
                <h3>SOMETHING <span>FOR</span> EVERYONE</h3>
                <h3>SOMETHING FOR <span>EVERYONE</span></h3>
            </div>

            <div class="something-setion2-main">
                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing1.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">01</div>
                        <div class="something-setion2-inner-right">A <span>2000 sq.ft.</span> large studio space, with
                            collapsible partitions.</div>
                    </div>
                </div>
                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing2.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">02</div>
                        <div class="something-setion2-inner-right"><span>Lush lawn</span> area with natural grass cover.
                        </div>
                    </div>
                </div>

                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing3.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">03</div>
                        <div class="something-setion2-inner-right"><span>Connectivity</span> through Mehrauli-Gurgaon
                            road and Arjan Garh, Delhi metro station.</div>
                    </div>
                </div>


                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing4.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">04</div>
                        <div class="something-setion2-inner-right">Natural, ambient, spot and flood
                            <span>lighting</span>.</div>
                    </div>
                </div>


                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing5.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">05</div>
                        <div class="something-setion2-inner-right">Balanced <span>acoustics</span>, inbuilt speakers,
                            sound mixer and sound proofing.</div>
                    </div>
                </div>


                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing6.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">06</div>
                        <div class="something-setion2-inner-right"><span>WiFi</span> network, ample power outlets and
                            extension cables.</div>
                    </div>
                </div>


                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing7.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">07</div>
                        <div class="something-setion2-inner-right"><span>Wheelchair accessibility </span> and safety for
                            all ages.</div>
                    </div>
                </div>


                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing8.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">08</div>
                        <div class="something-setion2-inner-right">A <span>dedicated support</span> crew with industry
                            knowledge.</div>
                    </div>
                </div>

                <div class="something-setion2-inner">
                    <div class="something-setion2-inner-th">
                        <img src="{{ url('/') }}/images/somthing9.svg">
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">09</div>
                        <div class="something-setion2-inner-right"><span>F&B </span> options to refuel yourself and cater for events.</div>
                    </div>
                </div>
            </div>



        </div>
    </section>
	
	
	  <section class="something-setion">
        <div class="wrapper">
            <div class="something-setion-inner">
                <h3 data-aos="fade-up" data-aos-duration="3000"><span>SOMETHING</span> FOR EVERYONE</h3>
                <h3 data-aos="fade-up" data-aos-duration="3000">SOMETHING <span>FOR</span> EVERYONE</h3>
                <h3 data-aos="fade-up" data-aos-duration="3000">SOMETHING FOR <span>EVERYONE</span></h3>
            </div>


            <div class="something-setion2-main">
                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing1.svg"> -->
                        <div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/cwTtbmUwzPqx2" width="100%" height="100%" style="position:absolute; " frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">01</div>
                        <div class="something-setion2-inner-right">A <span>2000 sq.ft.</span> large studio space, with
                            collapsible partitions.</div>
                    </div>
                </div>
                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/Lush-lawn.gif"> -->
                        <div style="width:100%;height:0;padding-bottom:76%;position:relative;"><iframe src="https://giphy.com/embed/UfxZu5em8jpmw" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">02</div>
                        <div class="something-setion2-inner-right"><span>Lush lawn</span> area with natural grass cover.
                        </div>
                    </div>
                </div>

                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/giphy.webp"> -->
                        <div style="width:100%;height:0;padding-bottom:100%;position:relative;"><iframe src="https://giphy.com/embed/cfuL5gqFDreXxkWQ4o" width="100%" height="100%" style="position:absolute; bottom: 102px;" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">03</div>
                        <div class="something-setion2-inner-right"><span>Connectivity</span> through Mehrauli-Gurgaon
                            road and Arjan Garh, Delhi metro station.</div>
                    </div>
                </div>


                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing4.svg"> -->
                      <div style="width:100%;height:0;padding-bottom:100%;position:relative;"><iframe src="https://giphy.com/embed/5820WG1OLeVJyQjLEJ" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">04</div>
                        <div class="something-setion2-inner-right">Natural, ambient, spot and flood
                            <span>lighting</span>.</div>
                    </div>
                </div>


                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing5.svg"> -->
                     <div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/Y5pJPmh9IWMKc" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">05</div>
                        <div class="something-setion2-inner-right">Balanced <span>acoustics</span>, inbuilt speakers,
                            sound mixer and sound proofing.</div>
                    </div>
                </div>


                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing6.svg"> -->
                        <div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/m2Q7FEc0bEr4I" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">06</div>
                        <div class="something-setion2-inner-right"><span>WiFi</span> network, ample power outlets and
                            extension cables.</div>
                    </div>
                </div>


                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing7.svg"> -->
                        <div style="width:100%;height:0;padding-bottom:74%;position:relative;"><iframe src="https://giphy.com/embed/xc6ijwxQwcPfO" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">07</div>
                        <div class="something-setion2-inner-right"><span>Wheelchair accessibility </span> and safety for
                            all ages.</div>
                    </div>
                </div>


                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing8.svg"> -->
                        <div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/3rgXBrLlRs4ZlpnVDO" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div>
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">08</div>
                        <div class="something-setion2-inner-right">A <span>dedicated support</span> crew with industry
                            knowledge.</div>
                    </div>
                </div>

                <div class="something-setion2-inner" data-aos="fade-up" data-aos-duration="3000">
                    <div class="something-setion2-inner-th">
                        <!-- <img src="images/somthing9.svg"> -->
                       <div style="width:100%;height:0;padding-bottom:75%;position:relative;"><iframe src="https://giphy.com/embed/l41m6difJKi6QRIZO" width="100%" height="100%" style="position:absolute" frameBorder="0" class="giphy-embed" allowFullScreen></iframe></div><
                    </div>
                    <div class="something-setion2-inner-content">
                        <div class="something-setion2-inner-left">09</div>
                        <div class="something-setion2-inner-right"><span>F&B </span> options to refuel yourself and cater for events.</div>
                    </div>
                </div>
            </div>
		
        </div>
    </section>
	</section>
	
	
  <script src='https://cdnjs.cloudflare.com/ajax/libs/stickyfill/2.1.0/stickyfill.min.js'></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	Stickyfill.forceSticky()
Stickyfill.add(document.querySelectorAll('[data-sticky]'));
$(window).scroll(function() {
		var scrollDistance = $(window).scrollTop() - 200;
		$('.page-section').each(function(i) {
				if ($(this).position().top <= scrollDistance) {
						$('.ss2 a.active').removeClass('active');
						$('.ss2 a').eq(i).addClass('active');
				}
		});
}).scroll();

</script>

	
@endsection;

