
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
    <link rel="stylesheet" href="{{ url('/') }}/css/owl.carousel.min.css" />
    <link rel="stylesheet/less" type="text/css" href="{{ url('/') }}/css/clndr.less" />
    <link rel="stylesheet" href="{{ url('/') }}/css/owl.theme.default.min.css?v=<?php echo date("s");?>" />
    <link rel='stylesheet' href="{{ url('/') }}/css/flatpickr.min.css?v=<?php echo date("s");?>">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css" />
    <link rel="stylesheet" href="{{ url('/') }}/css/events-style.css?v=<?php echo date("s");?>" />
    <link rel="stylesheet" href="{{ url('/') }}/css/fonts.css?v=<?php echo date("s");?>" />
    <link rel="stylesheet" href="{{ url('/') }}/css/style.css?v=152" />
    <link rel="stylesheet" href="{{ url('/') }}/css/responsive.css?v=61" /> 
	 <link rel="stylesheet" href="{{ url('/') }}/css/responsive_v.css?v=178" />

      
</head>
<body class="{{ $class }}">  



<!--div class="my-loadder">
<div class="loadding-logo">
<img src="{{ url('/') }}/images/logo.svg" alt="logo" />
</div>
</div-->



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


@yield('content')

<footer id="footer" class="mydiv">
    <div class="wrapper" id="footern">
	
						<div class="footerlink_main">
<ul>
<li><a href="{{route('privacypolicy')}}">Privacy Policy</a></li>
<li><a href="{{route('termsandconditions')}}">Terms and Conditions</a></li>
<li><a href="{{route('refundcancellationpolicy')}}">Refund Cancellation</a></li>
</ul></div>
	
	
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



<div class="mychatbot">
<div class="mychatbot-inner" style="width:auto; border-radius: 32px;">
<a href="https://wa.me/+919810167149?text=I'm%20interested%20" target="_blank"><svg viewBox="0 0 90 90" fill="#4FCE5D"><path d="M90,43.841c0,24.213-19.779,43.841-44.182,43.841c-7.747,0-15.025-1.98-21.357-5.455L0,90l7.975-23.522   c-4.023-6.606-6.34-14.354-6.34-22.637C1.635,19.628,21.416,0,45.818,0C70.223,0,90,19.628,90,43.841z M45.818,6.982   c-20.484,0-37.146,16.535-37.146,36.859c0,8.065,2.629,15.534,7.076,21.61L11.107,79.14l14.275-4.537   c5.865,3.851,12.891,6.097,20.437,6.097c20.481,0,37.146-16.533,37.146-36.857S66.301,6.982,45.818,6.982z M68.129,53.938   c-0.273-0.447-0.994-0.717-2.076-1.254c-1.084-0.537-6.41-3.138-7.4-3.495c-0.993-0.358-1.717-0.538-2.438,0.537   c-0.721,1.076-2.797,3.495-3.43,4.212c-0.632,0.719-1.263,0.809-2.347,0.271c-1.082-0.537-4.571-1.673-8.708-5.333   c-3.219-2.848-5.393-6.364-6.025-7.441c-0.631-1.075-0.066-1.656,0.475-2.191c0.488-0.482,1.084-1.255,1.625-1.882   c0.543-0.628,0.723-1.075,1.082-1.793c0.363-0.717,0.182-1.344-0.09-1.883c-0.27-0.537-2.438-5.825-3.34-7.977   c-0.902-2.15-1.803-1.792-2.436-1.792c-0.631,0-1.354-0.09-2.076-0.09c-0.722,0-1.896,0.269-2.889,1.344   c-0.992,1.076-3.789,3.676-3.789,8.963c0,5.288,3.879,10.397,4.422,11.113c0.541,0.716,7.49,11.92,18.5,16.223   C58.2,65.771,58.2,64.336,60.186,64.156c1.984-0.179,6.406-2.599,7.312-5.107C68.398,56.537,68.398,54.386,68.129,53.938z"></path></svg></a>
</div>

</div>



<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bodymovin/5.6.6/lottie.min.js'></script>
    <script src="https://unpkg.com/@lottiefiles/lottie-player@latest/dist/lottie-player.js"></script>
<script src="https://unpkg.com/@lottiefiles/lottie-interactivity@latest/dist/lottie-interactivity.min.js"></script>

    <script>
        LottieInteractivity.create({
            player: '#firstLottie',
            mode: 'scroll',
            actions: [
                {
                    visibility:[0, 1.0],
                    type: 'seek',
                    frames: [0, 300],
                },
            ]
        });
        </script>
