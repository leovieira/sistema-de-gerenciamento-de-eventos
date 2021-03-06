### Sistema de Gerenciamento de Eventos

- Autor: Leonardo Paiva Vieira | LéoVieira™
- Repositório: <https://github.com/leovieira/sistema-de-gerenciamento-de-eventos>
- Meu GitHub: <https://github.com/leovieira/>
- Meu Site: <https://www.leovieira.dev>
- Meu E-mail: <leonardopaiva_ipora@hotmail.com>

#### + Contribuidores:
  - __Front-end:__
      Elias Januário Marques Filho,  
      Gustavo Rezende Gouveia e  
      Victor Hugo Xavier de Oliveira.  

  - __Back-end:__
      Leonardo Paiva Vieira e  
      Vitor Francisco Oliveira Rocha.  
 
  - __Website:__
      Leonardo Paiva Vieira.  

#### + Como utilizar o GitHub e o Git?
  - __Assita ao vídeo:__
      <https://www.youtube.com/watch?v=H1ppFeeeeg4>  

#### + Como instalar os componentes de QR Code?
  - __1º passo:__
      Clone os arquivos deste repositório utilizando o git.  

  - __2º passo:__
      Na pasta "arquivos" conterá as pastas cujo os nomes são "Barcode Scanner - Android" e "Componentes Nativos - iOS". Crie uma pasta no seu computador em 
	  Documentos com o nome "Componentes Delphi" e copie as duas pastas citadas acima para dentro dela.  

      ![img1](https://uploaddeimagens.com.br/images/002/241/460/full/img1.jpg)  

  - __3º passo:__
      Com o RAD Studio aberto vá em Tools > Options... > Delphi Options > Library, agora em Library path clique nos três pontos (...), abrirá um janela 
	  chamada "Directories", nela clique no ícone da pasta e navegue até a pasta o caminho "C:\seu caminho\Componentes Delphi\Barcode Scanner - Android\" 
	  selecione-o, após isso clique em Add. Repita o mesmo procedimento, portanto agora, para a pasta "Componentes Nativos - iOS". Clique em OK nas duas 
	  janelas abertas.

      ![img2](https://uploaddeimagens.com.br/images/002/241/463/full/img2.jpg)  

      ![img3](https://uploaddeimagens.com.br/images/002/241/467/full/img3.jpg)  

      ![img4](https://uploaddeimagens.com.br/images/002/241/471/full/img4.jpg)  

      ![img5](https://uploaddeimagens.com.br/images/002/241/475/full/img5.jpg)  

  - __4º passo:__
      Abra a pasta "Barcode Scanner - Android" e abra o arquivo "BarcodeScanner.dproj" com o RAD Studio.  

      ![img6](https://uploaddeimagens.com.br/images/002/241/427/full/img6.jpg)  

  - __5º passo:__
      Com o projeto aberto vá até Project Manager e clique com o botão direito do mouse sobre "BarcodeScanner.bpl" e clique em Build. Irá aparecer uma janela 
	  de confirmação, confirme-a.  

      ![img7](https://uploaddeimagens.com.br/images/002/241/432/full/img7.jpg)  

      ![img8](https://uploaddeimagens.com.br/images/002/241/435/full/img8.jpg)  

  - __6º passo:__
      Da mesma maneira clique agora em Install. Irá aparecer uma janela de confirmação, confirme-a.  

      ![img9](https://uploaddeimagens.com.br/images/002/241/437/full/img9.jpg)   

  - __7º passo:__
      Salve o projeto e feche ele. Agora na pasta "Componentes Nativos - iOS", abra o arquivo "DPFiOSPackagesDX10.dproj" com o RAD Studio.  

      ![img10](https://uploaddeimagens.com.br/images/002/241/438/full/img10.jpg) 

  - __8º passo:__
      Com o projeto aberto vá até Project Manager e clique com o botão direito do mouse sobre "DPFiOSPackagesDX10.bpl" e clique em Build. Irá aparecer uma 
	  janela de confirmação, confirme-a.  

      ![img11](https://uploaddeimagens.com.br/images/002/241/441/full/img11.jpg) 

      ![img12](https://uploaddeimagens.com.br/images/002/241/448/full/img12.jpg) 

  - __9º passo:__
      Da mesma maneira clique agora em Install. Irá aparecer uma janela de confirmação, confirme-a.  

      ![img13](https://uploaddeimagens.com.br/images/002/241/452/full/img13.jpg) 

#### + Como implementar o leitor de QR Code?
  - __Assita ao vídeo:__
      <https://www.youtube.com/watch?v=PyV0XN34NxA>  

  - __Exemplo:__
      "C:\seu caminho\sistema-de-gerenciamento-de-eventos\arquivos\exemplos\CodeBar\PrjCodeBarras.dproj".  

#### + Duvidas em API (REST)?
  - __O que é:__
      API é um conjunto de rotinas e padrões de programação para acesso a um aplicativo de software ou plataforma baseado na Web. A sigla API refere-se ao 
	  termo em inglês "Application Programming Interface" que significa em tradução para o português "Interface de Programação de Aplicativos". 
	  Representational State Transfer (REST), em português Transferência Representacional de Estado, é um estilo de arquitetura de software que define um 
	  conjunto de restrições a serem usados para a criação de web services.  

  - __Assita ao vídeo:__
      <https://www.youtube.com/watch?v=7s5_TmBqZR8>  

  - __Exemplo Online:__
      <https://viacep.com.br/ws/76200000/json/>  

  - __Explicação:__
      Bom... esta é um API simples, nela podemos notar que passamos como parâmetro o CEP que você deseja que o sistema busque informações sobre ele e também o 
	  formato do arquivo para o request neste exemplo passei o "json" podendo ser também o "xml". Portanto, o "json" é um formato muito mais leve para ser 
	  trafegado pela a internet. Concluímos então que o software faz um request (requisição) ao servidor através do protocolo HTTP passando ou não parâmetros, 
	  e então o servidor retorna um response (resposta) no formato que foi programado (txt/json/xml) contendo as informações à serem consumidas por uma aplicação.  

  - __Exemplo 1:__
      "C:\seu caminho\sistema-de-gerenciamento-de-eventos\arquivos\exemplos\api\exemplo1".  

  - __Exemplo 2:__
      "C:\seu caminho\sistema-de-gerenciamento-de-eventos\arquivos\exemplos\api\exemplo2".  

  - __Explicação:__
      Este exemplo 2 é uma API feita em PHP que pega a data e a hora de um site e retorna em forma de json, é passado como parâmetro o 'nome' (string) e é 
	  exibido também no json.  

#### + Como utilizar a API do projeto?
  - __1º passo:__  
      Com o XAMMP instalado no seu computador, copie a pasta "api" para dentro de "htdocs" do seu computador.  

  - __2º passo:__  
      Abra o phpMyAdmin no seu navegador e importe o banco de dados presente na pasta "db".  

#### + Relação da API do projeto:
  - __Importante:__  
      A chave de autenticação da API é: "dpc0p1yim82b5s0tfk3s".  
	  Espaços na URL usa-se: "%20".  

  - __Horas de Brasília:__  
      A URL base é : "http://localhost/api/horas-de-brasilia.php?key={chave}".  
      Exemplo: "http://localhost/api/horas-de-brasilia.php?key=dpc0p1yim82b5s0tfk3s".  

Copyright 2020 © __LéoVieira™__ - Todos os direitos reservados