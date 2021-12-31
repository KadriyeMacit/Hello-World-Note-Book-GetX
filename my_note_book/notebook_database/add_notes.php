<?php

include_once 'db.php';
include_once 'notes.php';

$note = new Note($conn);

$note->title = $_POST['title'];
$note->description = $_POST['description'];
$note->registerDate = date("Y-m-d h:i:s");
$note->isRemove = $_POST['isRemove'];



          if($note->AddNote())
          {
               print_r(json_encode(array("STATU"=>true, "MESSAGE"=>"Not eklendi.")));
          } 
          else
          {
               print_r(json_encode(array("STATU"=>false, "MESSAGE"=>"Not eklenemedi.")));
          }