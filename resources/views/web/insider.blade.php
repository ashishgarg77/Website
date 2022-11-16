@extends('web.template')

@section('content')
<style>
body{
	background:#fff !important;
}
     html, body {
    overflow: hidden;
    height: 104%;
    min-height: 104%;
}

#section-wrapper {
    position: relative;
    width: 100%;
     height: 100%;
    min-height: 100%;
}

div.section {
    width: 100%;
    position: relative;
     height: 100%;
    min-height: 100%;
}
.footer-top-outer{
	margin-top:0 !important;
}

#footer{
	display:none;
}
#section-3 #footer{
	display:block;
}
#section-3{
	background: #000;
}
@media screen and (max-width:990px){
	#section-wrapper, div.section{
		height:auto !important;
		 min-height:auto !important;
	}
	body{
		overflow:auto !important;
		 min-height:auto !important;
	}
}



</style>
<section class="home-banner">
        <header>
            <div class="logo"><a href="javascript:;"><img src="{{ url('/') }}/images/logo-black.svg" alt="logo" /></a></div>
            <div class="trigger trigger-black"><a href="javascript:;">
                    <span></span>
                    <span></span>
                </a></div>
        </header>
</section>

<div class="event-spacer"></div>



<div id="section-wrapper">

<div class="community-outer community-outer-new1 section" id="section-1">
    <div class="wrapper">
        <div class="community-inner community-inner1">
            <div class="community-left">
                <img src="images/connect1-banner.png">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
            </div>
            <div class="community-right">
                <h1><span>Join</span> the<br/> community!</h1>
                <p>Reach out if you want to collaborate with us, or simply have a chat.</p>
                <form>
                    <div class="community-form">
                    <div class="form_field">
                        <div class="main_form_field">
                            <input type="text" Nmae="fname" placeholder="NAME">
                        </div>
                        <div class="main_form_field">
                            <input type="email" Nmae="fname" placeholder="EMAIL">
                        </div>
                        <div class="main_form_field">
                            <input type="tel" Nmae="fname" placeholder="PHONE">
                        </div>
                    </div>
                    <div class="form_field">
                        <h4>MESSAGE</h4>
                        <div class="main_form_field main_form_field_teaxtarea">
                        <textarea></textarea>
                        </div>
                        <div class="form-field-submit">
                            <button type="submit"><img src="images/contact-submit1.svg" style="width:70px"></button>
                        </div>
                    </div>
                </div>
                </form>
            </div>
        </div>
    </div>
</div>




<div class="community-outer community-outer-new2 section" id="section-2">
    <div class="wrapper">
        <div class="community-inner">
            <div class="community-left">
                <img src="images/Union.png">
                <div class="scroll-down">
                   <span> SCROLL DOWN</span>
                </div>
            </div>
            <div class="community-right">
                <h1><span>Run</span> the<br/> community!</h1>
                <p>We’re looking for fresh graduates, interns, volunteers and <br/> enthusiasts to join our growing team. For full details, check<br/> out our job post <strong>here</strong> or write to us at <strong>info@studioekko.com</strong></p>
                

                <div class="community-contact">
                    <div class="community-contact1"><a href="mailto:info@studioekko.com"><span class="sin">info@studioekko.com</span>
                        <img src="images/link-arrow.png">
                    </a></div>
                    <div class="community-contact1"><a href="https://wa.me/+919149087149?text=I'm%20interested%20"><span class="sin">+91 91490 87149</span>  <img src="images/link-arrow.png"></a>
                    <span class="what">WHATSAPP</span></div>

                </div>
            </div>
        </div>
    </div>
</div>





<div class="section" id="section-3">
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
                    <div class="address">
                        <div class="address-left">
                            Global Avenue 2,Mehrauli-<br />Gurgaon Rd, Aya Nagar,<br /> New Delhi, Delhi 110047
                        </div>
                        <div class="address-right">
                            <a href="javascript:;"><img src="{{ url('/') }}/images/footer-sc2.svg" class="footer-sc1"></a>
                        </div>
                    </div>
                </div>
                <div class="footer-top-left w40">
                    <div class="getintouch">
                        <h4>Get in touch or<br /> chat with us</h4>
                        <div class="address-right">
                                <a href="javascript:;"><img src="{{ url('/') }}/images/gt.png"></a>
                            </div>
                    </div>
                    <div class="getintouchemail">
                        <h4><a href="mailto:info@studioekko.com">info@studioekko.com</a></h4>
                        <h4><a href="tel:+91 91490 87149">+91 91490 87149</a></h4>
                    </div>
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
                        <li><a href="javascript:;">INSTAGRAM</a></li>
                        <li><a href="javascript:;">FACEBOOK</a></li>
                        <li><a href="javascript:;">LINKEDIN</a></li>
                    </ul>
                </div>
                <div class="copy-right3">
                    <!-- made with <img src="images/heart.png" /> By studio Snow Show -->
                    <img src="{{ url('/') }}/images/cb2.svg">
                </div>
            </div>
    </div>
</footer>
</div>



</div>




@endsection;
@section('scripts')
@endsection;

