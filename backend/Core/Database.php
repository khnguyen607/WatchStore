<?php
class Database{
    private $host = 'localhost';
    private $user = 'root';
    private $pass = 'Bill2412@@';
    private $database = 'vegetable';
    private $conn;

    public function connect() {
        $this->conn = new mysqli($this->host, $this->user, $this->pass, $this->database);
        
        mysqli_set_charset($this->conn,'utf8');
        if ($this->conn->connect_error) {
            die("Connection failed: " . $this->conn->connect_error);
        } 
        return $this->conn;
    }
}