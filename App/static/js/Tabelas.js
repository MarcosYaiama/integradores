
class TabelasUsuarios{

    constructor(tabela, dados, online){
        this.tabela = tabela;
        if (tabela == 'usuariosGuarda'){
            let objeto = new EstadoPrototype('guarda', '#div-tabela-guardas-JS', dados=dados, '#selecao-guardas', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosCCO'){
            let objeto = new EstadoPrototype('cco', '#div-tabela-cco-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosAnalise'){
            let objeto = new EstadoPrototype('analista', '#div-tabela-analise-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuarios'){
            let objeto = new EstadoPrototype('all', '#div-tabela-all-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'prototype'){
          console.log('PROTOTYPE')
            let objeto = new EstadoPrototype('processo', '#div-tabela-prototype-JS', dados=dados, false, online=0);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
    }

}
