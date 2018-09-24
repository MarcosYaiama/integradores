
function exibeTexto(texto) {
    
    let tela = document.querySelector('.tela');
    let label = document.createElement('label');
    label.textContent = texto;
    tela.appendChild(label);
    console.log(tela.innerHTML);

}

setInterval(function(){
    let xhr = new XMLHttpRequest();
    xhr.open('GET', "http://localhost:5000/resposta_json/processo/0");
    xhr.addEventListener('load', function(){
        if(xhr.status == 200){
            let respostas = JSON.parse(xhr.responseText);
            respostas.forEach(resposta => {
                exibeTexto(resposta[0])
            });
        }
    });
    xhr.send();
}, 2000);