

class EstadoPrototype extends Prototype{

    constructor(cargo, div, dados, selecao = null, dados_selec = null, online=0){
        super();
        this._cargo = cargo;
        this.lista_usuarios_banco = [];
        this.lista_usuarios_tabela = [];
        this.dados_a_serem_exibidos = dados;
        this.dados_a_serem_exibidos_selec = dados_selec;
        this.online = online;
        this._retorno_update_antes = false;
        this._contador = 0;
        this._audios = document.querySelectorAll('audio');
        // console.log(this._endereco);
        
        // this._endereco = "192.168.43.98";
        // console.log(this.dados_a_serem_exibidos);
        this._div = document.querySelector(div);    // A div onde ficara a tabela com os usuarios
        // console.log(div);
        // console.log(this._div);
        this._selecao = !(selecao === null) ? document.querySelector(selecao):false;    //Verifica quando é necessario criar a caixa de options
        console.log("Construtor");
        this.atualizaObjeto();
    }

    usuarioTabela(){    // Retorna todos os dados da tabela carregada para exibir os usuarios



        let dados_recebidos = this.dados_a_serem_exibidos;
        let lista_usuarios = [];
        if (this._div.children.length){
            let tabela = document.querySelector(".tabela-prototype-JS");
            let usuarios = tabela.querySelectorAll('.dados-carga-JS');
            // console.log('Usuarios=> ',usuarios);
            usuarios.forEach(
                usuario => {
                    let dados = dados_recebidos;
                    lista_usuarios.push(function() {
                        let obj = {};
                        dados.forEach(dado =>{
                            obj[dado] = usuario.querySelector("."+ dado.toString()).textContent; 
                        });
                        return obj;
                    }());
                });
            }
            // console.log(lista_usuarios)
            this.lista_usuarios_tabela = lista_usuarios;
        }
    


    usuarioBanco(){
        //METODS
        let update = this.update;
        let template = this._template;
        let template_selec = this._template_selecao;
        //Query Selectors
        let div = this._div;
        let div_selec = this._selecao;
        //Vars
        let lista_usuarios = [];    //Armazenara todos os usuarios e suas caracteristicas
        let tamanho_tabela = this.lista_usuarios_tabela;
        let dados = this.dados_a_serem_exibidos;
        let dados_selec = this.dados_a_serem_exibidos_selec;
        let cargo = this._cargo.toUpperCase();
        let online = this.online;
        
        let contador_do_bug_mardito = 0;

        let xhr = new XMLHttpRequest();
        xhr.open('GET', "http://"+this._endereco+":5000/resposta_json/"+ this._cargo +"/" + this.online);
        xhr.addEventListener('load', ()=>{
            if(xhr.status == 200){
                let resultados = JSON.parse(xhr.responseText);
                // console.log("RESULTS=> ", resultados);
                resultados.forEach(resultado => {
                    // console.log("RESULTADO =>", resultado);
                    lista_usuarios.push({
                        id:resultado[0],
                        grao: resultado[1],
                        fornecedor: resultado[2],
                        destino: resultado[3],
                        placa: resultado[4],
                        estado: resultado[5]});
                });
              }
              if(tamanho_tabela.length && cargo == 'PROCESSO'){
                tamanho_tabela.forEach(item => {
                    lista_usuarios.forEach(dado_banco => {
                        if(item.id == dado_banco.id){
                            if(item.estado != dado_banco.estado){
                                let focus_select_value = document.querySelector('#selecao-processo-JS select').value;
                                // console.log(this._cargo);

                                this._retorno_update_antes = update(lista_usuarios, div, template, dados, cargo, online);
                                console.log("ATUALIZADO PELO UPDATE", this._retorno_update_antes);
                                if (this._retorno_update_antes[0].toLowerCase() == 'guarda'){
                                    contador_do_bug_mardito += 1;
                                    if(contador_do_bug_mardito == 2){
                                        this._contador = 0;
                                        contador_do_bug_mardito = 0;
                                    }
                                }else{
                                    this._contador = 0;
                                }
                                div_selec ? update(lista_usuarios, div_selec, template_selec, dados_selec):null;
                                document.querySelectorAll('#selecao-processo-JS select option').forEach(option =>{
                                    if(option.value == focus_select_value){
                                        document.querySelector('#selecao-processo-JS select').value = focus_select_value;
                                    }
                                })
                            }
                        }
                    })
                })
                // console.log(tamanho_tabela[0].estado);
            }    
            if((tamanho_tabela.length != lista_usuarios.length) && update){
                update(lista_usuarios, div, template, dados, cargo, online);
                div_selec ? update(lista_usuarios, div_selec, template_selec, dados_selec):null;
            }
            console.log(this._contador);
            
            if (lista_usuarios.length == 0) {
                if(this._retorno_update_antes){
                    
                    if (this._retorno_update_antes[0].toLowerCase() != 'guarda'){
                        // console.log('Entrei');
                        
                        if (this._retorno_update_antes.length == 2){
                            let xhrArmazem = new XMLHttpRequest();
                            xhrArmazem.open('GET', `http://${this._endereco}:5000/resposta_json/armazem/${this._retorno_update_antes[1]}`);
                            xhrArmazem.addEventListener('load', () =>{
                                if(xhrArmazem.status == 200){
                                    let resposta = JSON.parse(xhrArmazem.responseText);
                                    this._retorno_update_antes.push(resposta['armazem'])
                                }
                            });
                            xhrArmazem.send();
                        }
                        if (this._retorno_update_antes.length == 3 && this._contador === 0){
                            if (this._retorno_update_antes[2] == 1){
                                console.log('Armazem1');
                                this._audios[1].play();
                            }
                            else{
                                console.log('Armazem2');
                                this._audios[2].play();
                            }
                            this._contador = 1;
                            console.log("CONTADOR APROVA ", this._contador);
                        }
                    }
                }
                div.innerHTML = "";
                // div_selec?div_selec.innerHTML = "":null;
            }
            if (this._retorno_update_antes) {
                console.log(this._retorno_update_antes);
                
                if (this._retorno_update_antes[0].toLowerCase() == 'guarda' && this._contador === 0){
                    this._contador = 1;
                    this._audios[0].play();
                    console.log("CONTADOR IRREGULAR ", this._contador);
                    console.log('IRREGULAR');
                    
                }
            }
            
        });
        xhr.send();
    }
    
