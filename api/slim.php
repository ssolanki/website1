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
     $data = array( "loginstatus" => "success",
                        'user' => $email
                    );    
    }
        else{

            $data[] = array( "loginstatus" => "login failure"
                       
                    ); 
             
        }
      
   $app->response()->header('Content-Type', 'application/json');
   echo json_encode($data);
   
});

$app->get("/auth/logout", function () use ($app) {
   unset($_SESSION['user']);  
});

  
//Get Method to get the data from database

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

            $data[] = array(
                'id' => $p["id"],  
                'place_name' => $p["place_name"],
                'place_region_name' => $p["place_region_name"], 
                'place_state' => $p["place_state"],
                'place_avg_temp_winter' => $p["place_avg_temp_winter"],              
                'place_avg_temp_summer' => $p["place_avg_temp_summer"],
                'place_sea_level' => $p["place_sea_level"],
                'place_idealNo_days' => $p["place_idealNo_days"],
                'place_ideal_budget' => $p["place_ideal_budget"],
                'place_img' => $p["place_img"], 
                'place_latitude' => $p["place_latitude"], 
                'place_longitude' => $p["place_longitude"],
                 'place_about' => stripslashes($p["place_about"]),                 
                'place_overall_rating' => $p["place_overall_rating"] 
                                                                                                                     
          );    
//      print_r ($data);
        }

 
    } else {

           
    //   foreach($db->places() as $p){
    //        $attractions = array();
    //         $other_images = array();
            
    //         foreach ($p->attractions() as $attraction) {

    //             $attractions[] = $attraction['id']; 
    //         }
    //         foreach ($p->places_images() as $img) {
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
    //               ); 

    //         }
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
    //           'reviews' => $reviews                                                        
    //     );    
           

    // }


    }
    
    $app->response()->header('content-type','application/json');
    
    echo json_encode(array('places_data'=>$data));    
    

 });

$app->get('(/:place_id)/attractions', function($place_id=null) use ($app, $db){
    
    if($place_id!=null){
      $data= array();
        foreach($db->attractions()->where('places_id',$place_id) as $p){
            
              $data[] = array(
                  'id' => $p['id'],
                  'attraction_name' => $p['attraction_name'],
                  'attraction_places_id' => $p['places_id'],
                  'attraction_about' => stripslashes($p['attraction_about']), 
                  'attraction_timeSpan' => $p['attraction_timeSpan'],
                  'attraction_cost' => $p['attraction_cost'],
                  'attraction_image' => $p['attraction_image'],
                  'attraction_postalCode' => $p['attraction_postalCode'], 
                  'attraction_overall_rating' => $p['attraction_overall_rating']
                    
              );

      }
    }
    else
    {
      $data= array();
    }
        $app->response()->header('content-type','application/json');
    
      echo json_encode(array('attractions'=>$data));    

});

$app->get('/attractions(/:name)', function($name=null) use ($app, $db){
    
    if($name == null){
        $data = array();
        
        foreach($db->attractions() as $p){
             
            // array_push($data,$usages_area);            
        //
               
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

    } else {
        

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