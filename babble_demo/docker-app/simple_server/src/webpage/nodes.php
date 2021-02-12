<?php
$stk = [];
if (file_exists('../../../../conf/peers.json')) {
  $node = 0;
  $addr = 0;
  $data = [];
  $key = 0;
  $stk = file_get_contents('../../../../conf/peers.json');
    $tmp = json_decode($stk, false);
    foreach($tmp as $item) {
      $addr = $item->NetAddr;
      $node = $item->Moniker;
      $key = $item->PubKeyHex;
      
    if (isset($node) && isset($addr) && isset($key)) {
      array_push($data, ['node' => $node, 'addr' => $addr, 'key' => $key]);
      unset($node, $addr, $key);
  }
    }
    include 'nodes_page.php';
}