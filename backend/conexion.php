<?php
$conexion = new mysqli("db", "metro", "Montalvo00", "metroasir");
if ($conexion->connect_error) {
    die("Error de conexión: " . $conexion->connect_error);
}
$conexion->set_charset("utf8");
