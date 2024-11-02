document.getElementById('contatoForm').addEventListener('submit', function(e) {
    e.preventDefault();
    const contatoNome = document.getElementById('contatoNome').value;
    const contatoEmail = document.getElementById('contatoEmail').value;
    const mensagem = document.getElementById('mensagem').value;

    alert(`Mensagem enviada com sucesso!\nNome: ${contatoNome}\nE-mail: ${contatoEmail}`);
    this.reset(); // Limpa o formulário após o envio
});

function inscrever(curso) {
    alert(`Você se inscreveu no curso: ${curso}`);
}
