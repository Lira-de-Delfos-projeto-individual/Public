document.addEventListener('DOMContentLoaded', function() {
  // Seleciona todos os botões de acordeão
  var botoesAcordeao = document.querySelectorAll('.botao-acordeao');
  
  // Adiciona um evento de clique a cada botão
  botoesAcordeao.forEach(function(botao) {
    botao.addEventListener('click', function() {
      // Alterna a classe 'active' no botão que foi clicado
      this.classList.toggle('active');
      
      // Seleciona o conteúdo da pergunta
      var conteudo = this.nextElementSibling;
      
      // Alterna a visibilidade do conteúdo
      if (conteudo.style.display === 'block') {
        conteudo.style.display = 'none';
      } else {
        conteudo.style.display = 'block';
      }
    });
  });
});
