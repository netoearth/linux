    <?php  
     $ch = curl_init();  
     curl_setopt($ch, CURLOPT_URL, "http://myip.ipip.net");  
     curl_setopt($ch, CURLOPT_HEADER, false);  
     //define("CURRENT_IP", $arrIPs[0]);
    // curl_setopt($ch, CURLOPT_INTERFACE, CURRENT_IP); 
   curl_setopt($ch, CURLOPT_INTERFACE, "58.253.68.193");
     $result=curl_exec($ch);  
     curl_close($ch);  
     ?>  