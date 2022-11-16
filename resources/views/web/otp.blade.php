@extends('web.template')

@section('content')

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


<div class="event-details">
        <div class="inner-wrapper">
            <div class="bktoevent"><a href="{{route('events')}}"><img src="{{ url('/') }}/images/calander-arrow.svg">TICKET DETAILS</a></div>
        </div>
        @if (Session::has('success'))
                <div class="alert alert-success">{{Session::get('success')}}</div>
        @endif
        @if (Session::has('error'))
                <div class="alert alert-danger">{{Session::get('error')}}</div>
        @endif
        <div class="login-form">
            <div class="new_user">
                <h4>Forgot Password?</h4>
                <div class="c_profile">
                    <a href="{{route('user.signup')}}" class="c_btn">Fill the Form</a>
                </div>
            </div>
            <div class="ex-user">
                <h4>Validate Identity</h4>
				
				
				     <form method="post" action="{{route('user.doOTP')}}">
                    <div class="my-form">

                            <div class="f_field">
                                @csrf
                                <input type="text" required name="otp" value="{{$otp}}" placeholder="OTP">
                            </div>
                            <div class="f_field">
                                
                                <input type="password" required name="password"  placeholder="Password">
                            </div>
                            <div class="f_field">
                                
                                <input type="password" required name="new_password" placeholder="Confirm Password">
                            </div>
                            {{-- <div class="f_field">
                                <input type="password" required name="password" placeholder="PASSWORD">
                            </div>
							 <div class="f-passwod">
                            <a href="javascript:;">Forgot Password?</a>
							</div> --}}
                            <div class="f_field">
                                <button type="submit" class="btn btn-success c_btn">SUBMIT</button>
                            </div>
                      

                    </div>
                </form>
				
			
            </div>


            <!--div class="social-login-main">
                <h4 class="hd-after">OR LOG IN WITH</h4>
                <div class="social-login">
                    <div class="social-login-inner">
                       <a href="javascript:;"><img src="images/fb1.png"></a>
                    </div>
                    <div class="social-login-inner">
                        <a href="javascript:;"><img src="images/google.png"></a>
                    </div>
                    <div class="social-login-inner">
                        <a href="javascript:;"><img src="images/tw1.png"></a>
                    </div>
                </div>
                <div class="c_profile">
                    <a href="javascript:;" class="c_btn_hover">SKIP LOGIN</a>
                </div>
            </div-->
        </div>
    </div>






<!--div class="community-outer">
    <div class="wrapper">
        <div class="community-inner community-inner1">
     
            <div class="community-right">
                <h1>Login</h1>
                <p>Reach out if you want to collaborate with us, or simply have a chat.</p>
                <form method="post" action="{{route('user.dologin')}}">
                    <div class="community-form">
                        <div class="form_field">

                            <div class="main_form_field">
                                @csrf
                                <input type="email" required name="email" placeholder="EMAIL">
                            </div>
                            <div class="main_form_field">
                                <input type="password" required name="password" placeholder="PASSWORD">
                            </div>
                            <div class="main_form_field">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </div>

                    </div>
                </form>
            </div>
        </div>
    </div>
</div-->





<!-- 
<div class="community-outer">
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
</div> -->
@endsection;
@section('scripts')
@endsection;

