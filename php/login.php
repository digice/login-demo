<?php

// FAKE API
// live demo at https://www.digices.com/web-log-in/login.php

$response = array();

// create some defaults

$response['timestamp'] = date('U');

$response['authenticated'] = 'false';

$response['token'] = 'nil';

$response['message'] = 'No data';

// check for POST vars

if (isset($_POST['u'])) {

  $username = $_POST['u'];

  if ($username == 'joe') {
  
      // username found
      
	  if (isset($_POST['p'])) {

        // password found
          
		$password = $_POST['p'];

        if ($password == 'secret') {
            
            // password is correct
            $response['message'] = 'Welcome';
            $response['authenticated'] = 'true';
            $response['token'] = md5('random');

        } else {
            $response['message'] = 'Password not correct';
        }
        	
	  } else {
		$response['message'] = 'Password not received.';
	  }

  } else {
    $response['message'] = 'Username not found.';
  }

} else {
  $response['message'] = 'Username not received.';
}

header('Content-Type: application/json');

echo json_encode($response);
 
