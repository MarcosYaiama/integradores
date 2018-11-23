//BUG RELACIONADO AO PEDIDO DE NOVA ANALISE, RESOLVER
class TabelaGuarda extends Definicoes {

    constructor(cargo, div, dados, redir, chamado_individual) {
        super();
        this._cargo = cargo;
        this.redirecionamento = redir;
        console.log("CARGO ==>>", this._cargo);
        this.lista_pedidos_banco = [];
        this.lista_pedidos_tabela = [];
        this.dados_a_serem_exibidos = dados;
        this._chamado_individual = chamado_individual;
        console.log("Individual", this._chamado_individual);
        this._div = document.querySelector(div);    // A div onde ficara a tabela com os usuarios
        // console.log(div);
        // console.log(this._div);
        console.log("Construtor");
        this.atualizaObjeto();
    }

    usuarioTabela() {    // Retorna todos os dados da tabela carregada para exibir os usuarios



        let dados_recebidos = this.dados_a_serem_exibidos;
        let lista_pedidos = [];
        console.log(this._div.children.length);
        
        if (this._div.children.length > 1) {
            let tabela = document.querySelector(".tabela-pedidos-" + this._cargo + "-JS");
            let usuarios = tabela.querySelectorAll('.dados-carga-JS');
            // console.log('Usuarios=> ',usuarios);
            usuarios.forEach(
                usuario => {
                    let dados = dados_recebidos;
                    lista_pedidos.push(function () {
                        let obj = {};
                        dados.forEach(dado => {
                            obj[dado] = usuario.querySelector("." + dado.toString()).textContent;
                        });
                        return obj;
                    }());
                });
        }
        this.lista_pedidos_tabela = lista_pedidos;
        console.log("LISTA PEDIDOS = >", this.lista_pedidos_tabela)
    }



    usuarioBanco() {
        //METODS
        let update = this.update;
        let template = this._template;
        //Query Selectors
        let div = this._div;
        //Vars
        let lista_pedidos = [[],[]];    //Armazenara todos os usuarios e suas caracteristicas
        let tamanho_tabela = this.lista_pedidos_tabela;
        let dados = this.dados_a_serem_exibidos;
        let cargo = this._cargo.toUpperCase();
        let redir = this.redirecionamento;
        let xhr = new XMLHttpRequest();
        let tipo_chamado = this._chamado_individual;

        xhr.open('GET', "http://" + this._endereco + ":5000/resposta_json/" + this._cargo + '/' + this._chamado_individual);
        xhr.addEventListener('load', function () {
            let resultados = '';
            if (xhr.status == 200) {
                resultados = JSON.parse(xhr.responseText);
                
                console.log("RESULTS0=> ", resultados[1]);
                console.log("RESULTS1=> ", resultados);
                if (resultados[0] != undefined){ 
                    resultados[0].forEach(resultado => {
                        console.log("RESULTADO =>", resultado);
                        // console.log("RESULTADO COM 1 item a mais =>", resultado.length > 2 ? resultado[2] : false);

                        lista_pedidos[0].push({
                            id: resultado['id'],
                            nome: resultado['nome'],
                            id_carga: resultado['id_carga'],
                            cco: resultado['cco'],
                            status: resultado['status']                        
                        });
                    });
                    resultados[1].forEach(resultado => {
                        console.log("RESULTADO =>", resultado);

                            lista_pedidos[1].push({
                                placa: resultado['placa'],
                                fornecedor: resultado['fornecedor'],
                                grao: resultado['grao'],
                                id_carga: resultado['id_carga']                    
                            });
                    });
                }
            
        
                if (lista_pedidos[0] != undefined && lista_pedidos[0] != null && lista_pedidos && resultados[0] != undefined){
                    
                    console.log("Lista Pedidos ", resultados, " x ", tamanho_tabela, " Tamanho Tabela");

                    if ((tamanho_tabela.length != resultados.length)) {
                        console.log(tipo_chamado);
                        
                        update(resultados, div, template, dados, redir, cargo, tipo_chamado);
                    }
                    if (resultados.length == 0) {
                        let texto_else = tipo_chamado == 1 ? "do CCO" : "de Escopo Global";
                        div.innerHTML = `<h2 style="text-align: center; background-color: #337ab7; color: white"><strong>Nenhum chamado ${texto_else} até o momento</strong></h2>`;
                        
                    }
                }
            }
        });
        xhr.send();
    }

