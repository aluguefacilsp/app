const imoveis = [
    {
        id: "1",
        titulo: "Casa Residencial",
        preco: "R$ 2.000/mês",
        localizacao: "São Paulo",
        descricao: "Localizada no centro, ideal para famílias.",
        imagem: "imagens/casa1.jpg",
        caracteristicas: ["2 Quartos", "2 Banheiros", "1 Cozinha", "1 Sala"]
    },
    {
        id: "2",
        titulo: "Prédio Comercial",
        preco: "R$ 8.500/mês",
        localizacao: "Rio de Janeiro",
        descricao: "Perfeito para empresas e escritórios.",
        imagem: "imagens/predio1.jpg",
        caracteristicas: ["10 Salas", "4 Banheiros"]
    },
    {
        id: "3",
        titulo: "Chácara da Serra",
        preco: "R$ 900/dia",
        localizacao: "Minas Gerais",
        descricao: "Ideal para fins de semana e descanso.",
        imagem: "imagens/chacara2.jpg",
        caracteristicas: ["2 Quartos", "1 Banheiro", "1 Sala"]
    },
    {
        id: "4",
        titulo: "Espaço de Eventos Premium",
        preco: "R$ 3.000/evento",
        localizacao: "São Paulo",
        descricao: "Salão moderno com estrutura completa.",
        imagem: "imagens/eventos1.jpg",
        caracteristicas: ["5 Ambientes", "3 Banheiros"]
    },
    {
        id: "5",
        titulo: "Chácara com Piscina",
        preco: "R$ 400 / dia",
        localizacao: "Rio de Janeiro",
        descricao: "Espaçosa e ideal para eventos familiares.",
        imagem: "imagens/characa1.jpg",
        caracteristicas: ["4 Quartos", "3 Banheiros", "1 Cozinha", "2 Salas"]
    }
];

// Função para pegar parâmetros da URL (id do imóvel)
function obterParametroURL(nome) {
    const urlParams = new URLSearchParams(window.location.search);
    return urlParams.get(nome);
}

// Mapeamento de ícones para comodidades
const icones = {
    "Quartos": "fa-bed",
    "Banheiros": "fa-bath",
    "Cozinha": "fa-utensils",
    "Sala": "fa-couch",
    "Ambientes": "fa-building"
};

document.addEventListener("DOMContentLoaded", () => {
    const id = obterParametroURL("id");
    const imovel = imoveis.find(i => i.id === id);

    if (imovel) {
        document.getElementById("imagem").src = imovel.imagem;
        document.getElementById("titulo").textContent = imovel.titulo;
        document.getElementById("preco").textContent = imovel.preco;
        document.getElementById("localizacao").textContent = imovel.localizacao;
        document.getElementById("descricao").textContent = imovel.descricao;

        const caracteristicasDiv = document.getElementById("caracteristicas");
        imovel.caracteristicas.forEach(c => {
            const span = document.createElement("span");
            const palavra = c.split(" ")[1]; // Ex: "2 Quartos" -> Quartos
            const icone = icones[palavra] || "fa-circle";
            span.innerHTML = `<i class="fas ${icone}"></i> ${c}`;
            caracteristicasDiv.appendChild(span);
        });
    } else {
        document.querySelector("main").innerHTML = "<p>Imóvel não encontrado.</p>";
    }
});
