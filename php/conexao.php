<?php
$host = "localhost";
$usuario = "root";
$senha = "";
$banco = "aluguefacil";

$conn = new mysqli($host, $usuario, $senha, $banco);

if ($conn->connect_error) {
    die("Erro de conexão com o banco: " . $conn->connect_error);
}
?>
