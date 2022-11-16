@extends('Shared.Layouts.Master')

@section('title')
    @parent
    {{ trans('Organiser.dashboard') }}
@endsection

@section('top_nav')
    @include('ManageOrganiser.Partials.TopNav')
@stop
@section('page_title')
    {{ trans('Organiser.organiser_name_dashboard', ['name'=>$organiser->name])}}
@stop

@section('menu')
    @include('ManageOrganiser.Partials.Sidebar')
@stop

@section('head')

@stop

@section('content')
{!! Form::open(array('url' => route('savecatoery'), 'class' => 'ajax gf')) !!}
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header text-center">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h3 class="modal-title">
                    <i class="ico-calendar"></i>
                   Create Category</h3>
            </div>
            <div class="modal-body">
                <div class="row">
                    <div class="col-md-12">
                        <div class="form-group">
                            {!! Form::label('title', 'Category Title', array('class'=>'control-label required')) !!}
                            {!!  Form::text('title', old('title'),array('class'=>'form-control','placeholder'=>trans("Event.event_title_placeholder", ["name"=>Auth::user()->first_name]) ))  !!}
                        </div>

                        <div class="form-group custom-theme">
                            {!! Form::label('description', 'Category Description', array('class'=>'control-label required')) !!}
                            {!!  Form::textarea('description', old('description'),
                                        array(
                                        'class'=>'form-control  editable',
                                        'rows' => 5
                                        ))  !!}
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <span class="uploadProgress"></span>
              
                {!! Form::submit(trans("Event.create_event"), ['class'=>"btn btn-success"]) !!}
            </div>
        </div>
     {!! Form::close() !!}
    </div>

@stop