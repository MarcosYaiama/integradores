

class EstadoUsuarios extends Definicoes {

    constructor(cargo, div, dados, selecao = null, dados_selec = null, online = 0, disp = false) {
        super();
        this._cargo = cargo;
        this.lista_usuarios_banco = [];
        this.lista_usuarios_tabela = [];
        this.dados_a_serem_exibidos = dados;
        this.dados_a_serem_exibidos_selec = dados_selec;
        this.online = online;
        this.disponibilidade = disp;
        // console.log(this._endereco);

        // this._endereco = "192.168.43.98";
        // console.log(this.dados_a_serem_exibidos);
        this._div = document.querySelector(div);    // A div onde ficara a tabela com os usuarios
        // console.log(div);
        // console.log(this._div);
        this._selecao = !(selecao === null) ? document.querySelector(selecao) : false;    //Verifica quando é necessario criar a caixa de options
        console.log("Construtor");
        this.atualizaObjeto();
    }

    usuarioTabela() {    // Retorna todos os dados da tabela carregada para exibir os usuarios



        let dados_recebidos = this.dados_a_serem_exibidos;
        let lista_usuarios = [];
        if (this._div.children.length) {
            let tabela = this._div.querySelector('.tabela-usuario-JS')
            let usuarios = tabela.querySelectorAll('.usuario-JS');
            // console.log('Usuarios=> ',usuarios);

            usuarios.forEach(
                usuario => {
                    let dados = dados_recebidos;

                    lista_usuarios.push(function () {
                        let obj = {};
                        dados.forEach(dado => {

                            obj[dado] = usuario.querySelector("." + dado.toString()).textContent;

                        });
                        return obj;
                    }());
                });
        }
        // console.log(lista_usuarios)
        this.lista_usuarios_tabela = lista_usuarios;
    }



    usuarioBanco() {
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

        let xhr = new XMLHttpRequest();
        if (this.disponibilidade) {
            xhr.open('GET', `http://${this._endereco}:5000/disponibilidade_guarda/${this.online}`);
         }
        else{
            xhr.open('GET', "http://" + this._endereco + ":5000/resposta_json/" + this._cargo + "/" + this.online);
        }
        xhr.addEventListener('load', function () {
            if (xhr.status == 200) {
                let resultados = JSON.parse(xhr.responseText);
                // console.log("RESULTS=> ", resultados);
                resultados.forEach(resultado => {
                    // console.log("RESULTADO =>", resultado);
                    
                    lista_usuarios.push({
                        id: resultado.id,
                        nome: resultado.nome,
                        status: resultado.status,
                        cargo: resultado.cargo
                    });                   
                });
            }

            // console.log(tamanho_tabela.length, lista_usuarios.length);
            // console.log(tamanho_tabela, lista_usuarios);
            // console.log("CARGO  ", cargo);
            if ((tamanho_tabela.length != lista_usuarios.length) && update) {
                update(lista_usuarios, div, template, dados, cargo, online);
                div_selec ? update(lista_usuarios, div_selec, template_selec, dados_selec, cargo.toLowerCase()) : null;
            }
            if (lista_usuarios.length == 0) {
                div.innerHTML = "";
                div_selec?div_selec.innerHTML = "":null;

            }
        });
        xhr.send();
    }

    _template_selecao(model, dados,cargo) {
        let htmlReturn = '';
        // console.log(dados);
        model.forEach(item => {
            // console.log(item);
            let exibicao = '';
            let ultimo_dado = dados[1][-1];
            dados[1].forEach(element => {
                if (exibicao.length > 0 && element != ultimo_dado) {
                    exibicao += ' - '
                }
                exibicao += item[element];
            });
            console.log(cargo);
            
            htmlReturn += `
                <option value="${item[dados[0]]}">${exibicao}</option>
            `
        });
        return `<select name="${cargo}" class="form-control">
                    ${htmlReturn}
                </select>`
    }

    _template(model, exibir_dados, cargo, online) {
        let htmlBody = '';
        let htmlHead = '<tr>';
        let exibir = exibir_dados;
        // console.log("EXIBIR=> ", exibir_dados);
        model.forEach(item => {
            // console.log('Entrei')
            htmlBody += '<tr class="usuario-JS">'
            exibir.forEach(dado => {
                htmlBody += `<td class="${dado}">${item[dado]}</td>`
            });
            htmlBody += "</tr>";
        });
        exibir.forEach(dado => {
            htmlHead += `<th>${dado.charAt(0).toUpperCase() + dado.substr(1).toLowerCase()}</th>` //O mesmo que Capitalize do Python
        });
        htmlHead += "</tr>"

        return `Funcionarios ${cargo == 'ALL' ? "" : cargo} ${online ? "Online" : "Offline"}: <table class="table table-striped table-responsive table-bordered tabela-usuario-JS">
            <thead>
                ${htmlHead}    
            </thead>
            <tbody>
                ${htmlBody}
            <tbody>
        </table>`
    }
    update(model, div, template, dados, cargo, online) {
        // console.log(this._div);
        // console.log(model);
        div.innerHTML = template(model, dados, cargo, online);


    }
    //PROBLEMA COM ARRAY JS RESOLVER !!!!!!!!!!!!!!
    atualizaObjeto() {
        this.usuarioBanco();
        this.usuarioTabela();
    }
}
