@extends('Emails.Layouts.Master')

@section('message_content')

<p>@lang("basic.hello") ,</p>

<p>{{$name}} with email <strong>{{$email}}</strong> having Phone Number <strong>{{$phone_number}}</strong> has sent you the following Message</p>
<br />
<p>{{$msg}}</p>
@stop

@section('footer')

@stop