    _template_selecao(model, dados){
        let htmlReturn = '';
        // console.log(dados);
        model.forEach(item => {
            // console.log(item);
            let exibicao = '';
            let ultimo_dado = dados[1][-1];
            // console.log(item);
            dados[1].forEach(element => {
                
                if(exibicao.length > 0 && element != ultimo_dado){
                    exibicao += ' - '
                }
                exibicao += item[element];
            });
            htmlReturn += `
                <option value="${item[dados[0]]}">${exibicao}</option>
            `
        });
        return  `<select name="cargas" class="form-control">
                    ${htmlReturn}
                </select>`
    }

    _template(model, exibir_dados, cargo, online){
        let htmlBody = '';
        let htmlHead = '<tr>';
        let exibir = exibir_dados;
        // console.log("EXIBIR=> ", exibir_dados);
        model.forEach(item => {
            // console.log('Entrei')
            htmlBody += '<tr class="dados-carga-JS">'
            exibir.forEach(dado => {
                // console.log(dado);
                
                htmlBody += `<td class="${dado}">${item[dado]}</td>`
            });
            htmlBody+="</tr>";
        });
        exibir.forEach(dado => {
            htmlHead += `<th>${dado.charAt(0).toUpperCase() + dado.substr(1).toLowerCase()}</th>` //O mesmo que Capitalize do Python
        });
        htmlHead+= "</tr>"

        return `Funcionarios ${cargo=='ALL'?"":cargo} ${online?"Online":"Offline"}: <table class="table table-striped table-responsive table-bordered tabela-prototype-JS">
            <thead>
                ${htmlHead}    
            </thead>
            <tbody>
                ${htmlBody}
            <tbody>
        </table>`
}
    update(model, div, template, dados, cargo, online){

        div.innerHTML = template(model, dados, cargo, online);
        // console.log(model);
        
        return model[0] != undefined ? [model[0]['estado'], model[0]['id']]:false;
    }
    //PROBLEMA COM ARRAY JS RESOLVER !!!!!!!!!!!!!!
    atualizaObjeto(){
        this.usuarioBanco();
        this.usuarioTabela();
        this.atualizaPrototipo();
    }
}
