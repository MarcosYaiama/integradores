class Prototype extends Definicoes{
  constructor(){
    // this.busca_processos_lbl();
    super();
  }
  atualizaPrototipo(){
    this.id = this.busca_selection();
    this.busca_id_na_tabela(this.id);
  }

  busca_selection(){
    let select = document.querySelector('#selecao-processo-JS select');
    if(select != null){
      return select.value;
    }
  }

  busca_id_na_tabela(id){
    let tabela = document.querySelectorAll('.tabela-prototype-JS tbody tr');
    let exibe_estado_processo = this.exibe_estado_processo;
    tabela.forEach(item => {
      // console.log(item.querySelector('.id').textContent)
      if(item.querySelector('.id').textContent == id){
        // console.log(item.querySelector('.estado').textContent);
        exibe_estado_processo(item.querySelector('.estado').textContent);
      }
    })
  }
  exibe_estado_processo(estado){
    let labels = document.querySelectorAll('.tela .processo h2');
    // console.log('ESTADO =>' + estado);
    labels.forEach(element => {
      // console.log(element.textContent, ' x ', estado);
      if (element.textContent.toLowerCase() == estado.toLowerCase()){
        // console.log('YESSSSSS');
        
        element.parentElement.classList.add('processo-ativo');
      }
      else{
        if (element.parentElement.classList.contains('processo-ativo')){
          element.parentElement.classList.remove('processo-ativo');
        }
      }
    });
  }
}