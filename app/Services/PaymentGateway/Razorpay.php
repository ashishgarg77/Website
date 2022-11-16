<?php

namespace Services\PaymentGateway;

class Razorpay
{

    CONST GATEWAY_NAME = 'Razzorpay';

    private $transaction_data;

    private $gateway;
    public $options = [];
    public $extra_params = [];

    public function __construct()
    {
        $this->extra_params = [
            "razorpay_payment_id" => null,
            "razorpay_payment_link_id" => null,
            "razorpay_payment_link_reference_id" => null,
            "razorpay_payment_link_status" => null,
            "razorpay_signature" => null
        ];
        // $this->gateway = $gateway;
        // $this->options = [];
    }

    private function createTransactionData($order_total, $order_email, $event)
    {
        $token = uniqid();
        $this->transaction_data = [
            'amount' => $order_total,
            'currency' => $event->currency->code,
            'description' => 'Order for customer: ' . $order_email,
            'card' => config('attendize.fake_card_data'),
            'token' => $token,
            'receipt_email' => $order_email
        ];

        return $this->transaction_data;
    }

    public function startTransaction($order_total, $order_email, $event)
    {

        // $this->createTransactionData($order_total, $order_email, $event);
        // $transaction = $this->gateway->purchase($this->transaction_data);
        // $response = $transaction->send();

        // return $response;
    }

    public function getTransactionData() {
        return $this->transaction_data;
    }

    public function extractRequestParameters($request)
    {
        // dump($request->all());
        // dump($this->extra_params);
        foreach ($this->extra_params as $k => $param) {
            if (!empty($request->get($k))) {
                $this->options[$k] = $request->get($k);
            }
        }
        //dump($this->options);
    }

    public function completeTransaction($data) {

        $razorpay_payment_id = $this->options['razorpay_payment_id'];
        $node = new class {
            
            public $razorpay_payment_id;
            public function isSuccessful() { 
                return true;
            }

            public function getTransactionReference() {
                return $this->razorpay_payment_id;
            }
        };
        // dump($this->options);
        // dump("completeTransaction");
        if($this->options['razorpay_payment_link_status']=="paid"){
            $node->razorpay_payment_id = $razorpay_payment_id;
            return $node;
        }
        dd($data);
    }

    public function getAdditionalData() {}

    public function storeAdditionalData() {
        return false;
    }

    public function refundTransaction($order, $refund_amount, $refund_application_fee) {

        $request = $this->gateway->refund([
            'transactionReference' => $order->transaction_id,
            'amount'               => $refund_amount,
            'refundApplicationFee' => $refund_application_fee
        ]);

        $response = $request->send();

        if ($response->isSuccessful()) {
            $refundResponse['successful'] = true;
        } else {
            $refundResponse['successful'] = false;
            $refundResponse['error_message'] = $response->getMessage();
        }

        return $refundResponse;
    }

}