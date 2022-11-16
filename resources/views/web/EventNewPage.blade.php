@extends('Public.ViewEvent.Layouts.EventPage')



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
<div class="event-details">
    <div class="inner-wrapper">
        <div class="bktoevent"><a href="{{route('events')}}"><img src="{{ url('/') }}/images/calander-arrow.svg">CALENDAR</a></div>
        <div class="event-details-hd margin-top100">
		<!--Rishab Rikhiram Sharma-->
            {{ $event->my_organiser_name }}
            <span>{{$event->title}} </span>
            {{-- @dump($event->categories()->pluck('title')->toArray()) --}}
        </div>
        <div class="event-details-date">
        <span id="evtime"> {{ date('d, M ,Y h:i', strtotime($event->start_date)) }} </span><br>
        
                <span property="endDate" content="{{ $event->end_date->toIso8601String() }}">
                     @if($event->start_date->diffInDays($event->end_date) == 0)
                        {{ $event->end_date->format('H:i') }}
                     @else
                     {{ date('d, M ,Y h:i', strtotime($event->end_date)) }}  
                     @endif
                </span>
                @lang("Public_ViewEvent.at")
                <span property="location" typeof="Place">
                    <b property="name">{{$event->venue_name}}</b>
                    <meta property="address" content="{{ urldecode($event->venue_name) }}">
                </span>
           
        </div>
        <!--div class="addtocalander"><a href="javascript:;">Add to calander</a></div-->
		<div title="Add to Calendar" class="addeventatc addtocalander">
			Add to Calendar
			<span class="start"> {{ date( 'd, M ,Y h:i', strtotime($event->start_date)) }}</span>
			<span class="end">05/07/2022 10:00 AM</span>
			<span class="timezone">timezone</span>
			<span class="title">{{$event->title}}</span>
			<span class="description">Description of the event</span>
			<span class="location">{{$event->venue_name}}</span>
		</div>
        <div class="event-details-banner">
            <img src="{{ url('/') }}/{{ $image_path }}" class="w100">
        </div>
        <div class="event-details-section">
            <!--h4 class="ev-sub">Brief intro of the event as<br> presented by the artist </h4-->
			<h4 class="ev-sub">About the event </h4>
            <div class="event-details-section1">
                <div class="event-details-section1-inner-left">
                {!! md_to_html($event->description) !!}
                </div>
                <div class="event-details-section1-inner-right">
                <div class="event-details-social-left">
                    <h5>{{ $event->my_organiser_name }} </h5>
                <p>{{ $event->my_organiser_about }}
</p>
                </div>
                <div class="event-details-social-right">
                  <ul class="cl-count2">
				    <li><a href="{{ $event->youtube_link  }}" target="_blank"><img src="{{ url('/') }}/images/youtube-svg.svg"></a></li>
				    <li><a href="{{ $event->website_link }}" target="_blank"><img src="{{ url('/') }}/images/websvg-new.svg"></a></li>
                    
                      <li><a href="{{ $event->facebook_link }}" target="_blank"><img src="{{ url('/') }}/images/fbsvg.svg"></a></li>
                      <li><a href="{{ $event->twitter_link }}" target="_blank"><img src="{{ url('/') }}/images/instagram.svg" style="width: 29px;"></a></li>
					 
                  </ul>
                </div>
                </div>

                <div class="buy-ticket">
				  <a href="javascript:;" class="showdtnew showss"><img src="{{ url('/') }}/images/footer-sc1.svg" class="v_ev_del"> VIEW DETAILS</a>
				   <a href="javascript:;" class="showdtnew hidess" style="color: #D23A3D;"><img src="{{ url('/') }}/images/footer-sc1.svg" class="v_ev_del"> HIDE DETAILS</a>
				  
				    </div>
					   </div>
					   
				<div class="my-details-ev-new">	   
                @include('Public.ViewEvent.Partials.EventTicketsSection')
                  </div>
              
         
		 
		


            <div class="youmayknow">
                <h4 class="ev-hd">YOU MAY ALSO LIKE,</h4>
                <div class="youmayknow-inner">
                   

                    <?php  foreach($events as $key =>$value){  #echo '<pre>'; print_R($value); echo '</pre>'; ?>
                        <div class="youmayknow1">
                        <div class="youmayknow-th">
                            <a href="{{ $value->event_url}}">
                            <?php if ($value->images->first() != null) { ?>
                                <img src="{{ url('/') }}/{{  $value->images()->first()->image_path}}">
                            <?php }else { ?>
                                <img src="{{ url('/') }}/images/home-event1.png">
                            <?php } ?>
                            </a>
                        </div>
                        <h4>
                        {{  $value->title}} </h4>
                            <p>{{  date('d M', strtotime($value->start_date))}} - {{  date('d M', strtotime($value->end_date))}}<br>
                            {{  date('h:i A', strtotime($value->start_date))}} </p>
                    </div>
                    
                        
                    <?php } ?>
                    
                </div>
            </div>
          

        </div>
    </div>  
</div>
<script type="text/javascript" src="https://cdn.addevent.com/libs/atc/1.6.1/atc.min.js" async defer></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


<script>

$(function(){
	$('.humane').insertBefore('.youmayknow');
    $('.trigger').on('click', () =>{
        $('.megamenu').show();
        $('body').css({'overflow':'hidden'})
    })

    $('.trigger.close').on('click', () =>{   
        $('.megamenu').hide();
        $('body').css({'overflow':'auto'})

    })
    $('.menu_inClick').on('click', () =>{
        $('.menu_in').slideToggle();

    })
	
	
$(document).on('click', '.showdtnew.showss', function(){
	$('.my-details-ev-new').addClass('active');
	$('.showdtnew.hidess').show();
	$('.showdtnew.showss').hide();
})


$(document).on('click', '.showdtnew.hidess', function(){
	$('.my-details-ev-new').removeClass('active');
	$('.showdtnew.hidess').hide();
	$('.showdtnew.showss').show();
})

//console.log(document.referrer)

})

</script>
@endsection;


