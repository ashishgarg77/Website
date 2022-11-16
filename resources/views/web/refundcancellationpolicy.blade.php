@extends('web.template')

@section('content')
<style>

.pp_inner{
	padding-top:150px;
}
.pp_inner h1{
	    color: #000;
    font-size: 40px;
    line-height: 50px;
    font-family: 'ZoomProNormalMedium';
	margin-bottom:20px;
}

.pp_inner p{
	font-size: 18px;
    font-family: 'Work Sans', sans-serif;
}
.pp_inner ul{
	padding-left:20px;
}
.pp_inner ul li{
	font-size: 18px;
    font-family: 'Work Sans', sans-serif;
    padding:5px 0;
}
.last-update1{
	color: #D23A3D;
    font-family: 'ZoomProWideMedium';
	font-size:20px;
	margin-bottom:20px;
}
.last-update{
	color: #000;
    font-family: 'ZoomProWideMedium';
	font-size:20px;
	margin-bottom:20px;
}
.pp_inner h2{
	color: #D23A3D;
    font-size: 30px;
    line-height: 40px;
    font-family: 'ZoomProNormalMedium';
	margin-bottom:20px;
	margin-top:20px;
}

.pp_inner h4{
	color: #000;
    font-size: 20px;
    line-height: 30px;
    font-family: 'ZoomProNormalMedium';
	margin-bottom:20px;
	margin-top:20px;
}

@media screen and (max-width:767px){
	.pp_inner h1{
    font-size: 30px;
    line-height: 40px;
}
.pp_inner p, .pp_inner ul li{
font-size: 16px;}
.pp_inner h2{
	font-size:25px;
	line-height:35px;
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

   <div class="megamenu">
                <header>
                    <div class="logo"><a href="{{route('home')}}"><img src="{{ url('/') }}/images/logo.svg" alt="logo" /></a></div>
                    <div class="trigger close"><a href="javascript:;">
                           <img src="{{ url('/') }}/images/menu-close.svg">
                        </a></div>
                </header>
                <div class="megamenu-inner">
                    <div class="m-menu">
                        <a href="{{route('home')}}">HOME</a>
                        <a href="{{route('events')}}">CALENDAR</a>
                        <a href="{{route('connect')}}">CONNECT</a>
                        <a href="https://www.instagram.com/studioekko/" target="_blank">INSTAGRAM</a>
                    </div>
                </div>
            </div>




<section class="pp">
<div class="wrapper">

<div class="pp_inner">
<h1>Refund & Cancellation Policy </h1>


 <p>Since the Website offers non-tangible, irrevocable goods we do not
provide refunds after the product is purchased, which you acknowledge
prior to purchasing any product on the Website. Please make sure that
you've carefully read service description before making a purchase.
</p>
   <p>We will offer a refund only incase of the event being canceled on our end. </p> 
<h4>Contacting us</h4>
<p>If you have any questions, concerns, or complaints regarding this refund<br/>
policy, we encourage you to contact us using the details below:<br/>
<a href="tel:info@studioekko.com">info@studioekko.com</a></p>
<p>This document was last updated on October 15, 2022
</p>
</div>


</div>



</section>






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





@endsection;

