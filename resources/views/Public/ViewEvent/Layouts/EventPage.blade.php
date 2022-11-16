<!DOCTYPE html>
<html lang="{{ Lang::locale() }}">
<head>
   
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Ekko</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="shortcut icon" href="{{ url('/') }}/images/ekkoeavicon.svg" />
<link
    href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap"
    rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@100;300;400;500;600;700&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://kit.fontawesome.com/0ae84d8b4a.js" crossorigin="anonymous"></script>
<link rel="stylesheet" href="{{ url('/') }}/css/owl.carousel.min.css?v=<?php echo date("s");?>" />
<link rel="stylesheet" href="{{ url('/') }}/css/owl.theme.default.min.css?v=<?php echo date("s");?>" />
<link rel="stylesheet" href="{{ url('/') }}/css/fonts.css?v=<?php echo date("s");?>" />
  <link rel="stylesheet" href="{{ url('/') }}/css/style.css?v=125" />
<link rel="stylesheet" href="{{ url('/') }}/css/responsive.css?v=<?php echo date("s");?>"/>
 <link rel="stylesheet" href="{{ url('/') }}/css/responsive_v.css?v=119" />
 
 <style>
body{ position:relative;} 
</style>
 
</head>
<body class="white-bg">

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

        <div id="event_page_wrap" vocab="http://schema.org/" typeof="Event">
            @yield('content')
        </div>

        @include("Shared.Partials.LangScript")
        {!!Html::script(config('attendize.cdn_url_static_assets').'/assets/javascript/frontend.js')!!}

        
     
<footer id="footer">
    <div class="wrapper">
        <div class="footer-top-outer">
            <div class="footer-top">
                <div class="footer-top-left w40">
                    <div class="subscribe">
                        <h4>Sign up for updates</h4>
                        <form id="subscribed" method="post" action="{{route('saveSubscription')}}">
                            @csrf

                            <div class="subscribe-form">
                                <div class="inputfield">
                                    <input type="text" class="required" id="subsribeinput" name="subscribe" placeholder="TYPE YOUR EMAIL HERE">
                                </div>
                                <div class="submitbtn">
                                    <button type="button" id='subscribedbtn'><img src="{{ url('/') }}/images/footer-sc1.svg" class="footer-sc1"></button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="address for-desktop">
                        <div class="address-left">
                            Global Avenue 2, Mehrauli-<br />Gurgaon Rd, Aya Nagar,<br /> New Delhi, Delhi 110047
                        </div>
                        <div class="address-right">
                            <a href="https://goo.gl/maps/eRXLCzMh3qcrYo7b9" target="_blank"><img src="{{ url('/') }}/images/footer-sc2.svg" class="footer-sc1"></a>
                        </div>
                    </div>
                </div>
                <div class="footer-top-left w40">
                    <div class="getintouch">
                        <h4>Get in touch or<br /> chat with us</h4>
                        <div class="address-right">
                                <a href="https://wa.me/9149087149?text=I'm%20interested%20" target="_blank"><img src="{{ url('/') }}/images/footer-sc1.svg" class="footer-sc1"></a>
                            </div>
                    </div>
                    <div class="getintouchemail">
                        <h4><a href="mailto:info@studioekko.com">info@studioekko.com</a></h4>
                        <h4><a href="tel:+91 98101 67149">+91 98101 67149</a></h4>
                    </div>
                </div>
				 <div class="address for-mobile">
				 <div class="address-mobile-inner">
                        <div class="address-left">
                            Global Avenue 2, Mehrauli-<br />Gurgaon Rd, Aya Nagar,<br /> New Delhi, Delhi 110047
                        </div>
                        <div class="address-right">
                            <a href="https://goo.gl/maps/eRXLCzMh3qcrYo7b9" target="_blank"><img src="{{ url('/') }}/images/footer-sc2.svg" class="footer-sc1"></a>
                        </div>
						</div>
                    </div>
				<div class="copy-right2 mobile-only">
                    <ul>
                        <li><a href="https://www.instagram.com/studioekko/" target="_blank">INSTAGRAM</a></li>
                        <li><a href="https://www.facebook.com/studioekko/" target="_blank">FACEBOOK</a></li>
                        <li><a href="https://www.linkedin.com/company/studioekko/about/" target="_blank">LINKEDIN</a></li>
                    </ul>
                </div>  
            </div>
        </div>
       <div class="copyright"> 
                <div class="copy-right1">
                    <!-- <i class="fa fa-copyright" aria-hidden="true"></i> 2022 Studio Ekko -->
                    <img src="{{ url('/') }}/images/cb1.svg">
                </div>
                <div class="copy-right2 desktop-only">
                    <ul>
                        <li><a href="https://www.instagram.com/studioekko/" target="_blank">INSTAGRAM</a></li>
                        <li><a href="https://www.facebook.com/studioekko/" target="_blank">FACEBOOK</a></li>
                        <li><a href="https://www.linkedin.com/company/studioekko/about/" target="_blank">LINKEDIN</a></li>
                    </ul>
                </div>
                <div class="copy-right3">
                    <!-- made with <img src="images/heart.png" /> By studio Snow Show -->
                    <a href="https://studiosnowshow.com/" target="_blank"><img src="{{ url('/') }}/images/cb2.svg"></a>
                </div>
            </div>
    </div>
</footer>

<script>

$(function(){
	$('.ad_hidebuyer').click(function(){
		$('.add_buyer-main-new1, .checkout_create_hd1').hide();
		$('.add_buyer-main-new').show();
	})
	
	$('.add_more-buyer_first').click(function(){
		$(this).hide();
		$('.s_add1').show();
	})
	$(document).on('click','.add_more-buyer', function(){
		$(this).hide();
		$(this).parent().next('.panel').show();
	})
	
	    $('.trigger').on('click', () =>{
        $('.megamenu').show();
        $('body').css({'overflow':'hidden'})
    })

    $('.trigger.close').on('click', () =>{
        $('.megamenu').hide();
        $('body').css({'overflow-y':'auto'})

    })
    $('.menu_inClick').on('click', () =>{
        $('.menu_in').slideToggle();

    })

})

</script>

</body>
</html>
