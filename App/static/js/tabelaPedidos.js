//BUG RELACIONADO AO PEDIDO DE NOVA ANALISE, RESOLVER
class TabelaPedidos extends Definicoes {

    constructor(cargo, div, dados, redir, nova_analise) {
        super();
        this._cargo = cargo;
        this.redirecionamento = redir;
        console.log("CARGO ==>>",this._cargo);
        this.lista_pedidos_banco = [];
        this.lista_pedidos_tabela = [];
        this.dados_a_serem_exibidos = dados;
        this._nova_analise = nova_analise;
        this._div = document.querySelector(div);    // A div onde ficara a tabela com os usuarios
        // console.log(div);
        // console.log(this._div);
        console.log("Construtor");
        this.atualizaObjeto();
    }

    usuarioTabela() {    // Retorna todos os dados da tabela carregada para exibir os usuarios



        let dados_recebidos = this.dados_a_serem_exibidos;
        let lista_pedidos = [];
        if (this._div.children.length) {
            let tabela = document.querySelector(".tabela-pedidos-"+ this._cargo +"-JS");
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
        console.log("LISTA PEDIDOS = >",this.lista_pedidos_tabela)
    }



    usuarioBanco() {
        //METODS
        let update = this.update;
        let template = this._template;
        //Query Selectors
        let div = this._div;
        //Vars
        let lista_pedidos = [];    //Armazenara todos os usuarios e suas caracteristicas
        let tamanho_tabela = this.lista_pedidos_tabela;
        let dados = this.dados_a_serem_exibidos;
        let cargo = this._cargo.toUpperCase();
        let redir = this.redirecionamento;
        let xhr = new XMLHttpRequest();
        xhr.open('GET', "http://" + this._endereco + ":5000/resposta_json/" + this._cargo + '/' + this._nova_analise);
        xhr.addEventListener('load', function () {
            if (xhr.status == 200) {
                let resultados = JSON.parse(xhr.responseText);
                // console.log("RESULTS=> ", resultados);
                resultados.forEach(resultado => {
                    // console.log("RESULTADO =>", resultado);
                    // console.log("RESULTADO COM 1 item a mais =>", resultado.length > 2 ? resultado[2] : false);
                    
                    lista_pedidos.push({
                        id: resultado[0],
                        grao: resultado[1],
                        estado: resultado.length > 2?resultado[2]:false
                    });
                });
            }
            console.log("Lista Pedidos ", lista_pedidos," x ", tamanho_tabela, " Tamanho Tabela");
            
            if ((tamanho_tabela.length != lista_pedidos.length) ) {
                update(lista_pedidos, div, template, dados, redir, cargo);
            }
            if (lista_pedidos.length == 0) {
                div.innerHTML = "";
            }
        });
        xhr.send();
    }

    _template(model, exibir_dados, redir, cargo) {
        let htmlBody = '';
        let htmlHead = '<tr>';
        let exibir = exibir_dados;
        let redirecionamento = redir;
        
        // console.log("EXIBIR=> ", exibir_dados);
        let label_tabela = '';
        model.forEach(item => {
            // console.log('Entrei')
            htmlBody += '<tr class="dados-carga-JS">'
            
            for (let dado = 0; dado < exibir.length; dado++) {
                if(dado != 2){
                    htmlBody += `<td class="${Object.keys(item)[dado]}">${item[Object.keys(item)[dado]]}</td>`
                }
                let estado = model[0]['estado'] ?item[Object.keys(item)[2]].toUpperCase():false;
                if(dado == (exibir.length - 1)){
                    
                    let btn = '';
                    let texto_btn = '';
                    let input_name = '';
                    
                    if(!item[Object.keys(item)[2]]){
                        
                        label_tabela = 'Chamados CCO';
                        input_name = 'id_carga';
                        btn = 'btn-danger';
                        texto_btn = 'Verificar';  
                    }else{
                        let estado_copia1 = item[Object.keys(item)[2]].toUpperCase();
                        input_name = 'id_carga_fk';
                        label_tabela = estado_copia1 == 'MAQUINA' || estado_copia1 == 'ANALISTA' ? 'Retornos da Maquina' : 'Pedidos CCO';
                        if (estado_copia1 == 'ANALISTA' || estado_copia1 == 'NOVA ANALISE'){
                            btn = 'btn-primary';       
                            texto_btn = 'Continuar Analise';  
                        }else{
                            btn = 'btn-success';
                            texto_btn = 'Iniciar Analise';  
                        }
                    }
                    
                    htmlBody += `<td><form action="${estado == 'Pedido CCO' || estado == 'Nova Analise' ? '/formAnalise' : redirecionamento}" method="POST">
                    <input type = "hidden" name = "${input_name}" value = "${item[Object.keys(item)[0]]}" >
                    ${estado == 'PEDIDO CCO' || estado == 'NOVA ANALISE' ?'<input type="hidden" name="nova_analise" value="0">':''}
                    <button class="btn ${btn} form-control" type="submit">${texto_btn}</button>
                    </form></td>`;
                
                }
            }
            htmlBody += `</tr>`;
            
        });
        exibir.forEach(dado => {            
            htmlHead += `<th>${dado.charAt(0).toUpperCase() + dado.substr(1).toLowerCase()}</th>` //O mesmo que Capitalize do Python
        });
        
        htmlHead += "<th></th></tr>"

        return `<label>${label_tabela}</label><table class="table table-striped table-responsive table-bordered tabela-pedidos-${cargo.toLowerCase()}-JS">
            <thead>
                ${htmlHead}    
            </thead>
            <tbody>
                ${htmlBody}
            <tbody>
        </table>`
    }
    update(model, div, template, dados, redirect, cargo) {
        // console.log(this._div);
        // console.log(model);
        let redir = redirect;
        div.innerHTML = template(model, dados,redir, cargo);


    }
    //PROBLEMA COM ARRAY JS RESOLVER !!!!!!!!!!!!!!
    atualizaObjeto() {
        this.usuarioBanco();
        this.usuarioTabela();
    }
}
