function criaTabela(tabela) {   
    var tr = document.createElement('tr');
    var th_id = document.createElement('th');
    th_id.textContent = 'ID';
    var th_nome = document.createElement('th');
    th_nome.textContent = 'Nome';
    var th_disponibilidade = document.createElement('th');
    th_disponibilidade.textContent = 'Disponibilidade';
    tr.appendChild(th_id);
    tr.appendChild(th_nome);
    tr.appendChild(th_disponibilidade);
    tabela.querySelector('thead').appendChild(tr);    
}

function criaSelecao() {
    let div = document.querySelector('#selecao-guardas');
    let label = document.createElement('label');
    let select = document.createElement('select');
    label.textContent = 'Guarda';
    select.classList.add('form-control');
    select.name = 'guarda';
    div.appendChild(label);
    div.appendChild(select);
}

function adicionaDadosTabela(tabela, guardas) {
    //Para cada paciente na lista de objetos...
    guardas.forEach(function (guarda) {


        if(atualizar(tabela, guarda)){
            let tr = document.createElement('tr');
    
            tr.appendChild(criaTd(guarda.id));
            tr.appendChild(criaTd(guarda.nome));
            tr.appendChild(criaTd(guarda.status));
            tabela.querySelector('tbody').appendChild(tr);
        }
    })
    

    // Pega dados da tabela e os compara, caso esteja diferente exclui a linha e atualiza

    // cria TD
     
}


function criaTd(atributo){
    td = document.createElement('td');
    td.textContent = atributo;
    return td;
}

function atualizar(tabela, guarda,lista_guardas=false){
    itens = tabela.querySelectorAll('tbody tr');
    
    //---------------------------------------------------------------------------------------------
    //---------------------------------------------------------------------------------------------
    //Deleta a tabela e o campo de seleção caso guarda seja false e os campos estejam preenchidos
    if(!guarda && itens.length > 0){
        document.querySelector('#selecao-guardas').innerHTML = '';
        tabela.querySelector('tbody').innerHTML = '';
        tabela.querySelector('thead').innerHTML = '';
        
        tabela_criada = false; //Variavel Global vinda do arquivo guarda-reprova-cco.js
    }
    //---------------------------------------------------------------------------------------------
    //---------------------------------------------------------------------------------------------
    let lista_guardas_bd = lista_guardas;
    // guardas.forEach(function(item){
    //     lista_guardas_bd.push(objetoGuarda(item.querySelectorAll('td')[0].textContent,
    //     item.querySelectorAll('td')[1].textContent,
    //     item.querySelectorAll('td')[2].textContent).id);
    // });
    console.log('Antes do if: ' + lista_guardas_bd);
    if(itens.length > 0){
        let existe = false;
        itens.forEach(function(item){
        
            
            // console.log('Inner HTML do Item: ' + item.innerHTML);
            // console.log(item);
            
            // Pega o conteudo das tds para criar o objeto com as caracteristicas do guarda
            guarda_tabela = objetoGuarda(item.querySelectorAll('td')[0].textContent,
                                         item.querySelectorAll('td')[1].textContent,
                                         item.querySelectorAll('td')[2].textContent);
            console.log('Antes do for: ' + lista_guardas_bd);
            if(lista_guardas){
                lista_guardas_bd.forEach(function(guarda_a){
                    if(guarda_a == guarda_tabela.id){
                        // console.log("Usuario " + guarda_a + " existe");
                        //Remove o item do array caso ele exista
                        console.log("Usuario sendo excluido: " + lista_guardas_bd[lista_guardas_bd.indexOf(guarda_a)]);
                        lista_guardas_bd.splice(lista_guardas_bd.indexOf(guarda_a),1);
                        console.log('Lista com usuario a menos: ' + lista_guardas_bd);
                    }
                });
            }
            
            // Verifica se o id já está na tabela
            if(guarda_tabela.id == guarda.id){
                // Verifica se o status está atualizado
                // if(guarda_tabela.status != guarda.status){
                //     // Atualiza o texto do status do guarda
                //     console.log(guarda.status);
                //     item.querySelectorAll('td')[2].textContent = guarda.status;
                // }
                existe = true;
            }
        });
        if(!existe){
            return true;
        }else{
            return false;
        }
    }else{
        console.log('Inner HTML: ' + itens.innerHTML);
        return true;
    }
}

function objetoGuarda(id,nome,status) {

    return guarda_tabela = {
        id: id,
        nome: nome,
        status: status,
    };
    
}



function adicionaDadosSelecao(guardas){
    let div = document.querySelector('#selecao-guardas select');
    guardas.forEach(function(guarda){
        
        if (verificaExistenciaItemNoHTML(guarda, div)){
            let linha = document.createElement('option');
            linha.textContent = guarda.id;
            linha.value = guarda.id;
            div.appendChild(linha);
        }
    });
    
}

function verificaExistenciaItemNoHTML(guarda, div) {
    let itens_option = div.querySelectorAll('option');
    let existe = false;
    itens_option.forEach(function(item) {
        if(guarda.id == item.textContent){
            existe = true;
        }
    });
    if(existe){
        return false;
    }else{
        return true;
    }
}

function buscaItensTabela(seletor_tabela){
    tabela = document.querySelector(seletor_tabela)
}