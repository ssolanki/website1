<?php
require_once 'NotORM.php';
$pdo = new PDO('mysql:dbname=tourepedia1;host=localhost', 'root', '');
$db = new NotORM($pdo);
require 'Slim/Slim.php';
\Slim\Slim::registerAutoloader();
$app = new \Slim\Slim();

/**********************************  USER LOGIN SIGNUP CHECKING ******************************/

$authenticate = function ($app) {
    return function () use ($app) {
        if (!isset($_SESSION['user'])) {
            $app->redirect('/login.html');
        }
    };
};

session_start();
$app->post("/auth/process", function () use ($app, $db) {

    $array = (array) json_decode($app->request()->getBody());
    $email = $array['email'];
    $pwd = md5($array['pwd']);
    $user = $db->users()->where('user_email', $email)->where('user_password',$pwd);
    $count = count($user);
    if($count == 1){
     $_SESSION['user'] = $email;
     $data = array( "loginStatus" => "success",
                        'userEmail' => $email
                    );
    }
        else{
            $data = array( "loginStatus" => "login failure"
                    );
        }
   $app->response()->header('Content-Type', 'application/json');
   echo json_encode($data);
});



$app->post("/register", function () use ($app, $db) {

    $data = array();
    $array = (array) json_decode($app->request()->getBody());
    $user = $db->users()->where('user_email', $array['email']);
    $count = count($user);
    $email = $array['email'];
    if($count == 1){
         $data = array( "registerStatus" => "already registered"
          );
    }
    else{
              $p = array( 'user_email'=> $array['email'] ,
                      'user_password'=> md5($array['pwd']) ,
                      'user_name'=> $array['fullName'] ,
                      'user_contact_no1' => $array['mobileNumber']
                     );

          $user = $db->users()->insert($p);
          $data = array( "registerStatus" => "successfully registered",
                  'userEmail' =>  $array['email']
          );
          $_SESSION['user'] = $email;
    }
   $app->response()->header('Content-Type', 'application/json');
   echo json_encode($data);
});

$app->get("/auth/isLoggedIn", function() use ($app){
  if(isset($_SESSION['user'])){
     $data = array( "loggedInStatus" => "true");
  }else{
    $data = array( "loggedInStatus" => "false");
  }

  $app->response()->header('Content-Type', 'application/json');
   echo json_encode($data);
});

$app->get("/auth/logout", function () use ($app) {
   unset($_SESSION['user']);
});

$app->get('/tourepedia/our_trips(/:place_id)',function($place_id) use ($app , $db){
  if($place_id != null){
      $data = array();
    foreach($db->our_trips()->where('places_id',$place_id) as $p){
      $data[] = array_map('utf8_encode', array(
            'id' => $p["id"],
            'trip_name' => $p['trip_name'],
            'trip_img1' => $p['our_trips_img1'],
            'trip_stay' => $p['trip_stay'],
            'trip_timeSpan' => $p['trip_timeSpan'],
            'trip_cost' => $p['trip_cost'],
            'trip_place_about' => stripslashes($p['trip_place_about']            )
            )
      );
      }
  }

  $app->response()->header('content-type','application/json');
  echo json_encode(array('places_data'=>$data));

});

$app->post('/tourepedia/submitPlan' ,function() use($app ,  $db){
    $data = array();
    $array = (array) json_decode($app->request()->getBody());
    $attractionsList = (array)$array['attractionsList'];
    $plan = (array) ($array['plan']);
    $book = (array)  ($array['book']);

    $startingDateDay = $array['startingDateDay'];
    $startingDateMonth = $array['startingDateMonth'];
    $startingDateYear = $array['startingDateYear'];
    $planType = $array['planType'];
    $selectedPlace = $array['selectedPlace'];
    $journeyStartingDate = $array['journeyStartingDate'];
    $selectedPlaceId = $array['selectedPlaceId'];

    if($planType=='Book'){

      $travelPref = $book['travelPref'];
      $travelBy = $book['travelBy'];
      $fullName = $book['fullName'];
      $email = $book['email'];
      $aboutMeUs = $book['aboutMeUs'];
      $moreAboutTrip = $book['moreAboutTrip'];
      $hotelPref = $book['hotelPref'];
      $amenitiesPref = $book['amenitiesPref'];
      $originCity = $book['originCity'];
      $returningCity = $book['returningCity'];
      $typeOfTrip = $book['typeOfTrip'];
      $tripDuration = $book['tripDuration'];
      $numOfPeople = $book['numOfPeople'];
      $expectedBudget = $book['expectedBudget'];
      $mobileNumber = $book['mobileNumber'];
      $altMobileNumber = $book['altMobileNumber'];
      $hotels = $book['hotels'];
      $travel = $book['travel'];
      $amenities = $book['amenities'];

      $insert_trip = array( "user_name" => $fullName , "user_email" =>  $email, "user_id"=> 0 , "user_address"=> '' , "user_contact_no1"=> $mobileNumber,
       "user_contact_no2"=>$altMobileNumber, "budget_per_person"=>0, "expect_total_budget"=>$expectedBudget, "trip_type" =>$typeOfTrip ,
      "trip_starting_date"=> $journeyStartingDate, "no_of_days"=>$tripDuration, "origin_city"=>$originCity, "end_city"=>$returningCity, "returning_city"=>$returningCity,
       "no_of_persons"=>$numOfPeople, "isOrderOk"=>0, "isOrderDone"=> 0);
      $trip = $db->trips()->insert($insert_trip);
      $trip_id =  $trip['id'];

        for ($i =0 ; $i< sizeOf($attractionsList) ;$i++) {
          $p = (array)$attractionsList[$i];
          $attraction = array(
                "trips_id" => $trip_id,
                "attractions_id" =>  $p['id'],
                "attraction_preference" => 0
          );
        $db->trip_attractions()->insert($attraction);
        }

    }
    else{

    }
    $app->response()->header('content-type','application/json');
    echo json_encode(array('order_id'=>$data));

});


