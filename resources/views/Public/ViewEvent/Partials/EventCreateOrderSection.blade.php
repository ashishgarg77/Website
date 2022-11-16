

<div class="mynew-wrapper" style="max-width:100%;">
<section id='order_form'>
   
    <div class="row" id="checkout_create">
	 <div class="mynew-wrapper1">
	   <div class="row checkout_create_hd checkout_create_hd1">
        <h1 class="section_head">
            @lang("Public_ViewEvent.order_details")
        </h1>
    </div>
	<div class="add_buyer-main-new1">
        <div class="col-md-12" style="text-align: center">
            @lang("Public_ViewEvent.below_order_details_header") 
        </div>
        <div class="col-md-12 checkout_create_order-summery">
            <div class="panel add_padding_top30">
                <!--div class="panel-heading">
                    <h3 class="panel-title">
                        <i class="ico-cart mr5"></i>
                        @lang("Public_ViewEvent.order_summary")
                    </h3>
                </div-->

                <div class="panel-body pt0">
                    <table class="table mb0 table-condensed">
                        @foreach($tickets as $ticket)
                        <tr>
                            <td class="pl0">{{{$ticket['ticket']['title']}}} X <b>{{$ticket['qty']}}</b></td>
                            <td style="text-align: right;">
                                @isFree($ticket['full_price'])
                                    @lang("Public_ViewEvent.free")
                                @else
                                <s>{{ money($ticket['ticket']->original_price, $event->currency) }}</s>
                                {{ money($ticket['full_price'], $event->currency) }}
                                @endif
                            </td>
                        </tr>
                        @endforeach
                    </table>
                </div>
                @if($order_total > 0)
                <div class="panel-footer">
                    <h5>
                        @lang("Public_ViewEvent.total"): <span style="float: right;"><b>{{ $orderService->getOrderTotalWithBookingFee(true) }}</b></span>
                    </h5>
                    @if($event->organiser->charge_tax)
                    <h5>
                        {{ $event->organiser->tax_name }} ({{ $event->organiser->tax_value }}%):
                        <span style="float: right;"><b>{{ $orderService->getTaxAmount(true) }}</b></span>
                    </h5>
                    <h5>
                        <strong>@lang("Public_ViewEvent.grand_total")</strong>
                        <span style="float: right;"><b>{{  $orderService->getGrandTotal(true) }}</b></span>
                    </h5>
                    @endif
                </div>
                @endif

            </div>
            <div class="help-block">
                {!! @trans("Public_ViewEvent.time", ["time"=>"<span id='countdown'></span>"]) !!}
            </div>
        </div>
		<div class="f_field">
             <a href="javascript:;" class="btn btn-success c_btn ad_hidebuyer">CONTINUE</a>
          </div>
		</div>
		</div>
	
		
		<div class="add_buyer-main-new">
			<div class="inner-wrapper">
            <div class="bktoevent"><a onclick="history.back()" href="javascript:;"><img src="{{ url('/') }}/images/calander-arrow.svg">TICKET DETAILS</a></div>
        </div>
		 <div class="mynew-wrapper1">
	
		
		    <div class="row checkout_create_hd checkout_create_hd2">
				<h1 class="section_head">
					BUYER INFORMATION
				</h1>
			</div>
        <div class="col-md-12  checkout_create_your-information">
            <div class="event_order_form login-form">
                {!! Form::open(['url' => route('postValidateOrder', ['event_id' => $event->id ]), 'class' => 'ajax payment-form']) !!}

                {!! Form::hidden('event_id', $event->id) !!}

                <!--h3> @lang("Public_ViewEvent.your_information")</h3-->

                <div class="row" style="display:none;">
                    <div class="col-xs-6">
                        <div class="form-group f_field">
                            {!! Form::label("order_first_name", trans("Public_ViewEvent.first_name")) !!}
                            {!! Form::text("order_first_name",  Auth::guard('attendee')->user()->first_name, ['required' => 'required', 'class' => 'form-control', 'placeholder' => 'First Name']) !!}
                        </div>
                    </div>
                    <div class="col-xs-6">
                        <div class="form-group f_field">
                            {!! Form::label("order_last_name", trans("Public_ViewEvent.last_name")) !!}
                            {!! Form::text("order_last_name",   Auth::guard('attendee')->user()->last_name, ['class' => 'form-control', 'placeholder' => 'Last Name']) !!}
                        </div>
                    </div>
                </div>

                <div class="row" style="display:none;">
                    <div class="col-md-12">
                        <div class="form-group f_field">
                            {!! Form::label("order_email", trans("Public_ViewEvent.email")) !!}
                            {!! Form::text("order_email",   Auth::guard('attendee')->user()->email, ['required' => 'required', 'class' => 'form-control', 'placeholder' => 'Email' ]) !!}
                        </div>
                    </div>
					
					  <div class="col-md-12">
                        <div class="form-group f_field">
                            {!! Form::label("order_phone", trans("Public_ViewEvent.phone")) !!}
                            {!! Form::text("order_phone",   Auth::guard('attendee')->user()->phone, [ 'class' => 'form-control', 'placeholder' => 'Phone']) !!}
                        </div>
                    </div>
					
                </div>
               <!-- <div class="row"><div class="col-md-12">&nbsp;</div></div>
               
                <div class="row"><div class="col-md-12">&nbsp;</div></div>
                <div class="row hidden" id="business_details">
                    <div class="col-md-12">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        {!! Form::label("business_name", trans("Public_ViewEvent.business_name")) !!}
                                        {!! Form::text("business_name", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        {!! Form::label("business_tax_number", trans("Public_ViewEvent.business_tax_number")) !!}
                                        {!! Form::text("business_tax_number", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        {!! Form::label("business_address_line1", trans("Public_ViewEvent.business_address_line1")) !!}
                                        {!! Form::text("business_address_line1", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="form-group">
                                        {!! Form::label("business_address_line2", trans("Public_ViewEvent.business_address_line2")) !!}
                                        {!! Form::text("business_address_line2", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        {!! Form::label("business_address_state", trans("Public_ViewEvent.business_address_state_province")) !!}
                                        {!! Form::text("business_address_state", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        {!! Form::label("business_address_city", trans("Public_ViewEvent.business_address_city")) !!}
                                        {!! Form::text("business_address_city", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                                <div class="col-xs-4">
                                    <div class="form-group">
                                        {!! Form::label("business_address_code", trans("Public_ViewEvent.business_address_code")) !!}
                                        {!! Form::text("business_address_code", null, ['class' => 'form-control']) !!}
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>-->
                <div class="row"><div class="col-md-12">&nbsp;</div></div>
                <!--div class="p20 pl0">
                    <a href="javascript:void(0);" class="btn btn-primary btn-xs" id="mirror_buyer_info">
                        @lang("Public_ViewEvent.copy_buyer")
                    </a>
                </div-->
				
				
				<!--div class="add_more-buyer add_more-buyer_first">
				<a href="javascript:;">+  ADD BUYER</a>
				</div-->
						

                <div class="row">
                    <div class="col-md-12">
                        <div class="ticket_holders_details" >
                            <!--h3 class="ticket_holders_details_hd">@lang("Public_ViewEvent.ticket_holder_information")</h3-->
                            <?php
                                $total_attendee_increment = 0;
                            ?>
                            @foreach($tickets as $ticket)
                                @for($i=0; $i<=$ticket['qty']-1; $i++)
							
						
								
								
                                <div class="panel panel-primary buyermyin s_add{{$i+1}}">

                                    <div class="panel-heading">
                                        <h3 class="panel-title">
                                            <!--b>{{$ticket['ticket']['title']}}:</b @lang("Public_ViewEvent.ticket_holder_n", ["n"=>$i])-->
											TICKET {{$i}}
                                        </h3>
                                    </div>
                                    <div class="panel-body">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group f_field">
                                                    {!! Form::label("ticket_holder_first_name[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.Name")) !!}
                                                    {!! Form::text("ticket_holder_first_name[{$i}][{$ticket['ticket']['id']}]", Auth::guard('attendee')->user()->first_name, ['required' => 'required', 'placeholder'=> 'Name', 'class' => "ticket_holder_first_name.$i.{$ticket['ticket']['id']} ticket_holder_first_name form-control",'value' => Auth::guard('attendee')->user()->first_name]) !!}
                                                </div>
                                            </div>
                                            <!--<div class="col-md-12">
                                                <div class="form-group f_field">
                                                    {!! Form::label("ticket_holder_last_name[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.last_name")) !!}
                                                    {!! Form::text("ticket_holder_last_name[{$i}][{$ticket['ticket']['id']}]",  Auth::guard('attendee')->user()->last_name, [ 'placeholder'=> 'Last Name', 'class' => "ticket_holder_last_name.$i.{$ticket['ticket']['id']} ticket_holder_last_name form-control",'value' => Auth::guard('attendee')->user()->first_name]) !!}
                                                </div>
                                            </div>-->
                                        </div>
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div class="form-group f_field">
                                                    {!! Form::label("ticket_holder_email[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.email_address")) !!}
                                                    {!! Form::text("ticket_holder_email[{$i}][{$ticket['ticket']['id']}]", Auth::guard('attendee')->user()->email, ['required' => 'required', 'placeholder'=> 'Email', 'class' => "ticket_holder_email.$i.{$ticket['ticket']['id']} ticket_holder_email form-control"]) !!}
                                                </div>
                                            </div>
											  <div class="col-md-12">
                                                <div class="form-group f_field">
                                                    {!! Form::label("ticket_holder_phone[{$i}][{$ticket['ticket']['id']}]", trans("Public_ViewEvent.phone")) !!}
                                                    {!! Form::text("ticket_holder_phone[{$i}][{$ticket['ticket']['id']}]", Auth::guard('attendee')->user()->phone, [ 'placeholder'=> 'Phone Number', 'class' => "ticket_holder_phone.$i.{$ticket['ticket']['id']} ticket_holder_phone form-control"]) !!}
                                                </div>
                                            </div>
                                            @include('Public.ViewEvent.Partials.AttendeeQuestions', ['ticket' => $ticket['ticket'],'attendee_number' => $total_attendee_increment++])

                                        </div>
                                    </div>
									
									
													
				<div class="add_more-buyer">
				<a href="javascript:;">+  ADD BUYER</a>
				</div>
									
									
                                </div>
								
								
                                @endfor
                            @endforeach
							
			
							
                        </div>
                    </div>
                </div>

                @if($event->pre_order_display_message)
                <div class="well well-small">
                    {!! nl2br(e($event->pre_order_display_message)) !!}
                </div>
                @endif
				
				<div class="reg-form-flex">
                            <div class="subsn w100">
                                <div class="form-group">
                                    <input type="checkbox" id="nesletter">
                                    <label for="nesletter">Subscribe to newsletters</label>
                                  </div>
                            </div>
                        </div>
						
						
		<div class="payment-option">
                        <h5>PAYMENT INFORMATION</h5>
                        <p>Click continue to enter payment gateway to complete your purchase</p>
                        <div class="pay-icon">
                            <img src="{{ url('/') }}/images/bankcard.svg" class="w100">
                        </div>
                    </div>
		
		

               {!! Form::hidden('is_embedded', $is_embedded) !!}
               {!! Form::submit(trans("Public_ViewEvent.checkout_order"), ['class' => 'btn btn-lg btn-success card-submit', 'style' => 'width:100%;']) !!}
               {!! Form::close() !!}

            </div>
        </div>
		</div>
		</div>
		
		
		
		
		
    </div>
    <!--img src="https://cdn.attendize.com/lg.png" /-->
</section>
</div>
@if(session()->get('message'))
    <script>showMessage('{{session()->get('message')}}');</script>
@endif

