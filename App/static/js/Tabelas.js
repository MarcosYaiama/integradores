
class TabelasUsuarios{

    constructor(tabela, dados, online){
        this.tabela = tabela;
        if (tabela == 'usuariosGuarda'){
            let objeto = new EstadoPrototype('guarda', '#div-tabela-guardas-JS', dados=dados, '#selecao-guardas', ['id', ['nome']], online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosCCO'){
            let objeto = new EstadoPrototype('cco', '#div-tabela-cco-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosAnalise'){
            let objeto = new EstadoPrototype('analista', '#div-tabela-analise-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuarios'){
            let objeto = new EstadoPrototype('all', '#div-tabela-all-JS', dados=dados, false, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'prototype'){
          console.log('PROTOTYPE')
            let objeto = new EstadoPrototype('processo', '#div-tabela-prototype-JS', dados = dados, '#selecao-processo-JS', ['id', ['id','grao']], online=0);
            setInterval(function () {
                objeto.atualizaObjeto();
                let tela = new Prototype();
             }, 2000);
        }
        if (tabela == 'chamados_cco'){
            console.log('chamados_cco')
            let objeto = new EstadoPrototype('chamados_cco', '#div-tabela-chamados-cco-JS', dados = dados, false, false, online=0);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'ultimas_analises'){
            console.log('ultimas_analises')
            let objeto = new EstadoPrototype('ultimas_analises', '#div-tabela-ultimas-analises-JS', dados=dados, false, false, online=0);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
    }

}
