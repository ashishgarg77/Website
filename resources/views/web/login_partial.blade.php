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
                <h4>NEW USER?</h4>
                <div class="c_profile">
                    <a href="{{route('user.signup')}}" class="c_btn">Create profile</a>
                </div>
            </div>
            <div class="ex-user">
                <h4>EXISTING USER</h4>
				
				
				     <form method="post" action="{{route('user.dologin')}}">
                    <div class="my-form">

                            <div class="f_field">
                                @csrf
                                <input type="email" required name="email" placeholder="Email">
                            </div>
                            <div class="f_field">
                                <input type="password" required name="password" placeholder="Password">
                            </div>
							 <div class="f-passwod">
                            <a href="{{route('user.forgotPassword')}}">Forgot Password?</a>
							</div>
                            <div class="f_field">
                                <button type="submit" class="btn btn-success c_btn">SIGN IN</button>
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
