@if(session()->get('message'))
    <script>showMessage('{{\Session::get('message')}}');</script>
@endif


