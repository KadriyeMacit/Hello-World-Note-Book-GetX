<?php

include_once 'db.php';
include_once 'users.php';

$user = new User($conn);
$user->username = $_POST['username'];
$user->password = $_POST['password'];


$currentUser = $user->isUserExistControl();


if($currentUser != 0)
{
    if($currentUser == 1)
    {
        $responseArray = array(
                "STATU" => 1,
                "MESSAGE" => "Parola yanlis"
                );
                
               
            print_r (json_encode($responseArray));
            
       
    }
    else
    {
        $userArray = array(
            "STATU" => 2,
            //"ID" => $currentUser["ID"],
            "USER_ID" => $currentUser["USER_ID"],
            "USERNAME" => $currentUser["USERNAME"],
            "PASSWORD" => $currentUser["PASSWORD"],
            "DATE" => $currentUser["DATE"]
            );
             
        print_r(json_encode($userArray));
            
    }
}

else
{
    $responseArray = array(
            "STATU" => 0,
            "MESSAGE" => "Kullanici bulunamadi"
            );
    print_r(json_encode($responseArray));
}