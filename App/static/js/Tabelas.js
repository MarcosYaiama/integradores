
class Tabelas{

    constructor(tabela){
        this.tabela = tabela;
        if(tabela == 'reprovaCCO'){
            let objeto = new EstadoUsuarios('guarda', '#div-tabela-guardas-JS', '#selecao-guardas');
            setInterval(function () { objeto.atualizaObjeto() }, 2000);
        }
    }


}