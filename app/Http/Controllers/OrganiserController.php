<?php

namespace App\Http\Controllers;

use App\Models\Organiser;
use Illuminate\Http\Request;
use Illuminate\Support\Str;
use Image;

use App\Models\EventCategory;
use App\Models\News;
use App\Models\Subscription as mysb;

class OrganiserController extends MyBaseController
{
    /**
     * Show the select organiser page
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function showSelectOrganiser()
    {
        return view('ManageOrganiser.SelectOrganiser');
    }

    /**
     * Show the create organiser page
     *
     * @return \Illuminate\Contracts\View\View
     */
    public function showCreateOrganiser()
    {
        //$organiser = Organiser::scope()->findOrFail($organiser_id);
        return view('ManageOrganiser.CreateOrganiser');
    }

    public function showCategory($organiser_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $category = EventCategory::paginate();
#dd($category);
        $data = [
            'organiser'       => $organiser,
            'category'=>$category
        ];

        return view('ManageOrganiser.showCategory',$data);
    }

    public function addCategory($organiser_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $data = [
            'organiser'       => $organiser,
           
        ];
        return view('ManageOrganiser.addCategory',$data);
    }

    public function deleteCategory($organiser_id,$category_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $category = EventCategory::where('id',$category_id)->delete();
        $data = [
            'organiser'       => $organiser,
           
        ];
        
        return view('ManageOrganiser.addCategory',$data);
    }

    public function addNews($organiser_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $data = [
            'organiser'       => $organiser,
           
        ];
        return view('ManageOrganiser.addNews',$data);
    }

    public function listNews($organiser_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $category = News::paginate();
        $data = [
            'organiser'       => $organiser,
            'category'=>$category
        ];
        return view('ManageOrganiser.listNews',$data);
    }

    public function deleteNews($organiser_id,$news_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $category = News::where('id',$news_id)->delete();
        $data = [
            'organiser'       => $organiser,
           
        ];
        
        return response()->json([
            'status'      => 'success',
            'id'          => $news_id,
            
        ]);
    }

    public function listSubscriber($organiser_id)
    {
        $organiser = Organiser::scope()->findOrFail($organiser_id);
        $category = mysb::paginate();
       # dd($category); 
        $data = [
            'organiser'       => $organiser,
            'category'=>$category
        ];
       
        return view('ManageOrganiser.subscribe',$data);
    }

    /**
     * Create the organiser
     *
     * @param Request $request
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \Symfony\Component\HttpFoundation\File\Exception\FileException
     */
    public function postCreateOrganiser(Request $request)
    {
        $organiser = Organiser::createNew(false, false, true);

        $chargeTax = $request->get('charge_tax');
        if ($chargeTax == 1) {
            $organiser->addExtraValidationRules();
        }

        if (!$organiser->validate($request->all())) {
            return response()->json([
                'status'   => 'error',
                'messages' => $organiser->errors(),
            ]);
        }

        $organiser->name = $request->get('name');
        $organiser->about = prepare_markdown($request->get('about'));
        $organiser->email = $request->get('email');
        $organiser->facebook = $request->get('facebook');
        $organiser->twitter = $request->get('twitter');
        $organiser->confirmation_key = Str::random(15);

        $organiser->tax_name = $request->get('tax_name');
        $organiser->tax_value = round($request->get('tax_value'),2);
        $organiser->tax_id = $request->get('tax_id');
        $organiser->charge_tax = ($chargeTax == 1) ? 1 : 0;

        if ($request->hasFile('organiser_logo')) {
            $organiser->setLogo($request->file('organiser_logo'));
        }

        $organiser->save();

        session()->flash('message', trans("Controllers.successfully_created_organiser"));

        return response()->json([
            'status'      => 'success',
            'message'     => trans("Controllers.refreshing"),
            'redirectUrl' => route('showOrganiserEvents', [
                'organiser_id' => $organiser->id,
                'first_run'    => 1
            ]),
        ]);
    }
}
