<?php

include_once 'db.php';
include_once 'users.php';

$user = new User($conn);

$user->username = $_POST['username'];
$user->email = $_POST['email'];
$user->book = $_POST['book'];
$user->password = $_POST['password'];
$user->registerDate = date("Y-m-d h:i:s");

          if($user->AddUser())
          {
               print_r(json_encode(array("STATU"=>true, "MESSAGE"=>"Kullanici eklendi.")));
          } 
          else
          {
               print_r(json_encode(array("STATU"=>false, "MESSAGE"=>"Kullanici eklenemedi.")));
          }