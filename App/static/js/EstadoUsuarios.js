class EstadoUsuarios{

    constructor(cargo, div, selecao=false){
        this._cargo = cargo;
        this.lista_usuarios_banco = [];
        this.lista_usuarios_tabela = [];
        this._div = document.querySelector(div);
        this._selecao = document.querySelector(selecao);
        console.log("Construtor")
        this.atualizaObjeto();
    }

    usuarioTabela(){
        // console.log('CHILDREN=> ',document.querySelector('#tabela-guardas-JS').children.length);
        // console.log('CHILDREN=> ',document.querySelector('#tabela-guardas-JS').children);
        let lista_usuarios = [];
        if (document.querySelector('#div-tabela-guardas-JS').children.length){
            let tabela = document.querySelector(".tabela-usuarios-JS");
            let usuarios = tabela.querySelectorAll('.usuario-JS');
            
            // console.log('Usuarios=> ',usuarios);
            usuarios.forEach(
                usuario => {
                    lista_usuarios.push({
                        id: usuario.querySelector('.id').textContent,
                        nome: usuario.querySelector('.nome').textContent,
                        disponibilidade: usuario.querySelector('.disponibilidade').textContent
                    });
                });
            }
        // console.log('ListaUsuarios=> ',lista_usuarios)
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
        let lista_usuarios = [];
        let tamanho_tabela = this.lista_usuarios_tabela;
        let xhr = new XMLHttpRequest();
        xhr.open('GET', "http://localhost:5000/resposta_json/"+ this._cargo +"/1");
        xhr.addEventListener('load', function(){
            if(xhr.status == 200){
                let resultados = JSON.parse(xhr.responseText);
                resultados.forEach(resultado => {
                    // console.log("RESULTADO =>", resultado);
                    lista_usuarios.push({
                        id: resultado.id,
                        nome: resultado.nome,
                        disponibilidade: resultado.status
                    });
                });
            }
            console.log(tamanho_tabela.length, lista_usuarios.length);
            console.log(tamanho_tabela, lista_usuarios);
            
            if(tamanho_tabela.length != lista_usuarios.length){
                update(lista_usuarios,div, template);
                update(lista_usuarios, div_selec, template_selec);
            }
            if (lista_usuarios.length == 0) {
                div.innerHTML = "";
                div_selec.innerHTML = "";
            }
        });
        xhr.send();
    }
    
    _template_selecao(model){
        let htmlReturn = '';
        model.forEach(item => {
            htmlReturn += `
                <option value="${item.id}">${item.nome}</option>
            `
        });
        return  `<select name="guarda" class="form-control">
                    ${htmlReturn}
                </select>`
    }

    _template(model){
        let htmlReturn = '';
        model.forEach(item => {
            // console.log('Entrei')
            htmlReturn += `<tr class="usuario-JS">
                <td class="id">${item.id}</td>
                <td class="nome">${item.nome}</td>
                <td class="disponibilidade">${item.disponibilidade}</td>
                </tr>`});
        // console.log(htmlReturn);

        return `<table class="table table-striped table-responsive table-bordered tabela-usuarios-JS">
            <thead>
                <tr>
                    <th style="text-align: center;">ID</th>
                    <th style="text-align: center;">Nome</th>
                    <th style="text-align: center;">Disponibilidade</th>
                </tr>
            </thead>
            <tbody>
                ${htmlReturn}
            <tbody>
        </table>`
}
    update(model, div, template){
        // console.log(this._div);
        // console.log(model);
        div.innerHTML = template(model);
        
        
    }
    //PROBLEMA COM ARRAY JS RESOLVER !!!!!!!!!!!!!!
    atualizaObjeto(){
        this.usuarioBanco();
        this.usuarioTabela();
    }
}