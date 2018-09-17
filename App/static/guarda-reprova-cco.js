var tabela = document.querySelector('#tabela-guardas');
var tabela_criada = false;
var dados_carregados = false;
setInterval(function(){
    var xhr = new XMLHttpRequest();
    xhr.open('GET', "http://localhost:5000/resposta_json/guarda/1");
    xhr.addEventListener('load', function(){
        console.log(xhr.status);                   
        if (xhr.status == 200) {
            //Pega a resposta, no caso um Json,a resposta é uma string
            //Java Script Object Notation
            var resposta = xhr.responseText;
            // console.log(typeof resposta);
            
            //Lê o JSON em formato de string e devolve um objeto        
            var guardas = JSON.parse(resposta);
            if(!tabela_criada && guardas.length > 0){
                tabela_criada = true;
                criaTabela(tabela);
                criaSelecao();
                adicionaDadosTabela(tabela, guardas);
                adicionaDadosSelecao(guardas);
            }
            else if (tabela_criada && guardas.length){
                adicionaDadosTabela(tabela, guardas);
                adicionaDadosSelecao(guardas);
                //deletaItensRemovidos;
                //adicionaNovosItens();
                let a = 0;
            }
            if(guardas <= 0){
                atualizar(tabela, false,lista_guardas);
            }else{
                let lista_guardas = [];
                
                guardas.forEach(function(guarda){
                    lista_guardas.push(guarda.id);
                });
                console.log(lista_guardas);
                guardas.forEach(function(guarda){
                    console.log("Guarda sendo enviado: "+ guarda.id);
                    atualizar(tabela,guarda,lista_guardas);
                });
            }
            console.log(typeof pacientes);
            
    }
    
});
xhr.send();
}, 3000);
