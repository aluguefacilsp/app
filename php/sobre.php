<?php
session_start();

if (!isset($_SESSION['usuario_id'])) {
    // Se não estiver logado, redireciona para login
    header("Location: ../login.html");
    exit;
}
?>

<p>Bem-vindo, <?php echo $_SESSION['usuario_nome']; ?>!</p>


<?php 

include_once("menu.php");
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
    
    
    
    <!-- Chácara com Piscina -->
    <a href="detalhes.html?id=5" class="property-card" data-type="chacara">
        <div class="icon-overlay">
            <i class="fas fa-swimming-pool"></i>
            <i class="fas fa-bbq"></i>
        </div>
        <img src="imagens/characa1.jpg" alt="Chácara com Piscina" />
        <h3>Chácara Luxuosa com Piscina</h3>
        <div class="features">
            <i class="fas fa-bed"></i> 4 Quartos
            <i class="fas fa-bath"></i> 3 Banheiros
            <i class="fas fa-utensils"></i> Cozinha gourmet
            <i class="fas fa-couch"></i> 2 Salas amplas
        </div>
        <p>Perfeita para lazer em família, com piscina, churrasqueira e área verde ampla.</p>
        <span>R$ 400/dia</span>
    </a>
</main>


<script src="scripts.js"></script>
</body>
</html>
