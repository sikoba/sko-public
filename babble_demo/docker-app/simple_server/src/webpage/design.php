<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
		  <style> body {
		background-color:  yellow
	}
		.table {
  color: #fff;
  background-color: #343a40;
  th, td, thead th {
    border-color: lighten(#343a40, 7.5%);
  }
  &.table-striped {
    tbody tr:nth-of-type(odd) {
      background-color: lighten(#343a40, 7.5%);
    }
  }
  &.table-hover {
    tbody tr {
      @include hover {
        color: #fff;
        background-color: rgba(#fff, .075);
      }
    }
  }

} </style>
		  
	
	<title></title>
</head>
<body>
<table class="table table-hover table-striped">
<a href="?node"> nodes <br></a>
<a href="?crystal"> nodes crystal </a>

	<thead>
	<tr>
		<th scope="col" class="text-center">Files</th>
		<th scope="col" class="text-center">Nombre de blocks</th>
		<th scope="col" class="text-center">Nombres de transactions</th>
		<th scope="col" class="text-center">Date de dernière modification</th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($datas as $file => $data): ?>
	<tr>
		<th scope="row" class="text-center"><?= $file ?> <a href="?page=<?= $data['nb_file'] ?>"> tableau </a></th>
		<td class="text-center"><?= $data['nb_blocks'] ?></td>
		<td class="text-center"><?= $data['nb_transactions'] ?></td>
		<td class="text-center"><?= $data['date_modif'] ?></td>
	</tr>
	<?php endforeach; ?>
	</tbody>
</table>

Nombre de fichiers : <?= $nb_files ?> <br>

<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
		integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
		crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
		integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
		crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
		integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
		crossorigin="anonymous"></script>
</body>
</html>
