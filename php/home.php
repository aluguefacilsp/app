<?php
session_start();

if (!isset($_SESSION['usuario_id'])) {
    // Se não estiver logado, redireciona para login
    header("Location: ../login.php");
    exit;
}
?>

<!-- <p>Bem-vindo, <?php //echo $_SESSION['usuario_nome']; ?>!</p> -->


<?php

include_once("menu.php");

?>


<?php

include_once("view_imovel.php");

?>


<!--

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>AlugueFácil - Seletor de Imóveis</title>
    <link rel="stylesheet" href="estilos/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
</head>
<body>

    <header>
        <div class="header-content">
            <div class="logo">
                <h1>AlugueFácil</h1>
            </div>

            <nav class="nav-links">
                <a href="home.php">Início</a>
                <a href="sair.php">sair</a>
            </nav>

            <div class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </div>
        </div> -->

        <!-- Barra de pesquisa agora com ícones -->


