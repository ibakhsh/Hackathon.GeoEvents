
<?php 
 

 $all_actions = array("fetch");
   
$action = null; 

 $data = $_GET;

if (isset($data))  {
  $action = $data['action'];
}

$params = null;
if (isset($data['params'])) {
  $params = $data['params'];
}

header('Content-Type: application/json');
$response["error"] = false;


if (in_array($action, $all_actions) && is_json($params)){
    require_once 'db_Functions.php';
    $db = new DB_Functions();
    
    if ($action =="fetch") {
      $lat1 = $params["lat"];
      $lat2 = $params["lat"];
      $lng1 = $params["lng"];
      $lng2 = $params["lng"];
      $where = "(LONGITUDE >= $lat1 AND LONGITUDE <= $lat2) AND (LATITUDE >= $lng1 AND LATITUDE <= $lng2)";
      $where = "1=1";
      $getallLocations =  $db->getRows("SELECT * FROM `GEO_DATA` WHERE ID in(14,11,6,16,15) order by LONGITUDE desc limit 5"); 
      $response["data"] = $getallLocations;
    }
} else {
  $response["error"] = true;
  $response["error_msg"] = "either action or params(json object) are not send.";
}




function is_json($str){ 
  try {
      if(!is_array($str))
      {
        $result = json_decode($str) ;
      }
      return true;
  } catch (Exception $e) {
      return false;
  }
    //return json_decode($str) != null;
}


echo json_encode($response);

?>