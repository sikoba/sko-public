<?php 
$nb_files = $_GET['page'];
if (file_exists('data/data'.$nb_files.'.json')) {
    $data = [];
    foreach (explode("\n", file_get_contents('data/data'.$nb_files.'.json')) as $line) {
        if (preg_match('/Block numero : (\d+)/', $line, $matches)) {
        $numero_block = $matches[1];
      }
      if (preg_match('/hash : (\w+)/', $line, $matches)) {
        $hash = $matches[1];
      }
      if (preg_match('/nombre de transactions dans ce block: (\d+)/', $line, $matches)) {
        $transactions_block = $matches[1];
      }
      if (isset($numero_block) && isset($hash) && isset($transactions_block)) {
          array_push($data, ['numero_block' => $numero_block, 'hash' => $hash, 'transactions_block' => $transactions_block]);
          unset($numero_block, $hash, $transactions_block);
      }
    }
    include 'second_table.php';
}