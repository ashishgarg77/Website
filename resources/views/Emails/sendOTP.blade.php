@extends('Emails.Layouts.Master')

@section('message_content')

<p>@lang("basic.hello") ,</p>

<p>This is regarding the request to reset the Password. Here is the OTP <strong>{{$otp}}</strong>.</p>
@stop

@section('footer')

@stop