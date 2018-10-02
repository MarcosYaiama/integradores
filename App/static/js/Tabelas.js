
class TabelasUsuarios{

    constructor(tabela, dados, online){
        this.tabela = tabela;
        if (tabela == 'usuariosGuarda'){
            let objeto = new EstadoUsuarios('guarda', '#div-tabela-guardas-JS', dados=dados, '#selecao-guardas', online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosCCO'){
            let objeto = new EstadoUsuarios('cco', '#div-tabela-cco-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuariosAnalise'){
            let objeto = new EstadoUsuarios('analista', '#div-tabela-analise-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
        if (tabela == 'usuarios'){
            let objeto = new EstadoUsuarios('all', '#div-tabela-all-JS', dados=dados, false, online);
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
    }

}