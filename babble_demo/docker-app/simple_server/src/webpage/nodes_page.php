<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
		  integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"
		  >
	<style> body {
		background-color:  yellow;
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
	<thead>
	<tr>
		<th scope="col" class="text-center">Node</th>
		<th scope="col" class="text-center">Adresse</th>
		<th scope="col" class="text-center">Clé publique</th>
		<th scope="col" class="text-center">Etat</th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($data as $peers): ?>
	<tr>
		<th scope="row" class="text-center"><?= $peers['node'] ?></th>
		<td class="text-center"><?= $peers['addr'] ?></td>
		<td class="text-center"><?= $peers['key'] ?></td>
		<td class="text-center"><?= 2 ?></td>

	</tr>
	<?php endforeach; ?>
	</tbody>
</table>

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
