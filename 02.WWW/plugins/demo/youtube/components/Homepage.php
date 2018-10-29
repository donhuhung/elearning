<?php

namespace Demo\Youtube\Components;

use Cms\Classes\ComponentBase;
use SahusoftCom\YoutubeApi\AuthService;
use SahusoftCom\YoutubeApi\YoutubeLiveEventService;

class Homepage extends ComponentBase {

    public function componentDetails() {
        return [
            'name' => 'Homepage Component',
            'description' => 'No description provided yet...'
        ];
    }

    public function defineProperties() {
        return [];
    }

    public function onRun() {		
        $authServiceObject = new AuthService();
        if (isset($_GET['code'])) {
            //get token from oauth
            $code = $_GET['code'];
            $authToken = $authServiceObject->getToken($code);
            //$access_token = $authToken['access_token'];   
            $data = array(
                "title" => "test",
                "description" => "Test LiveStream Youtube",
                "thumbnail_path" => storage_path('app/media/thumnail.jpeg'), // Optional
                "event_start_date_time" => "2018-10-16 21:45:00",
                "event_end_date_time" => "", // Optional
                "time_zone" => "Asia/Ho_Chi_Minh",
                'privacy_status' => "public", // default: "public" OR "private"
                "language_name" => "English", // default: "English"
                "tag_array" => ""    // Optional and should not be more than 500 characters
            );

            $ytEventObj = new YoutubeLiveEventService();
            /**Google_Service_YouTube
             * The broadcast function returns array of details from YouTube.
             * Store this information & will be required to supply to youtube 
             * for live streaming using encoder of your choice. 
             */
            $response = $ytEventObj->broadcast($authToken, $data);
            if (!empty($response)) {

                $youtubeEventId = $response['broadcast_response']['id'];
                $serverUrl = $response['stream_response']['cdn']->ingestionInfo->ingestionAddress;
                $serverKey = $response['stream_response']['cdn']->ingestionInfo->streamName;
                $this->startLiveStream($authToken, $youtubeEventId);
            }
        } else {
            //oauth2 google api            
            $youtube_email = "hungdn0502@gmail.com";
            $channelId = "UCPsbvEaWHy5hM9DaBjpSfKw";			
            $authServiceObject = new AuthService();			
            $authUrl = $authServiceObject->getLoginUrl($youtube_email, $channelId);			
            header("Location: " . $authUrl);
            exit;
        }
    }

    private function startLiveStream($authToken, $youtubeEventId) {
        $broadcastStatus = ["testting", "live"];
        $ytEventObj = new YoutubeLiveEventService();
        $streamStatus = $ytEventObj->transitionEvent($authToken, $youtubeEventId, $broadcastStatus);
		//header("Location: " . 'https://youtu.be/'.$youtubeEventId);
        header("Location: " . 'https://www.youtube.com/webcam');

        exit;
    }

    private function stopLiveStream($authToken, $youtubeEventId) {
        $broadcastStatus = ["complete"];
        $ytEventObj = new YoutubeLiveEventService();
        $ytEventObj->transitionEvent($authToken, $youtubeEventId, $broadcastStatus); // $broadcastStatus = ["complete"]
    }

}
