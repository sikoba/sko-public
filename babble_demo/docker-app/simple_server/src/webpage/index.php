<?php

$nb_files = 0;
$datas = [];

while (file_exists('data/data'.$nb_files.'.json')) {
  $date_modif = date("F d Y H:i:s",filemtime('data/data'.$nb_files.'.json'));
  $nb_blocks = 0;
  $nb_transactions = 0;
  foreach (explode("\n", file_get_contents('data/data'.$nb_files.'.json')) as $line) {
      if (preg_match('/nombre de transactions dans ce block: (\d+)/', $line, $matches)) {
        $nb_transactions += intval($matches[1]);
      }
	
	  if (preg_match('/Block numero : (\d+)/', $line, $matches)) {
      $nb_blocks++;
    }
  }

	
	$datas['data' . $nb_files . '.json'] = [
      'nb_blocks' => $nb_blocks,
      'nb_transactions' => $nb_transactions,
      'nb_file' => $nb_files,
      'date_modif' => $date_modif,
  ];
	$nb_files++;
}

if (!empty($_GET['id'])) {
  //Cas du lien <a>
  $idAFrapper = intval($_GET['id']);
}

if (isset($_GET['page'])) {
  include 'page.php';
}
else if (isset($_GET['node'])) {
  include 'nodes.php';
}
else if (isset($_GET['crystal'])) {
  include 'connecting.php';
}
else {
  include 'design.php';
}



if (isset($_GET['json']) && $_GET['json']) {
  echo json_encode($datas);
}