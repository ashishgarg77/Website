@extends('web.template')

@section('content')
<style>
/*body{
	background:#fff !important;
	height: calc(100% + 25px) !important;
	overflow:hidden;
}
.community-outer{
	    height: 100%;
  width: 100%;
}
.section {
  width: 100%;
  height: calc(100vh + 25px);
}

ul.content_new-patch li {
  display: block;
  height: 100%;
  width: 100%;
}
.footer-top-outer{
	margin-top:0;
}
.event-spacer{
	display:none;
}
.third, .second{
	padding:100px 0;
}
*/

body{
	background:#fff !important;
}
main {
  display: flex;
}

.parent {
  flex: 1;
  display: flex;
  flex-flow: row nowrap;
  align-items: flex-start;
  overflow: visible;
  padding:0 0 200px;
}
.parent-sticky .sticky {
  position: sticky;
}
.parent-overflow {
  /*height: 1000px;*/
  overflow: hidden;
}
.parent-worst .content, .parent-worst .sticky {
}
.parent-best .content, .parent-best .sticky {
  color: black;
}

.sticky {
  width: calc(100% - 100px) !important;
  top:100px;
  padding-top:20px;

}
.sticky.current{
	 width: calc(100% - 200px) !important;
}

.content {
  flex: 1;
  width:0% !important;
  opacity:0;
}
	.page-section{height: 280px; overflow:hidden; }
	.page-section + .page-section{height: 1000px; overflow:hidden; }
	.ss2{ position: relative; transition: all 0.7s; }
	.ss2 .navigation__link{position: absolute; opacity:0; font-size: 20px; transition: all 0.7s;}
	.ss2 .navigation__link.active{
		opacity:1;
		transition: all 0.7s; 
	}
	.content, .parent-overflow{
		height:auto;
	}
	
	.community-left{
		width:100%;
	}
	.community-right{
		width:100%;
		padding-left:75px;
	}
.navigation__link{
	color:#000;
}

.second .scroll-down span::before {
	background: url(../images/red-ddt.svg) no-repeat center left;
  
}	

.second .scroll-down span::after {
    background: url(../images/black-ddt.svg) no-repeat center left;
}	

.page-section.hero + .page-section{
	padding-top:100px;
}

.navigation__link{
	display:flex;
	width:100%;
}
.navigation__link{
	text-decoration:none;
} 

.navigation__link .community-left{
	width:400px;
}
.navigation__link .community-right{
	width:calc(100% - 400px); 
}

.content .community-right{
	width:0 !important;;
	padding:0 !important;
}

@media screen and (min-width:1920px){
	.navigation__link .community-left{
	width:600px;
}
.navigation__link .community-right{
	width:calc(100% - 600px); 
}
.page-section + .page-section{height: 1000px; overflow:hidden; }
	
}

	
</style>
<section class="home-banner">
        <header>
            <div class="logo"><a href="{{route('home')}}"><img src="{{ url('/') }}/images/logo-black.svg" alt="logo" /></a></div>
            <div class="trigger trigger-black"><a href="javascript:;">
                    <span></span>
                    <span></span>
                </a></div>
        </header>
</section>
@if (Session::has('success'))
<div class="alert alert-success">{{Session::get('success')}}</div>
@endif
@if (Session::has('error'))
<div class="alert alert-danger">{{Session::get('error')}}</div>
@endif
<div class="event-spacer"></div>


<div class="content_new-patch show_onmobile">

