<?php

include_once 'db.php';
include_once 'notes.php';

$notes = new Note($conn);

if($notes->getNotes())
{
    print_r(json_encode($notes));
}
else
{
    
   // print_r(json_encode(array("STATU" => false, "MESSAGE" => "Notlar listelenemedi")));
}