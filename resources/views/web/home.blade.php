@extends('web.template')

@section('content')

<section class="home-banner">
        <header>
            <div class="logo"><a href="{{ url('/') }}"><img src="{{ url('/') }}/images/logo-black.svg" alt="logo" /></a></div>
            <div class="trigger trigger-black"><a href="javascript:;">
                    <span></span>
                    <span></span>
                </a></div>
        </header>
</section>

<div class="event-spacer"></div>

<div class="community-outer">
    <div class="wrapper">
        <div class="community-inner community-inner1 community-inner1-margin0">
            
            <div class="community-right">
                <h1>Hey<span>{{auth('attendee')->user()->first_name}}</span> Welcome!</h1>
                <p class="paddingbottom0">Here you can find the Event Details</p>

                <table>
                    <tr>
                        <td></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>






<div class="community-outer padding0">
    <div class="wrapper">
        <div class="community-inner mytable-order">
            @if ($orders && $orders->count())
                
            
            <table class="table order-my-cs-table">
                <tr>
                    <th>
                        Order Id
                    </th>
                    <th>
                        Event
                    </th>
                    <th>
                        Start Date
                    </th>
                    <th>
                        End Date
                    </th>
                    <th>
                        Venue
                    </th>
                    <th>
                        Ticket(s)
                    </th>
                    <th>
                        Actions
                    </th>
                </tr>
                @foreach ($orders as $order)
                    <tr>
                        <td>{{$order->id}}</td>
                        <td>{{$order->event->title}}</td>
                        <td>{{$order->event->start_date}}</td>
                        <td>{{$order->event->end_date}}</td>
                        <td>{{$order->event->venue_name}} &nbsp;
                            {{$order->event->venue_name_full}}&nbsp;
                            {{$order->event->location_address}}&nbsp;
                            {{$order->event->location_address_line_1}}&nbsp;
                            {{$order->event->location_address_line_2}}&nbsp;
                            {{$order->event->location_state}}&nbsp;
                            {{$order->event->location_post_code}}&nbsp;
                        </td>
                        <td>
                            @foreach ($order->tickets as $ticket)
                                <div>{{$ticket->title}}</div>
                            @endforeach
                        </td>
                        <td>
                            <a target="_blank" class="btn btn-success" href="{{route('showOrderTickets',[$order->order_reference])}}">View Tickets</a>
                        </td>
                    </tr>
                @endforeach
            </table>
            @else
            No record Found
            @endif
            {{-- @dump($orders) --}}
        </div>
    </div>
</div>
@endsection;
@section('scripts')
@endsection;

