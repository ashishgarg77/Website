@extends('Public.ViewEvent.Layouts.EventPage')

@section('head')

@stop

@section('content')
<section class="home-banner attendize">
        <header>
            <div class="logo"><a href="{{route('home')}}"><img src="{{ url('/') }}/images/logo-black.svg" alt="logo" /></a></div>
            <div class="trigger trigger-black ss"><a href="javascript:;">
                    <span></span>
                    <span></span>
                </a></div>
        </header>
</section>
<div class="event-spacer"></div>


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

@if(!Auth::guard('attendee')->check())
@include('web.login_partial')
@else
@include('Public.ViewEvent.Partials.EventCreateOrderSection')
@endif
<script>var OrderExpires = {{strtotime($expires)}};</script>
   
@endsection

