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
      if (conteudo.style.display == 'block') {
        conteudo.style.display = 'none';
      } else {
        conteudo.style.display = 'block';
      }
    });
  });
});
// aqui fizemos comportamento de acordeão, ou seja, estamos mostrando e escondendo algum conteúdo
// o queryselectorAll retorna uma nodelist de todos os botõees
// Para cada botão de acordeão, o código adiciona um ouvinte de evento (addEventListener) para escutar o evento de clique.
//  A função toggle verifica se a classe active já está presente:
