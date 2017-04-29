<?php
class DB_Functions {
 
    private $conn;
    private $db;
    private $error;

    // constructor
    function __construct() {
        require_once 'db_connect.php';
        // connecting to database
        $this->db = new DB_CONNECT();
        $this->conn = $this->db->connect();
    }
 
    // destructor
    function __destruct() {
         
    }


function getError(){
    return $this->error;
}

function getConn(){
    return $this->db->getConn();
}

    public function getRows($sql){
        $stmt = $this->conn->prepare($sql);
            if (!$stmt) {
                $this->error = "getRows: Error in preparing statement \n".$sql."\n".$this->conn->error;
                echo $this->error;
                return false;
            } else { 
                $stmt->execute();
                $rows = $this->db->fetch($stmt);
                $stmt->close();
                return $rows;
            }
    }

 

 
    public function insertRow($table, $row){
        $array = json_decode($row);
        $count = 0;
        $columns_str = "";
        $values_str = "";
        foreach($array as $key=>$value){
            $count+=1;
            $columns_str = $columns_str.",".$key;
            $values_str = $values_str."','".$value;
        }
        $columns_str = substr($columns_str,1);
        $values_str = substr($values_str,2);
        $values_str = $values_str."'";
        $sql = "insert into ".$table."(".$columns_str.") values (".$values_str.")";
        $stmt = $this->conn->prepare($sql);
            if (!$stmt) {
                $this->error = "insertRow: Error in preparing statement \n".$sql."\n".$this->conn->error;
                return false;
            } else { 
                $result = $stmt->execute();
                $stmt->close();
                return $result;
            }
    }

    /**
     * Storing new user
     * returns user details
     */
    public function storeUser($f_name,$l_name, $email, $password , $phonenumber) {
       
        $hash = $this->hashSSHA($password);
        $encrypted_password = $hash["encrypted"]; // encrypted password
        $salt = $hash["salt"]; // salt
 
        $stmt = $this->conn->prepare("INSERT INTO customer(f_name, l_name, email, encrypted_password, salt, phonenumber, registrationDate) VALUES(?, ?, ?, ?, ?, ?, NOW())");
        if (!$stmt) {
            echo "INSERT: Error in preparing statement \n";
            echo $this->conn->error;
            exit;
        }
        $stmt->bind_param("ssssss", $f_name, $l_name, $email, $encrypted_password, $salt, $phonenumber);
        $result = $stmt->execute();
        $stmt->close();
 
        // check for successful store
        if ($result) {
            $stmt = $this->conn->prepare("SELECT * FROM customer WHERE email = ?");
            if (!$stmt) {
                echo "result: Error in preparing statement \n";
                echo $this->conn->error;
                exit;
            }
            $stmt->bind_param("s", $email);
            $stmt->execute();
            //$user = $stmt->get_result()->fetch_assoc();
            $user = $this->db->fetch($stmt);
            $stmt->close();
 
            return $user;
        } else {
            return false;
        }
    }
 
    /**
     * Get user by email and password
     */
    public function getUserByEmailAndPassword($email, $password) {
 
        $stmt = $this->conn->prepare("SELECT * FROM customer WHERE email = ?");
            if (!$stmt) {
                echo "getUserByEmail: Error in preparing statement \n";
                echo $this->conn->error;
                exit;
            }
        $stmt->bind_param("s", $email);
 
        if ($stmt->execute()) {
            $user = $this->db->fetch($stmt);
            $stmt->close();
            
            foreach($user as $vRow){
                $row = $vRow;
            }
            // verifying user password
            $hash = $this->checkhashSSHA($row["salt"], $password);
            $encrypted_password = $hash["encrypted"]; // encrypted password
            // check for password equality

            if ($row["encrypted_password"] == $hash) {
                // user authentication details are correct
                return $row;
            } else {
                return false;
            }
        } else {
            return false;
        }
    }
 
    /**
     * Check user is existed or not
     */
    public function isUserExisted($email) {
        
        $stmt = $this->conn->prepare("SELECT email from customer WHERE email = ?");
 
        $stmt->bind_param("s", $email);
 
        $stmt->execute();
 
        $stmt->store_result();
 
        if ($stmt->num_rows > 0) {
            // user existed 
            $stmt->close();
            return true;
        } else {
            // user not existed
            $stmt->close();
            return false;
        }
    }
 
    /**
     * Encrypting password
     * @param password
     * returns salt and encrypted password
     */
    public function hashSSHA($password) {
 
        $salt = sha1(rand());
        $salt = substr($salt, 0, 10);
        $encrypted = base64_encode(sha1($password . $salt, true) . $salt);
        $hash = array("salt" => $salt, "encrypted" => $encrypted);
        return $hash;
    }
 
    /**
     * Decrypting password
     * @param salt, password
     * returns hash string
     */
    public function checkhashSSHA($salt, $password) {
 
        $hash = base64_encode(sha1($password . $salt, true) . $salt);
 
        return $hash;
    }
 
}
 
?>