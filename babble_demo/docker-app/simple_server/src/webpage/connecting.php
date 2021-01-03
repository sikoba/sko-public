<?php
$host = '0.0.0.0';
$port = 5001;
$connection = @fsockopen($host, $port);
$array = array();
while (is_resource($connection))
{
    $status = "Off";
  //  echo '<h2>' . $host . ':' . $port . ' ' . '(' . getservbyport($port, 'tcp') . ') is open.</h2>' . "\n";
    fwrite($connection, "Hello world\r\n");
    if (fgets($connection, 16) == "OK") {
        $status = "On";
    }
    fclose($connection);
    array_push($array, ['port' => $port, 'status' => $status, 'host' => $host]);
    $port++;
    $connection = @fsockopen($host, $port);
}
include 'node_crystal.php';
?>