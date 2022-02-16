<?php

include_once 'db.php';
include_once 'notes.php';


$notes = new Note($conn);


$notes->userId = $_POST['userId'];


$currentNote = $notes->userNotesControl();


if($currentNote != 0)
{
   
   
        $userArray = array(
            "STATU" => 2,
            "NOTE_ID" => $currentNote["NOTE_ID"],
            "TITLE" => $currentNote["TITLE"],
            "DESCRIPTION" => $currentNote["DESCRIPTION"],
            "DATE" => $currentNote["DATE"]
            );
             
        print_r(json_encode($userArray));
            
   
}

else
{
    $responseArray = array(
            "STATU" => 0,
            "MESSAGE" => "Not bulunamadi"
            );
   // print_r(json_encode($responseArray));
}