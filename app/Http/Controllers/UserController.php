<?php

namespace App\Http\Controllers;

use App\Mail\SendOTP;
use App\Models\User;
use App\OrderOwner;
use App\Rules\Passcheck;
use Auth;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Mail;
use Validator;

class UserController extends Controller
{
    /**
     * Show the edit user modal
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function showEditUser()
    {
        $data = [
            'user' => Auth::user(),
        ];

        return view('ManageUser.Modals.EditUser', $data);
    }

    /**
     * Updates the current user
     *
     * @param Request $request
     * @return mixed
     */
    public function postEditUser(Request $request)
    {
        $rules = [
            'email'        => [
                'required',
                'email',
                'unique:users,email,' . Auth::user()->id . ',id,account_id,' . Auth::user()->account_id
            ],
            'password'     => [new Passcheck],
            'new_password' => ['min:8', 'confirmed', 'required_with:password'],
            'first_name'   => ['required'],
            'last_name'    => ['required'],
        ];

        $messages = [
            'email.email'         => trans("Controllers.error.email.email"),
            'email.required'      => trans("Controllers.error.email.required"),
            'password.passcheck'  => trans("Controllers.error.password.passcheck"),
            'email.unique'        => trans("Controllers.error.email.unique"),
            'first_name.required' => trans("Controllers.error.first_name.required"),
            'last_name.required'  => trans("Controllers.error.last_name.required"),
        ];

        $validation = Validator::make($request->all(), $rules, $messages);

        if ($validation->fails()) {
            return response()->json([
                'status'   => 'error',
                'messages' => $validation->messages()->toArray(),
            ]);
        }

        $user = Auth::user();

        if ($request->get('password')) {
            $user->password = Hash::make($request->get('new_password'));
        }

        $user->first_name = $request->get('first_name');
        $user->last_name = $request->get('last_name');
        $user->email = $request->get('email');

        $user->save();

        return response()->json([
            'status'  => 'success',
            'message' => trans("Controllers.successfully_saved_details"),
        ]);
    }


    public function login(Request $request){
        $class ='white-bg';
        return view('web.login',compact('class'));
    }

    public function doLogin(Request $request){
        // dd($request->all());
        $email = $request->email;
        $password = $request->password;
        $attempt = Auth::guard('attendee')->attempt(['email' => $email, 'password' => $password]);
        //dd(session()->all());
        $session = session()->all();
       
        if($attempt){
            foreach($session as $key =>$value){
              
                if( strpos( $key, 'ticket_order_' ) !== false) {
                    
                    return redirect()->route('showEventCheckout', [
                        'event_id'    => $value['event_id'],
                    ]) . '#order_form';
                    break;
                }
            }
            
          
            return redirect()->route('user.home');
            // dd(auth('attendee')->user());
        }
        else{
            return redirect()->back()->with('error','Invalid Credentials');
        }
    }


    public function forgotPassword(Request $request){
        $class ='white-bg';
        return view('web.forgotPassword',compact('class'));
    }

    public function doForgotPassword(Request $request){
        // dd($request->all());
        $otp = session()->get('otp');
        $email = $request->email;
        
        $password = $request->password;
        $attendee = OrderOwner::where(['email'=>$email])->first();
        if($attendee){
            session()->put('email', $email);
            Mail::to($email)->send(new SendOTP($otp));
            return redirect()->route('user.otp')->with('success','OTP has been sent to registered Email Id.');
        }
        else{
            return redirect()->back()->with('error','No Record Found with this Email Id.');
        }
        
        // $attempt = Auth::guard('attendee')->attempt(['email' => $email, 'password' => $password]);
        
        // if($attempt){
        //     return redirect()->route('user.home');
        //     // dd(auth('attendee')->user());
        // }
    }

    public function resetPassword(Request $request){
        $class ='white-bg';
        return view('web.resetPassword',compact('class'));
    }

    public function doResetPassword(Request $request){
        // dd($request->all());
        $email = $request->email;
        $password = $request->password;
        $attempt = Auth::guard('attendee')->attempt(['email' => $email, 'password' => $password]);
        
        if($attempt){
            return redirect()->route('user.home');
            // dd(auth('attendee')->user());
        }
    }

    public function otp(Request $request){
        $otp = rand(1000,9999);
        session()->put('otp', $otp);
        $class ='white-bg';
        return view('web.otp',compact('class','otp'));
    }

    public function doOTP(Request $request){
        $email = session()->get('email');
        $rules = [
            'otp'=> [ Rule::in(session()->get('otp'))],
            'password'  =>  ['required','min:6','same:new_password'],
            'new_password'  =>  ['required'],
        ];
        // dd($request->all());
        //$email = $request->email;
        $password = $request->password;
        
        $validation = Validator::make($request->all(), $rules);
        if($validation->passes()){
            OrderOwner::where(['email'=>$email])->update(['password'=>bcrypt($password)]);
            $session = session()->all();
       
        
            foreach($session as $key =>$value){
              
                if( strpos( $key, 'ticket_order_' ) !== false) {
                    
                    return redirect()->route('showEventCheckout', [
                        'event_id'    => $value['event_id'],
                    ]) . '#order_form';
                    break;
                }
            }

            return redirect()->route('user.login')->with('success','Password has been reset Successfully.');
            // dd(auth('attendee')->user());
        }
        else{
            return redirect()->back()->withErrors($validation)->withInput();;
        }
    }

    public function signup(Request $request){
        $class ='white-bg';
        return view('web.signup',compact('class'));
    }

    public function doSignup(Request $request){
        // dd($request->all());
        $email = $request->email;
        $password = $request->password;
        $name = $request->name;
        $rules = [
            'email'        => [
                'required',
                'email',
               
                'unique:order_owners,email'
            ],
            'password'     => ['required'],
            'name'   => ['required'],
            'phone'=>['required']
        ];
        $validation = Validator::make($request->all(), $rules);
        
        if ($validation->fails()) {
            
            return redirect()->back()->withErrors($validation)->withInput();;
        }
        $user = OrderOwner::create([
            'first_name'  =>  $name,
            'email'  =>  $email,
            'phone'=>$request->phone,
            'address'=>$request->address,
            'city'=>$request->city,
            'state'=>$request->state,
            'zip_code'=>$request->zip_code,
            'password'  =>  bcrypt($password),
        ]);
        $attempt = Auth::guard('attendee')->attempt(['email' => $email, 'password' => bcrypt($password)]);
        if($attempt){
            $session = session()->all();
       
        
            foreach($session as $key =>$value){
              
                if( strpos( $key, 'ticket_order_' ) !== false) {
                    
                    return redirect()->route('showEventCheckout', [
                        'event_id'    => $value['event_id'],
                    ]) . '#order_form';
                    break;
                }
            }
            
          
           
            
            return redirect()->route('user.home');
            // dd(auth('attendee')->user());
        }
        else{
            return redirect()->route('user.login')->with('success','Registration Completed. Please Do Login.');
        }
    }

    public function home(Request $request){
        $class ='white-bg';
        //dump(auth('attendee')->user());
        $orders = auth('attendee')->user()->orders;
        return view('web.home',compact('class','orders'));
    }

    public function doLogout(){
        auth('attendee')->logout();
        return redirect('/');
    }

     
}