<div class="community-outer">
    <div class="wrapper">
        <div class="community-inner community-inner1">
            <div class="community-left">
                <img src="{{ url('/') }}/images/connect1.jpg">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
            </div>
            <div class="community-right">
                <h1><span>Join</span> the<br> community!</h1>
                <p>Reach out if you want to collaborate with us, or simply have a chat.</p>
                <form method="post" action="{{route('mail.post')}}">
                    @csrf
                    <div class="community-form">
                    <div class="form_field">
                        <div class="main_form_field">
                            <input type="text" name ="name" required placeholder="NAME">
                        </div>
                        <div class="main_form_field">
                            <input type="email" name="email" required placeholder="EMAIL">
                        </div>
                        <div class="main_form_field">
                            <input type="tel" name="phone)number" required placeholder="PHONE">
                        </div>
                    </div>
                    <div class="form_field">
                        <h4>MESSAGE</h4>
                        <div class="main_form_field main_form_field_teaxtarea">
                        <textarea name="msg" required></textarea>
                        </div>
                        <div class="form-field-submit">
                            <button type="submit"><img src="{{ url('/') }}/images/footer-sc1.svg" class="svn1"></button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="community-outer second">
    <div class="wrapper">
        <div class="community-inner">
            <div class="community-left">
                <img src="{{ url('/') }}/images/connect2.jpg">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
            </div>
            <div class="community-right">
                <h1><span>Run</span> the<br> community!</h1>
                <p>We’re looking for fresh graduates, interns, volunteers and <br> enthusiasts to join our growing team. <a class="cp_link" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">For full details</a>, check<br> out our job post <strong><a class="alink" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">here</a></strong> or write to us at <strong><a class="alink" href="mailto:info@studioekko.com">info@studioekko.com</a></strong></p>
                

                <div class="community-contact">
                    <div class="community-contact1"><a href="mailto:info@studioekko.com"><span class="sin">info@studioekko.com</span>
                        <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn">
                    </a></div>
                    <div class="community-contact1"><a href="https://wa.me/+919810167149?text=I'm%20interested%20" target="_blank"><span class="sin">+91 98101 67149</span>  <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn"></a>
                    <span class="what">WHATSAPP</span></div>

                </div>
            </div>
        </div>
    </div>
</div>





</div>


<div class="mob-nw_hide">
<div class="content_new-patch">
<div class="community-outer">
    <div class="wrapper">
        <div class="community-inner">
<div class="parent parent-overflow parent-best">
		<div class="sticky" data-sticky="150">
			
			<div class="ss2">
				<div class="navigation__link active" href="#1">
				    <div class="community-left">
                <img src="{{ url('/') }}/images/connect1.jpg">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
				</div>
				
				 <div class="community-right">
                <h1><span>Join</span> the<br> community!</h1>
                <p>Reach out if you want to collaborate with us, or simply have a chat.</p>
                <form method="post" action="{{route('mail.post')}}">
                    @csrf
                    <div class="community-form">
                    <div class="form_field">
                        <div class="main_form_field">
                            <input type="text" name ="name" required placeholder="NAME">
                        </div>
                        <div class="main_form_field">
                            <input type="email" name="email" required placeholder="EMAIL">
                        </div>
                        <div class="main_form_field">
                            <input type="tel" name="phone)number" required placeholder="PHONE">
                        </div>
                    </div>
                    <div class="form_field">
                        <h4>MESSAGE</h4>
                        <div class="main_form_field main_form_field_teaxtarea">
                        <textarea name="msg" required></textarea>
                        </div>
                        <div class="form-field-submit">
                            <button type="submit"><img src="{{ url('/') }}/images/footer-sc1.svg" class="svn1"></button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
			
			
				
				</div>
				<div class="navigation__link second" href="#2">
				 <div class="community-left">
                <img src="{{ url('/') }}/images/connect2.jpg">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
            </div>
			
			 	    <div class="community-right">
                <h1><span>Run</span> the<br> community!</h1>
                <p>We’re looking for fresh graduates, interns, volunteers and <br> enthusiasts to join our growing team. <a class="cp_link" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">For full details</a>, check<br> out our job post <strong><a class="alink" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">here</a></strong> or write to us at <strong><a class="alink" href="mailto:info@studioekko.com">info@studioekko.com</a></strong></p>
                

                <div class="community-contact">
                    <div class="community-contact1"><a href="mailto:info@studioekko.com"><span class="sin">info@studioekko.com</span>
                        <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn">
                    </a></div>
                    <div class="community-contact1"><a href="https://wa.me/+919810167149?text=I'm%20interested%20" target="_blank"><span class="sin">+91 98101 67149</span>  <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn"></a>
                    <span class="what">WHATSAPP</span></div>

                </div>
            </div>
				</div>
	</div>
		</div>
		<div class="content">
			<div class="page-section hero" id="1">
				   <div class="community-right">
                <h1><span>Join</span> the<br> community!</h1>
                <p>Reach out if you want to collaborate with us, or simply have a chat.</p>
                <form method="post" action="{{route('mail.post')}}">
                    @csrf
                    <div class="community-form">
                    <div class="form_field">
                        <div class="main_form_field">
                            <input type="text" name ="name" required placeholder="NAME">
                        </div>
                        <div class="main_form_field">
                            <input type="email" name="email" required placeholder="EMAIL">
                        </div>
                        <div class="main_form_field">
                            <input type="tel" name="phone)number" required placeholder="PHONE">
                        </div>
                    </div>
                    <div class="form_field">
                        <h4>MESSAGE</h4>
                        <div class="main_form_field main_form_field_teaxtarea">
                        <textarea name="msg" required></textarea>
                        </div>
                        <div class="form-field-submit">
                            <button type="submit"><img src="{{ url('/') }}/images/footer-sc1.svg" class="svn1"></button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
	</div>
	<div class="page-section" id="2">
				    <div class="community-right">
                <h1><span>Run</span> the<br> community!</h1>
                <p>We’re looking for fresh graduates, interns, volunteers and <br> enthusiasts to join our growing team. <a class="cp_link" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">For full details</a>, check<br> out our job post <strong><a class="alink" href="https://docs.google.com/forms/d/e/1FAIpQLSfiGGcAoGarnjLkIF9CUIPuq4XmR1kzlAQeoCJlTgoBtFcBLA/viewform" target="_blank">here</a></strong> or write to us at <strong><a class="alink" href="mailto:info@studioekko.com">info@studioekko.com</a></strong></p>
                

                <div class="community-contact">
                    <div class="community-contact1"><a href="mailto:info@studioekko.com"><span class="sin">info@studioekko.com</span>
                        <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn">
                    </a></div>
                    <div class="community-contact1"><a href="https://wa.me/+919810167149?text=I'm%20interested%20" target="_blank"><span class="sin">+91 98101 67149</span>  <img src="{{ url('/') }}/images/footer-sc1.svg" class="svn"></a>
                    <span class="what">WHATSAPP</span></div>

                </div>
            </div>
	</div>

		</div>
	</div>





        
         
        </div>
    </div>
