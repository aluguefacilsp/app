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
                <a href="cad_imovel.php">Cadastrar Imovel</a>
                <a href="sair.php">sair</a>
                      <a href="sobre.php">Contato</a>
            </nav>
        
            <div class="menu-toggle" id="menuToggle">
                <i class="fas fa-bars"></i>
            </div>
        </div>
    
        <!-- Barra de pesquisa agora com ícones -->
        <div class="search-bar-header">
            <div class="search-input">
                <i class="fas fa-search"></i>
                <input type="text" id="searchBar" placeholder="Buscar por nome ou localização...">
            </div>
            <div class="city-selector">
                <i class="fas fa-map-marker-alt"></i>
                <select id="locationFilter">
                    <option value="">Localização</option>
                    <option value="sp">São Paulo</option>
                    <option value="rj">Rio de Janeiro</option>
                    <option value="mg">Minas Gerais</option>
                </select>
            </div>
        </div>
    </header>

    <section class="filter-section">


    <select id="typeFilter">
        <option value="">Tipo de imóvel</option>
        <option value="casa">Casa</option>
        <option value="predio">Prédio</option>
        <option value="chacara">Chácara</option>
        <option value="evento">Casa de Evento</option>
    </select>


    <input type="number" id="priceMin" placeholder="Preço mín (R$)">
    <input type="number" id="priceMax" placeholder="Preço máx (R$)">

    <select id="sortFilter">
        <option value="">Ordenar por</option>
        <option value="lowPrice">Mais barato</option>
        <option value="highPrice">Mais caro</option>
        <option value="recent">Mais recente</option>
    </select>
</section>