@extends('Public.ViewEvent.Layouts.EventPage')

@section('head')

@stop

@section('content')
<section class="home-banner attendize">
        <header>
            <div class="logo"><a href="{{route('home')}}"><img src="{{ url('/') }}/images/logo-black.svg" alt="logo" /></a></div>
            <div class="trigger trigger-black"><a href="javascript:;">
                    <span></span>
                    <span></span>
                </a></div>
        </header>
</section>
<div class="event-spacer"></div>

    <!-- @include('Public.ViewEvent.Partials.EventShareSection') -->
    @include('Public.ViewEvent.Partials.EventViewOrderSection')
    <!-- @include('Public.ViewEvent.Partials.EventFooterSection') -->
    
@stop