    _template(model, exibir_dados, redir, cargo, tipo_chamado) {
        console.log("Model",model);
        console.log("Model----0",model[0][0]);
        console.log("Model----1",model[1][0]);
        console.log("Exibir",exibir_dados);
        console.log("Redir",redir);
        console.log("CARGO",cargo);
        console.log("TP CHamado",tipo_chamado);
        let titulo_h2 = tipo_chamado == 1 ? "Chamados Direto do CCO" :"Chamados de Escopo Global";
        

        return ` 
        ${model[0] != undefined ?` 
            <div style="border: 3px solid white; padding: 1%; margin: 1%">
                <h2 style="text-align: center; color: white; padding: 1%"><strong>${titulo_h2}</strong></h2>
                <table class="table table-responsive tabela-pedidos-${cargo.toLowerCase()}-JS">
                    <thead>
                        <tr>
                        ${exibir_dados.map(n => `<th>${n.charAt(0).toUpperCase() + n.substr(1).toLowerCase()}</th>`)}
                        </tr>
                    </thead>
                    <tbody>
                        <tr class="dados-carga-JS">
                            <td class="placa">${model[1][0]['placa']}</td>
                            <td class="fornecedor">${model[1][0]['fornecedor']}</td>
                            <td class="requisição">
                                ${model[0][0]['status'] == 'Aguardando' ?`
                                <form action="${redir}" method="POST">
                                    <input type="hidden" value="${model[1][0]['placa']}" name="placa">
                                    <input type="hidden" value="${model[1][0]['fornecedor']}" name="fornecedor">
                                    <input type="hidden" value="${model[1][0]['grao']}" name="grao">
                                    <input type="hidden" value="${model[1][0]['id_carga']}" name="id_carga">
                                    <input type="hidden" value="${model[0][0]['cco']}" name="cco">
                                    <input type="hidden" value="${model[0][0]['status']}" name="situacao">
                                    <input type="hidden" value="${model[0][0]['id']}" name="id">
                                    <input type="hidden" value="${model[0][0]['nome']}" name="guarda">
                                    <button class="btn btn-success form-control">Aceitar</button>
                                </form>
                                <form action="/acao_guarda" method="POST" style="display:${tipo_chamado == 1?"":"none"}">
                                    <input type="hidden" value="${model[0][0]['id']}" name="id">
                                    <input type="hidden" value="${model[1][0]['id_carga']}" name="id_carga">
                                    <input type="hidden" value="all" name="guarda">
                                    <button class="btn btn-danger form-control">Recusar</button>
                                </form>`
                                :
                                `<form action="${redir}" method="POST">
                                    <input type="hidden" value="${model[1][0]['placa']}" name="placa">
                                    <input type="hidden" value="${model[1][0]['fornecedor']}" name="fornecedor">
                                    <input type="hidden" value="${model[1][0]['grao']}" name="grao">
                                    <input type="hidden" value="${model[1][0]['id_carga']}" name="id_carga">
                                    <input type="hidden" value="${model[0][0]['cco']}" name="cco">
                                    <input type="hidden" value="${model[0][0]['status']}" name="situacao">
                                    <input type="hidden" value="${model[0][0]['id']}" name="id">
                                    <input type="hidden" value="1" name="redirecionar">
                                    <button class="btn btn-primary form-control">Ver Detalhes</button>
                                </form>`}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
            `:``
        }`;
    }
    update(model, div, template, dados, redirect, cargo, tipo_chamado) {
        // console.log(this._div);
        // console.log(model);
        let redir = redirect;
        div.innerHTML = template(model, dados, redir, cargo, tipo_chamado);


    }
    //PROBLEMA COM ARRAY JS RESOLVER !!!!!!!!!!!!!!
    atualizaObjeto() {
        this.usuarioBanco();
        this.usuarioTabela();
    }
}