<!-- <script src="js/jquery.min.js"></script> -->
<script src="{{ url('/') }}/js/owl.carousel.js"></script>
<!-- <script src="js/stickySidebar.js"></script> -->
<script media="screen and (min-width: 990px)" src="{{ url('/') }}/js/scroll-animation.js?v=4"></script>
<!--script media="screen and (min-width: 990px)" src="{{ url('/') }}/js/gsap-latest-beta.min.js?r=5426"></script>
<script media="screen and (min-width: 990px)" src="{{ url('/') }}/js/ScrollTrigger.min.js?v=3.3"></script>
 <script media="screen and (min-width: 990px)"  src="{{ url('/') }}/js/scroll.js" ></script-->
<script src="{{ url('/') }}/js/custom.js?v=232"></script>

<script src="/js/events/less.js" type="text/javascript"></script>
<!--<![endif]-->

<script src="{{ url('/') }}/js/events/prism.js" type="text/javascript"></script>
<script src="{{ url('/') }}/js/events/underscore.js" type="text/javascript"></script>
<script src="{{ url('/') }}/js/events/moment.js" type="text/javascript"></script>
<script src="{{ url('/') }}/js/events/clndr.js" type="text/javascript"></script>
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
<script src="{{ url('/') }}/js/site.js" type="text/javascript"></script>
<!-- <script src="js/script-scroll.js"></script> -->
<script>
AOS.init({disable: 'mobile'});



     $(document).ready(function () {
		
    $(document).on("scroll", onScroll);
    
    //smoothscroll
    $('#nav-links a[href^="#"]').on('click', function (e) {
        e.preventDefault();
        $(document).off("scroll");
        
        $('a').each(function () {
            $(this).removeClass('active');
        })
        $(this).addClass('active');
      
        var target = this.hash,
            menu = target;
        $target = $(target);
        $('html, body').stop().animate({
            'scrollTop': $target.offset().top + 100
        }, 500, 'swing', function () {
            window.location.hash = target;
            $(document).on("scroll", onScroll);
        });
    });
});

function onScroll(event){
    var scrollPos = $(document).scrollTop() + 200;
    $('#nav-links a').each(function () {
        var currLink = $(this);
        var refElement = $(currLink.attr("href"));
        if (refElement.position().top <= scrollPos && refElement.position().top + refElement.height() > scrollPos) {
            $('#nav-links li a').removeClass("active");
            currLink.addClass("active");
        }
        else{
            currLink.removeClass("active");
        }
    });
}



      /*  gsap.utils.toArray(".comparisonSection").forEach(section => {
        let tl = gsap.timeline({
                scrollTrigger: {
                    trigger: section,
                    start: "center center",
            // makes the height of the scrolling (while pinning) match the width, thus the speed remains constant (vertical/horizontal)
                    end: () => "+=" + section.offsetWidth, 
                    scrub: true,
                    pin: true,
            anticipatePin: 1
                },
                defaults: {ease: "none"}
            });
        tl.fromTo(section.querySelector(".afterImage"), { xPercent: 50, x: 0}, {xPercent: 0})
        // ...and the image the opposite way (at the same time)
        .fromTo(section.querySelector(".afterImage img"), {xPercent: -100, x: 0}, {xPercent: 0}, 0);
    });

*/

var aud11 = document.getElementById("video11");
var audn12 = document.getElementById("video12");
var aud13 = document.getElementById("video13");
var aud14 = document.getElementById("video14");
aud11.onended = function() {
    //alert('video12 play')
    $("#video12").parent().addClass('active');
    $("#video11").parent().removeClass('active');
    $("#video12").get(0).play();
    $("#video11").hide()
    $("#video13").get(0).pause();
    $("#video13").show();
};

audn12.onended = function() {
    //alert('video13 play')
    $("#video13").parent().addClass('active');
    $("#video12").parent().removeClass('active');
    $("#video13").get(0).play()
    $("#video14").get(0).pause();
    $("#video14").show();
    $("#video12").hide()
};
aud13.onended = function() {
    //alert('video14 play')
    $("#video14").parent().addClass('active');
    $("#video13").parent().removeClass('active');
    $("#video14").get(0).play();
    $("#video11").get(0).pause();
    $("#video11").show();
    $("#video13").hide()
};
aud14.onended = function() {
   // alert('video15 play')
    $("#video11").parent().addClass('active');
    $("#video14").parent().removeClass('active');
    $("#video11").get(0).play()
    $("#video12").get(0).pause();
    $("#video12").show();
    $("#video14").hide()
};








function loadfunnction(){
	$('.my-loadder').hide();
	$('body').removeClass('acc_load')
}




</script>



@yield('scripts')
</body>
</html>
