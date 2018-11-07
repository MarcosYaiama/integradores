
class TabelasUsuarios{

    constructor(tabela, dados, online=0){
        this.tabela = tabela;
        if (tabela == 'usuariosGuarda'){
            let objeto = new EstadoUsuarios('guarda', '#div-tabela-guardas-JS', dados=dados, '#selecao-guardas', ['id', ['nome']], online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosCCO'){
            let objeto = new EstadoUsuarios('cco', '#div-tabela-cco-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosAnalise'){
            let objeto = new EstadoUsuarios('analista', '#div-tabela-analise-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuarios'){
            let objeto = new EstadoUsuarios('all', '#div-tabela-all-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'disponibilidade'){
            let objeto = new EstadoUsuarios('guarda', '#disponibilidade-guarda-JS', dados = dados, '#selecao-guardas', ['id', ['nome']], online, true);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'prototype'){
            console.log('PROTOTYPE')
            let objeto = new EstadoPrototype('processo', '#div-tabela-prototype-JS', dados = dados, '#selecao-processo-JS', ['id', ['id','grao','estado']], online=2);
            setInterval(function () {
                objeto.atualizaObjeto();
                new Prototype();
             }, 2000);
        }
        if (tabela == 'chamados_cco'){
            console.log('chamados_cco')
            let objeto = new TabelaPedidos('chamados_cco', '#div-tabela-chamados-cco-JS', dados = dados, '/formCCO', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'chamados_analise'){
            console.log('chamados_analise')
            let objeto = new TabelaPedidos('chamados_analise', online?'#div-tabela-chamados-pedido-nova-analise-CCO-JS':'#div-tabela-chamados-analista-JS', dados = dados, '/formAnalise', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'chamados_guarda'){
            console.log('chamados_guarda')
            let objeto = new TabelaGuarda('chamados_guarda', '#div-tabela-chamados-guarda-JS', dados = dados, '/chamados', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'chamados_guarda_all'){
            console.log('chamados_guarda')
            let objeto = new TabelaGuarda('chamados_guarda','#div-tabela-chamados-guarda-all-JS', dados = dados, '/chamados', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'ultimas_analises'){
            console.log('ultimas_analises')
            let objeto = new EstadoPrototype('ultimas_analises', '#div-tabela-ultimas-analises-JS', dados=dados, false, false, online=0);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
    }

}