$app->get('/region/places(/:region_id)', function($region_id=null) use ($app, $db){
      if($region_id != null){
          $data = array();
        foreach($db->places()->where('place_region_id',$region_id) as $p){
          $data[] = array(
              'id' => $p["id"],
              'place_name' => $p["place_name"],
              'place_region_name' => $p["place_region_name"],
              'place_region_id' => $p["place_region_id"]
        );
        }
     }

      else{
        foreach($db->places() as $p){
          $data[] = array(
              'id' => $p["id"],
              'place_name' => $p["place_name"],
              'place_region_name' => $p["place_region_name"],
              'place_region_id' => $p["place_region_id"]
        );
      }
      }
      $app->response()->header('content-type','application/json');
    echo json_encode(array('places_data'=>$data));
});

$app->get('/places(/:place_id)', function($place_id=null) use ($app, $db){



    if($place_id != null){



        $data = null;

        $query =    $db->places()->where('id', intval($place_id)) ;

        // echo $query;

        foreach($query as $p){
              // $attractions = array();
              // $other_images = array();
              // foreach ($p->attractions() as $attraction) {
              //     $attractions[] = $attraction['id'];
              // }
              // foreach ($p->places_images() as $img) {
              //     $other_images[] = $img['image_name'];
              // }
              // $reviews = array();

              // foreach ($p->places_reviews() as $review) {
              //     $user_id = $review['users_id'];
              //    $user_name = $review->users['user_name'];

              //     $reviews[] = array(

              //           'id' => $review['id'],

              //           'user_comment' => $review['user_comment'],

              //           'rating' => $review['user_rating'],

              //           'user_name' =>  $user_name

              //       );
               // }
             $data[] = array_map('utf8_encode', array(
                'id' => $p["id"],
                'place_name' => $p["place_name"],
                'place_region_name' => $p["place_region_name"],
                'place_state' => $p["place_state"],
                'place_avg_temp_winter' => $p["place_avg_temp_winter"],
                'place_avg_temp_summer' => $p["place_avg_temp_summer"],
                'place_sea_level' => $p["place_sea_level"],
                'place_idealNo_days' => $p["place_idealNo_days"],
                'place_ideal_budget' => $p["place_ideal_budget"],
                'place_img1' => $p["places_img1"],
                'place_img2' => $p["places_img2"],
                'place_latitude' => $p["place_latitude"],
                'place_longitude' => $p["place_longitude"],
                 'place_about' => stripslashes($p["place_about"]),
                'place_overall_rating' => $p["place_overall_rating"]
          ));

//      print_r ($data);

        }
    } else {
    //   foreach($db->places() as $p){
     //        $attractions = array();
     //         $other_images = array();
      //         foreach ($p->attractions() as $attraction) {
       //             $attractions[] = $attraction['id'];
       //         } //         foreach ($p->places_images() as $img) {
       //             $other_images[] = $img['image_name'];
        //         }
        //         $reviews = array();
         //         foreach ($p->places_reviews() as $review) {
         //             $user_id = $review['users_id'];
          //            $user_name = $review->users['user_name'];
          //             $reviews[] = array(
           //                   'id' => $review['id'],
           //                   'user_comment' => $review['user_comment'],
           //                   'rating' => $review['user_rating'],
           //                   'user_name' =>  $user_name
           //               ); //         }
            //       $data[] = array(
            //           'id' => $p["id"],
            //           'place_name' => $p["place_name"],
             //           'place_region_name' => $p["place_region_name"],
             //           'place_state' => $p["place_state"],
             //           'place_avg_temp_winter' => $p["place_avg_temp_winter"],
              //           'place_avg_temp_summer' => $p["place_avg_temp_summer"],
               //           'place_sea_level' => $p["place_sea_level"],
               //           'place_idealNo_days' => $p["place_idealNo_days"],
               //           'place_ideal_budget' => $p["place_ideal_budget"],
               //           'place_img' => $p["place_img"],
                //           'place_latitude' => $p["place_latitude"],
                 //           'place_longitude' => $p["place_longitude"],
                  //           'place_about' => stripslashes($p["place_about"]),
                  //           'attractions' => $attractions ,
                   //           'place_other_images' => $other_images,
                    //           'place_overall_rating' => $p["place_overall_rating"] ,
                     //           'reviews' => $reviews //     );
                     //
                    // }
            }
            $app->response()->header('content-type','application/json');
            echo json_encode(array('places_data'=>$data));
});

