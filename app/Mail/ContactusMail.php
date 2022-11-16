<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;

class ContactusMail extends Mailable
{
    use Queueable, SerializesModels;
    public $name, $email, $phone_number, $msg;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($name, $email, $phone_number, $msg)
    {
        //
        $this->name = $name;
        $this->email = $email;
        $this->phone_number = $phone_number;
        $this->msg = $msg;
    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build()
    {
        return $this->view('Emails.sendmail');
    }
}
