<?php
require_once 'conexion.php';
header('Content-Type: application/json');

$accesibles = (isset($_GET['accesibles']) && $_GET['accesibles'] === 'si');

if ($accesibles) {
    $stmt = $conexion->prepare("SELECT nombre FROM estaciones WHERE adaptada = 1 ORDER BY nombre");
} else {
    $stmt = $conexion->prepare("SELECT nombre FROM estaciones ORDER BY nombre");
}

$stmt->execute();
$result = $stmt->get_result();

$estaciones = [];
while ($row = $result->fetch_assoc()) {
    $estaciones[] = $row['nombre'];
}

echo json_encode($estaciones);
