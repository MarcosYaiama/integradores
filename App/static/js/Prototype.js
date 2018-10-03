class Prototype{
  
  constructor(){
    console.log('Constructor');
    this.carregaDados();
    this.endereco = "192.168.43.81";
  }


  InfoCarga(dados){
    return {
      id: dados[0],
      grao: dados[1],
      fornecedor: dados[2],
      destino: dados[3],
      placa: dados[4],
      estado: dados[5],
      dados: `${dados[0]},${dados[1]},${dados[2]},${dados[3]},${dados[4]},${dados[5]}`
    };
  }

  criaTabelaInfoCargas(objetoInfoCargas){

    let select = document.createElement('select');
    let tela = document.querySelector('.tela');

    tela.innerHTML = '';
    console.log(objetoInfoCargas);
    objetoInfoCargas.forEach(objt =>{
      let option = document.createElement('option');
      option.textContent = objt.dados;
      select.appendChild(option);
    });

    select.classList.add('form-control');
    select.classList.add('selecao');
    tela.appendChild(select);
  }

  carregaDados(){
    let botao = document.querySelector('.botao');
    let info_carga = this.InfoCarga;
    let endereco = this._endereco;
    botao.addEventListener('click',function(){
        console.log('Clickei');
        console.log(endereco);
        let info_cargas = [];
        let xhr = new XMLHttpRequest();
        xhr.open('GET', "http://"+endereco+":5000/resposta_json/processo/0");
        xhr.addEventListener('load', function(){
      
            if(xhr.status == 200){
                console.log(xhr.status);
                let respostas = JSON.parse(xhr.responseText);
                respostas.forEach(resp => {
                console.log(respostas);
                  if(info_cargas.length){
                    info_cargas.forEach(carga => {
                      if(carga[0]){
                    
                     } 
                    });
                }else{
                  info_cargas.push(this.InfoCarga(resp));
                   console.log(info_cargas);
                  }
               });

              console.log(info_cargas);
              criaTabelaInfoCargas(info_cargas);
            }
            else{
              console.log("Entrei");
            }
       });
        xhr.send();
      });
  }
}

