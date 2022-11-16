<?php

namespace App\Http\Controllers;

use App\Mail\ContactusMail;
use App\Models\Event;
use App\Models\Organiser;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;

class IndexController extends Controller
{
    /**
     * redirect index page
     * @param  Request $request http request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function showIndex(Request $request)
    {
        //return redirect()->route('showSelectOrganiser');
        $class ='blackbg';
        $currentdate = date('Y-m-d');
        $events =
        Event::with(['organiser','images', 'currency'])->orderBy('id',
            'desc')->take(3)->get();
            //dd($events);
        return view('web.index',compact('class','events'));
    }

    public function eventlist(Request $request, $category=0)
    {
        $class ='white-bg';
       
        $allowed_sorts = ['created_at', 'start_date', 'end_date', 'title'];
        $currentdate = date('Y-m-d');
        $searchQuery = $request->get('q');
        
        $sort_by = (in_array($request->get('sort_by'), $allowed_sorts) ? $request->get('sort_by') : 'start_date');

        $events = $searchQuery
            ? Event::with(['organiser','images', 'currency','eventsdate'])->where('end_date', '>', $currentdate )->orderBy($sort_by,
                'desc')->get()
            : Event::with(['organiser','images', 'currency'])->orderBy($sort_by, 'asc')->get();
        if($category){
            // dump($events);
            $events = $events->filter(function($event) use($category){
                $cats = explode(',',$event->event_category);
                // dump($event->event_category);
                // dump($cats);
                return in_array($category, $cats);
            });
            //dd($events);
        }
        $listEvent=[];
       
        $image ='';
        foreach($events as $key =>$value)
        {
           # echo '<pre>'; print_R(count($value->eventsdate)); echo '</pre>';
            $images = $value->images;
            if(count($value->eventsdate )){
                foreach($value->eventsdate as $key2 => $row){
                   # echo '<pre>'; print_R(($row)); echo '</pre>';
                    $myevent['date'] = date('Y-m-d',strtotime($row->start_date));
                    // $myevent['end_date'] = $value->end_date;
                     $myevent['event_url'] = $value->event_url;
                     if($key ==0){
                       foreach($images as $key =>$row){
                           
                         $image = ($row->image_path);
                       }
                        
                     }
                     $myevent['title'] = $value->title;
                     $myevent['image'] = asset($value->bg_image_path);
                     $myevent['location'] = $value->location;
                     $myevent['id'] = $value->id;
                     $listEvent[] = $myevent;
                }
            }
                $myevent['date'] = date('Y-m-d',strtotime($value->start_date));
            // $myevent['end_date'] = $value->end_date;
                $myevent['event_url'] = $value->event_url;
                if($key ==0){
                foreach($images as $key =>$row){
                    
                    $image = ($row->image_path);
                }
                
                }
                $myevent['title'] = $value->title;
                $myevent['image'] = asset($value->bg_image_path);
                $myevent['location'] = $value->location;
                $myevent['id'] = $value->id;
                $listEvent[] = $myevent;
            
        }
        //dd(($events));
        $data = [
            'events'    => $events,
            'listEvent' =>json_encode($listEvent),
            'image'=> $image,
            'search'    => [
                'q'        => $searchQuery ? $searchQuery : '',
                'sort_by'  => $request->get('sort_by') ? $request->get('sort_by') : '',
                'showPast' => $request->get('past'),
            ],
        ];

       
        return view('web.event',compact('class','data'));

    }


    function eventDetail(Request $request)
    {
        
    }

    function contact(Request $request)
    {
        $class ='white-bg';
        return view('web.contact',compact('class'));
    }
    function insider(Request $request)
    {
        $class ='white-bg';
        return view('web.insider',compact('class'));
    }

    function razorCallback(Request $request){
        dd($request);
    }

    function postmail(Request $request){
        // dd();
        $postedData = $request->all();

        Mail::to(env('ADMIN_EMAIL'))->send(new ContactusMail($request->name, $request->email, $request->phone_number, $request->msg));
        return redirect()->back()->with('success',"Mail Has Been Sent Successfully.");

    }

    function privacypolicy(Request $request)
    {
        $class ='white-bg';
        return view('web.privacypolicy',compact('class'));
    }
	
	 function refundcancellationpolicy (Request $request)
    {
        $class ='white-bg';
        return view('web.refundcancellationpolicy',compact('class'));
    }
	
		 function termsandconditions(Request $request)
    {
        $class ='white-bg';
        return view('web.termsandconditions',compact('class'));
    }

}
