<?php

class Note{
    
    private $conn;
    private $table_name = 'NOTES';
    
    public $noteId;
    public $title;
    public $description;
    public $isRemove;
    public $registerDate;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    
    function AddNote(){
        
        $query = "INSERT INTO $this->table_name
        (
        TITLE,
        DESCRIPTION,
        DATE,
        IS_REMOVE
        )
        VALUES
        (
        '$this->title',
        '$this->description',
        '$this->registerDate',
        '$this->isRemove'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    
    function getNotes()
    {
        $query = "SELECT * FROM $this->table_name";
        
        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            while($row = $response->fetch_array())
            {
                $noteList = array(
                    "noteId" => $row["NOTE_ID"],
                    "title" => $row["TITLE"],
                    "description" => $row["DESCRIPTION"],
                    "date" => $row["DATE"],
                    "isRemove" => $row["IS_REMOVE"]
                    );
                    
                    
                    $notesLists[] = $noteList;
                    
                    $noteResponse = array("notes" => $notesLists);
                    
            }
            
            print_r(json_encode($noteResponse));
        }
        else{
            return null;
        }
        
    }

    function isNoteExistControl()
	{
	   /* $query = "SELECT * FROM $this->table_name 
	              WHERE 
	              TITLE = '$this->title'";*/
	              
	         $query = "SELECT * FROM $this->table_name 
	              WHERE 
	              TITLE
	              LIKE '%$this->title%'";
	              
	              
	    $response = mysqli_query($this->conn, $query);
	    
	    if((mysqli_num_rows($response) > 0))
	    {
	       while($row = $response->fetch_array())
            {
                $noteList = array(
                    "noteId" => $row["NOTE_ID"],
                    "title" => $row["TITLE"],
                    "description" => $row["DESCRIPTION"],
                    "date" => $row["DATE"],
                    "isRemove" => $row["IS_REMOVE"]
                    );
                    
                    
                    $notesLists[] = $noteList;
                    
                    $noteResponse = array("notes" => $notesLists);
                    
            }
            
            print_r(json_encode($noteResponse));
	    
	    }
	    else
	    {
	        return null;  // Not yok
	    }
	}
    

    function userNotesControl()
	{
	    $query = "SELECT * FROM $this->table_name 
	              WHERE 
	              USER_ID = '$this->userId'";
	              
	              
	    $response = mysqli_query($this->conn, $query);
	    
	    if((mysqli_num_rows($response) > 0))
	    {
	       while($row = $response->fetch_array())
            {
                $noteList = array(
                    "noteId" => $row["NOTE_ID"],
                    "title" => $row["TITLE"],
                    "description" => $row["DESCRIPTION"],
                    "date" => $row["DATE"],
                    "isRemove" => $row["IS_REMOVE"],
                    "userId" => $row["USER_ID"]
                    );
                    
                    
                    $notesLists[] = $noteList;
                    
                    $noteResponse = array("notes" => $notesLists);
                    
            }
            
            print_r(json_encode($noteResponse));
	    
	    }
	    else
	    {
	        return null;  // Not yok
	    }
	}
}