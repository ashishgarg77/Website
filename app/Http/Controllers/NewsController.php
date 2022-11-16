<?php

namespace App\Http\Controllers;

use App\Models\News;
use Illuminate\Http\Request;

class NewsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //$news = new News();
        $my['title'] = $request->get('title');
        $my['descrption'] = ($request->get('description'));
        $my['url']  = ($request->get('url'));
         if ($request->hasFile('event_image')) {
            $path = public_path() . '/' . config('attendize.event_images_path');
            $filename = 'event_image-' . md5(time() . $event->id) . '.' . strtolower($request->file('event_image')->getClientOriginalExtension());

            $file_full_path = $path . '/' . $filename;

            $request->file('event_image')->move($path, $filename);

            $img = Image::make($file_full_path);

            $img->resize(800, null, function ($constraint) {
                $constraint->aspectRatio();
                $constraint->upsize();
            });

            $img->save($file_full_path);

           
            \Storage::put(config('attendize.event_images_path') . '/' . $filename, file_get_contents($file_full_path));
           
           
            $my['image_path'] = config('attendize.event_images_path') . '/' . $filename;
          
          
        }
       
       

        try {
            $last= News::create($my);
        } catch (\Exception $e) {
            Log::error($e);

            return response()->json([
                'status'   => 'error',
                'messages' => trans("Controllers.event_create_exception"),
            ]);
        }

      

        return response()->json([
            'status'      => 'success',
            'id'          => $last->id,
            
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\News  $news
     * @return \Illuminate\Http\Response
     */
    public function show(News $news)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\News  $news
     * @return \Illuminate\Http\Response
     */
    public function edit(News $news)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\News  $news
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, News $news)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\News  $news
     * @return \Illuminate\Http\Response
     */
    public function destroy(News $news)
    {
        //
    }

    public function deleteNews($news_id)
    {
        $category = News::where('id',$news_id)->delete();
       
        
        return response()->json([
            'status'      => 'success',
            'id'          => $last->id,
            
        ]);
    }
}
