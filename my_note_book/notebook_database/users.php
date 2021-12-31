<?php

class User{
    
    private $conn;
    private $table_name = 'USERS';
    
    public $userId;
    public $username;
    public $email;
    public $book;
    public $password;
    public $registerDate;
    
    
    function __construct($db){
        $this->conn = $db;
    }
    
    
    function AddUser(){
        
        $query = "INSERT INTO $this->table_name
        (
        USERNAME,
        EMAIL,
        BOOK,
        PASSWORD,
        DATE
        )
        VALUES
        (
        '$this->username',
        '$this->email',
        '$this->book',
        '$this->password',
        '$this->registerDate'
        )";
        
        
        if(mysqli_query($this->conn, $query))
        {
            return mysqli_insert_id($this->conn);
        }else{
            return false;
        }
        
    }
    
    
    
    /*function isUserExistControl()
    {
        $query = "SELECT * FROM $this->table_name WHERE USERNAME = '$this->username'";
        
        $response = mysqli_query($this->conn, $query);
        
        if((mysqli_num_rows($response) > 0))
        {
            $user = myswli_fetch_array($response);
            
            if($user['PASSWORD'] == $this->password)
            {
                return $user;
            }
            else
            {
                return 1; //parolasi yanlis
            }
        }
        else
        {
            return 0; //Kullanici yok
        }
        
    }
    */
    
    
    	function isUserExistControl()
	{
	    $query = "SELECT * FROM $this->table_name 
	              WHERE 
	              USERNAME = '$this->username'";
	    $response = mysqli_query($this->conn, $query);
	    
	    if((mysqli_num_rows($response) > 0))
	    {
	        $user = mysqli_fetch_array($response);
	        if($user['PASSWORD'] == $this->password)
	        {
	            return $user;
	        }
	        else
	        {
	            return 1; // Parola hatali
	        }
	       
	    }
	    else
	    {
	        return 0;  // Kullanici yok
	    }
	}
      
}