$app->get('(/:place_id)/attractions', function($place_id=null) use ($app, $db){

   if($place_id!=null){
     $data= array();
     foreach($db->attractions()->where('places_id',$place_id) as $p){
       $data[] = array_map('utf8_encode', array(
         'id' => $p['id'],
         'attraction_name' => $p['attraction_name'],
         'attraction_places_id' => $p['places_id'],
         'attraction_about' => stripslashes($p['attraction_about']),
         'attraction_timeSpan' => $p['attraction_timeSpan'],
         'attraction_cost' => $p['attraction_cost'],
          'attraction_image' => $p['attraction_image'],
          'attraction_postalCode' => $p['attraction_postalCode'],
          'attraction_overall_rating' => $p['attraction_overall_rating'] )
          );
        }
      }
    else {
      $data= array();
      }
    $app->response()->header('content-type','application/json');
    echo json_encode(["attractions"=>$data]);
});

$app->get('/attractions(/:name)', function($name=null) use ($app, $db){
    if($name == null){
      $data = array();
      foreach($db->attractions() as $p){
         // array_push($data,$usages_area); // $other_images = array(); foreach ($p->attractions_images() as $img) { $other_images[] = $img['image_name']; } $reviews = array(); foreach ($p->attractions_reviews() as $review) { $user_id = $review['users_id']; $user_name = $review->users['user_name']; $reviews[] = array( 'id' => $review['id'], 'user_comment' => $review['user_comment'], 'rating' => $review['user_rating'], 'user_name' =>  $user_name ); } $data[] = array( 'id' => $p['id'], 'attraction_name' => $p['attraction_name'], 'attraction_places_id' => $p['places_id'], 'attraction_about' => stripslashes($p['attraction_about']), 'attraction_timeSpan' => $p['attraction_timeSpan'], 'attraction_cost' => $p['attraction_cost'], 'attraction_image' => $p['attraction_image'], 'attractions_other_images' => $other_images, 'attraction_postalCode' => $p['attraction_postalCode'], 'attraction_overall_rating' => $p['attraction_overall_rating'], 'reviews' => $reviews );
	      }
    }
    else {
        $data = null;
        foreach($db->attractions()->where('attraction_name', $name) as $p){
            $other_images = array();
              foreach ($p->attractions_images() as $img) {
                  $other_images[] = $img['image_name'];
              }

            $reviews = array();
            foreach ($p->attractions_reviews() as $review) {
                $user_id = $review['users_id'];
                $user_name = $review->users['user_name'];
                $reviews[] = array(
                        'id' => $review['id'],
                        'user_comment' => $review['user_comment'],
                        'rating' => $review['user_rating'],
                        'user_name' =>  $user_name
                    );
          }
            $data[] = array(
            		'id' => $p['id'],
            		'attraction_name' => $p['attraction_name'],
            		'attraction_places_id' => $p['places_id'],
                'attraction_about' => stripslashes($p['attraction_about']),
            		'attraction_timeSpan' => $p['attraction_timeSpan'],
            		'attraction_cost' => $p['attraction_cost'],
            		'attraction_image' => $p['attraction_image'],
                'attractions_other_images' => $other_images,
            		'attraction_postalCode' => $p['attraction_postalCode'],
                'attraction_overall_rating' => $p['attraction_overall_rating'],
                'reviews' => $reviews
            );

        }

    }



    $app->response()->header('content-type','application/json');



    echo json_encode(array('attractions_data'=>$data));

});









$app->run();

?>