</div>






</div>

</div>







@endsection;



@section('scripts')


<script  src="{{ url('/') }}/js/ss2.js" type="text/javascript"></script>
<script  src="{{ url('/') }}/js/ss.js" type="text/javascript"></script>
<!--script>
$(function() {
	var windowWidth = $(window).width();
	if(windowWidth > 1100){
					animejsPlugins.scrollContainer({
			  sectionSelector: '.section',
			  wrapperSelector: '.sections',
			  duration: 1000,
			  easing: 'easeInOutQuad',
			  onBegin: (index, anime) => {
				disappear()
			  },
			  onComplete: (index, anime) => {
				appear(index);
			  } 
			})

			function appear(index) {
			  anime({
				targets: `.section:nth-child(${index}) h1`,
				opacity: [0, 1],
				duration: anime.random(300, 600),
				easing: 'easeInOutQuad'
			  })
			}

			function disappear() {
			  anime({
				targets: `h1`,
				opacity: [1, 0],
				duration: anime.random(200, 400),
				easing: 'easeInOutQuad'
			  })
			}
		
	}
	});
</script-->


<script src='https://cdnjs.cloudflare.com/ajax/libs/stickyfill/2.1.0/stickyfill.min.js'></script>

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
	Stickyfill.forceSticky()
Stickyfill.add(document.querySelectorAll('[data-sticky]'));
Stickyfill.add(document.querySelectorAll('[data-sticky]'));
$(window).scroll(function() {
	
if ($('.sticky').css('position') === 'fixed') {
    $('.sticky').addClass('current');
}else{
	 $('.sticky').removeClass('current');
}
	
	
		var scrollDistance = $(window).scrollTop() + 100 ;
		$('.page-section').each(function(i) {
				if ($(this).position().top <= scrollDistance) {
					$('.sticky').addClass('active')
						$('.ss2 .navigation__link.active').removeClass('active');
						$('.ss2 .navigation__link').eq(i).addClass('active');
				}
		});
}).scroll();

</script>


@endsection;

