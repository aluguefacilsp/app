<?php

include_once("menu.php");

?>

<br>

<br>


<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de Imóvel</title>
    <style>
        :root {
            --primary-color: #1a1a1a;        /* Preto elegante */
            --secondary-color: #555555;     /* Cinza escuro */
            --accent-color: #3498db;        /* Azul moderno */
            --background: #f2f2f2;
            --white: #ffffff;
            --gray-light: #dcdcdc;
            --input-border: #ccc;
        }

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: var(--background);
            /* padding: 30px; */ 
            color: var(--primary-color);
        }

        .container {
            max-width: 850px;
            margin: auto;
            background-color: var(--white);
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
        }

        h2 {
            text-align: center;
            color: var(--primary-color);
            margin-bottom: 30px;
        }

        form {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
        }

        form label {
            font-weight: 600;
            margin-bottom: 6px;
            display: block;
            color: var(--secondary-color);
        }

        form input[type="text"],
        form input[type="number"],
        form input[type="file"],
        form textarea,
        form select {
         padding: 10px; 
            border: 1px solid var(--gray-light);
            border-radius: 8px;
            width: 100%;
            background-color: #fff;
            color: var(--primary-color);
            transition: border 0.3s ease;
        }

        form input:focus,
        form textarea:focus,
        form select:focus {
            border-color: var(--accent-color);
            outline: none;
        }

        textarea {
            resize: vertical;
            min-height: 100px;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        .checkbox-group {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-top: 5px;
        }

        .checkbox-group input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: var(--primary-color);
        }

        button {
            grid-column: 1 / -1;
            padding: 15px;
            background-color: var(--primary-color);
            color: var(--white);
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #000;
        }

        @media (max-width: 700px) {
            form {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Cadastro de Imóvel</h2>
    <form action="processa_cad_im.php" method="post" enctype="multipart/form-data">
        <div class="full-width">
            <label for="titulo">Título do Imóvel</label>
            <input type="text" id="titulo" name="titulo" required>
        </div>

        <div class="full-width">
            <label for="descricao">Descrição</label>
            <textarea id="descricao" name="descricao" required></textarea>
        </div>

        <div>
            <label for="cep">CEP</label>
            <input type="text" id="cep" name="cep" required>
        </div>

        <div>
            <label for="endereco">Endereço</label>
            <input type="text" id="endereco" name="endereco" required>
        </div>

        <div>
            <label for="tipo">Tipo de Imóvel</label>
            <select id="tipo" name="tipo" required>
                <option value="">Selecione</option>
                <option value="casa">Casa</option>
                <option value="apartamento">Apartamento</option>
                <option value="terreno">Terreno</option>
                <option value="comercial">Comercial</option>
            </select>
        </div>

        <div>
            <label for="valor">Valor (R$)</label>
            <input type="number" id="valor" name="valor" step="0.01" required>
        </div>

        <div>
            <label for="quartos">Quartos</label>
            <input type="number" id="quartos" name="quartos" min="0" required>
        </div>

        <div>
            <label for="banheiros">Banheiros</label>
            <input type="number" id="banheiros" name="banheiros" min="0" required>
        </div>

        <div>
            <label for="sala">Salas</label>
            <input type="number" id="sala" name="sala" min="0">
        </div>

        <div>
            <label for="cozinha">Cozinhas</label>
            <input type="number" id="cozinha" name="cozinha" min="0">
        </div>

        <div>
            <label for="area">Área (m²)</label>
            <input type="number" id="area" name="area" min="0" step="0.1" required>
        </div>

        <div class="checkbox-group full-width">
            <input type="checkbox" id="garagem" name="garagem">
            <label for="garagem">Possui garagem</label>
        </div>

        <div class="checkbox-group full-width">
            <input type="checkbox" id="mobiliado" name="mobiliado">
            <label for="mobiliado">Imóvel mobiliado</label>
        </div>

        <div class="full-width">
            <label for="imagens">Fotos do Imóvel</label>
            <input type="file" id="imagens" name="imagens[]" multiple accept="image/*">
        </div>

        <button type="submit">Cadastrar Imóvel</button>
    </form>
</div>

</body>
</html>
