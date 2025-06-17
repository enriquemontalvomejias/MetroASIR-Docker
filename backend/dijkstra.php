<?php
function dijkstra($grafo, $inicio, $fin) {
    $distancia = [];
    $previo = [];
    $nodos = [];

    foreach ($grafo as $nodo => $adyacentes) {
        $distancia[$nodo] = INF;
        $previo[$nodo] = null;
        $nodos[$nodo] = true;
    }

    $distancia[$inicio] = 0;

    while (!empty($nodos)) {
        $min = null;
        foreach ($nodos as $nodo => $_) {
            if ($min === null || $distancia[$nodo] < $distancia[$min]) {
                $min = $nodo;
            }
        }

        if ($min === $fin || $distancia[$min] === INF) {
            break;
        }

        unset($nodos[$min]);

        foreach ($grafo[$min] ?? [] as $vecino => $peso) {
            $alt = $distancia[$min] + $peso;
            if ($alt < $distancia[$vecino]) {
                $distancia[$vecino] = $alt;
                $previo[$vecino] = $min;
            }
        }
    }

    if ($distancia[$fin] === INF) {
        return null; // No hay ruta
    }

    $camino = [];
    for ($u = $fin; $u !== null; $u = $previo[$u]) {
        array_unshift($camino, $u);
    }

    return [
        'camino' => $camino,
        'tiempo' => $distancia[$fin]
    ];
}
