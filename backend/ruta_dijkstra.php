<?php
require_once 'conexion.php';
require_once 'dijkstra.php';

header('Content-Type: application/json');

$origen = $_POST['origen'] ?? null;
$destino = $_POST['destino'] ?? null;
$accesibilidad = ($_POST['accesibilidad'] ?? 'no') === 'si';

if (!$origen || !$destino) {
    echo json_encode(['error' => 'Faltan parámetros']);
    exit;
}

function esAccesible($nombre, $conexion) {
    $stmt = $conexion->prepare("SELECT adaptada FROM estaciones WHERE nombre = ?");
    $stmt->bind_param("s", $nombre);
    $stmt->execute();
    $res = $stmt->get_result();
    if ($fila = $res->fetch_assoc()) {
        return $fila['adaptada'] == 1;
    }
    return false;
}

if ($accesibilidad) {
    if (!esAccesible($origen, $conexion)) {
        echo json_encode(['error' => 'El origen no es accesible']);
        exit;
    }
    if (!esAccesible($destino, $conexion)) {
        echo json_encode(['error' => 'El destino no es accesible']);
        exit;
    }
}

// Construir grafo
$grafo = [];

$query = "SELECT eo.nombre AS origen, ed.nombre AS destino, c.tiempo, eo.adaptada AS origen_adaptada, ed.adaptada AS destino_adaptada
          FROM conexiones c
          JOIN estaciones eo ON c.estacion_origen_id = eo.id
          JOIN estaciones ed ON c.estacion_destino_id = ed.id";

$result = $conexion->query($query);

while ($row = $result->fetch_assoc()) {
    if ($accesibilidad && (!$row['origen_adaptada'] || !$row['destino_adaptada'])) {
        continue; // Saltar conexiones que no cumplan accesibilidad
    }
    $grafo[$row['origen']][$row['destino']] = (int)$row['tiempo'];
    $grafo[$row['destino']][$row['origen']] = (int)$row['tiempo'];
}

// DEBUG para ver el grafo y comprobar nodos
// Comprobar que origen y destino existen en el grafo filtrado
if (!isset($grafo[$origen])) {
    echo json_encode([
        'error' => 'El nodo origen no está en el grafo con el filtro de accesibilidad',
        'origen' => $origen,
        'grafo_nodos' => array_keys($grafo)
    ]);
    exit;
}
if (!isset($grafo[$destino])) {
    echo json_encode([
        'error' => 'El nodo destino no está en el grafo con el filtro de accesibilidad',
        'destino' => $destino,
        'grafo_nodos' => array_keys($grafo)
    ]);
    exit;
}

// Mostrar grafo para debug (opcional, puede ser muy grande)
error_log("Grafo construido:");
error_log(print_r($grafo, true));

$resultado = dijkstra($grafo, $origen, $destino);

if (!$resultado || empty($resultado['camino'])) {
    echo json_encode(['error' => 'No se encontró una ruta']);
} else {
    echo json_encode($resultado);
}
