<?php
session_start();

// ✅ Verifica se o usuário está logado
if (!isset($_SESSION['usuario_id']) || empty($_SESSION['usuario_id'])) {
    header("Location: login.html");
    exit();
}

// ✅ Conexão com o banco de dados
$host = 'localhost';
$db = 'aluguefacil'; // ⚠️ Corrigido para o nome real do seu banco
$user = 'root';
$pass = '';

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8mb4", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Erro na conexão com o banco: " . $e->getMessage());
}

// ✅ Processamento do formulário
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario_id = $_SESSION['usuario_id'];
    $titulo = $_POST['titulo'];
    $descricao = $_POST['descricao'];
    $cep = $_POST['cep'];
    $endereco = $_POST['endereco'];
    $tipo = $_POST['tipo'];
    $valor = $_POST['valor'];
    $quartos = $_POST['quartos'];
    $banheiros = $_POST['banheiros'];
    $sala = $_POST['sala'] ?? 0;
    $cozinha = $_POST['cozinha'] ?? 0;
    $area = $_POST['area'];
    $garagem = isset($_POST['garagem']) ? 1 : 0;
    $mobiliado = isset($_POST['mobiliado']) ? 1 : 0;

    // ✅ Inserção dos dados no banco (tabela correta: imoveis_usuarios)
    $stmt = $pdo->prepare("INSERT INTO imoveis_usuarios (
        usuario_id, titulo, descricao, cep, endereco, tipo, valor,
        quartos, banheiros, sala, cozinha, area, garagem, mobiliado
    ) VALUES (
        :usuario_id, :titulo, :descricao, :cep, :endereco, :tipo, :valor,
        :quartos, :banheiros, :sala, :cozinha, :area, :garagem, :mobiliado
    )");

    $stmt->execute([
        ':usuario_id' => $usuario_id,
        ':titulo' => $titulo,
        ':descricao' => $descricao,
        ':cep' => $cep,
        ':endereco' => $endereco,
        ':tipo' => $tipo,
        ':valor' => $valor,
        ':quartos' => $quartos,
        ':banheiros' => $banheiros,
        ':sala' => $sala,
        ':cozinha' => $cozinha,
        ':area' => $area,
        ':garagem' => $garagem,
        ':mobiliado' => $mobiliado
    ]);

    $imovel_id = $pdo->lastInsertId();

    // ✅ Upload das imagens
    $uploadDir = 'uploads/';
    if (!file_exists($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    foreach ($_FILES['imagens']['tmp_name'] as $index => $tmpName) {
        if ($_FILES['imagens']['error'][$index] === UPLOAD_ERR_OK) {
            $nomeOriginal = basename($_FILES['imagens']['name'][$index]);
            $ext = pathinfo($nomeOriginal, PATHINFO_EXTENSION);
            $novoNome = uniqid("img_") . '.' . $ext;
            move_uploaded_file($tmpName, $uploadDir . $novoNome);

            // ✅ Salvar caminho da imagem na tabela imagens_imovel
            $stmtImg = $pdo->prepare("INSERT INTO imagens_imovel (imovel_id, caminho_arquivo) VALUES (:imovel_id, :caminho)");
            $stmtImg->execute([
                ':imovel_id' => $imovel_id,
                ':caminho' => $uploadDir . $novoNome
            ]);
        }
    }

    echo "<h3 style='font-family:sans-serif;'>✅ Imóvel cadastrado com sucesso!</h3>";
    echo "<p><a href='cad_imovel.php'>Cadastrar outro imóvel</a></p>";
} else {
    echo "<p>Método inválido. Acesse a partir do formulário.</p>";
}
?>
