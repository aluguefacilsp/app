    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Detalhes do Imóvel - AlugueFácil</title>
    <link rel="stylesheet" href="estilos/style.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .detalhes-topo {
        display: flex;
        flex-direction: column;
        gap: 1rem;
        }

        .detalhes-info {
        display: flex;
        flex-direction: column;
        background-color: var(--white);
        padding: 1.5rem;
        border-radius: 10px;
        box-shadow: 0 0 10px var(--shadow);
        margin-top: 1rem;
        }

        .detalhes-info h2 {
        margin: 0;
        font-size: 2rem;
        }

        .detalhes-box {
        display: flex;
        flex-direction: column;
        gap: 0.5rem;
        margin-top: 1rem;
        font-size: 1.1rem;
        }

        .detalhes-preco {
        font-size: 1.4rem;
        color: var(--primary);
        font-weight: bold;
        }

        .alugar-btn {
        margin-top: 2rem;
        padding: 1rem 1.5rem;
        font-size: 1.1rem;
        background-color: var(--primary);
        color: white;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        transition: background-color 0.3s;
        align-self: flex-start;
        }

        .alugar-btn:hover {
        background-color: var(--primary-dark);
        }

        @media (max-width: 768px) {
        .property-details {
            padding: 1rem;
        }

        .detalhes-info h2 {
            font-size: 1.6rem;
        }
        }
    </style>
    </head>
    <body>
    <header>
        <h1>Detalhes do Imóvel</h1>
    </header>

   <main class="property-details">
  <div class="detalhes-topo">
    <img id="imagem" src="" alt="Imagem do imóvel" />

    <div class="detalhes-info">
      <div class="detalhes-header">
        <h2 id="titulo">Título</h2>
        <p class="detalhes-preco">
          <i class="fas fa-tag"></i> <span id="preco"></span>
        </p>
      </div>

      <p id="descricao" class="descricao"></p>
      <p><i class="fas fa-map-marker-alt"></i> <strong>Localização:</strong> <span id="localizacao"></span></p>

      <h3>Comodidades e Estrutura</h3>
      <div class="features" id="caracteristicas"></div>

      <button class="alugar-btn">
        <i class="fas fa-handshake"></i> Quero Alugar este Imóvel
      </button>
    </div>
  </div>
</main> <img id="imagem" src="" alt="Imagem do imóvel" />


    -- <script src="scripts/detalhes.js"></script> 
    </body>
    </html>
