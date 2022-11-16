<?php

namespace App\Jobs;

use App\Mail\SendAttendeeInviteMail;
use App\Models\Attendee;
use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Foundation\Bus\Dispatchable;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Queue\SerializesModels;
use Config;
use Mail;
use Log;


class SendAttendeeInviteJob implements ShouldQueue
{
    use Dispatchable, InteractsWithQueue, Queueable, SerializesModels;

    public $attendee;

    /**
     * Create a new job instance.
     *
     * @return void
     */
    public function __construct(Attendee $attendee)
    {
        $this->attendee = $attendee;
    }

    /**
     * Execute the job.
     *
     * @return void
     */
    public function handle()
    {
        GenerateTicketJob::dispatchNow($this->attendee);
        Log::info("Use ticket from cache: " . $this->attendee->email);
        $mail = new SendAttendeeInviteMail($this->attendee);
        Mail::to($this->attendee->email)
            ->locale(Config::get('app.locale'))
            ->send($mail);
    }
}