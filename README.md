# RUBY OCR IMAGE WITH API GOOGLE GEMINI
Integração com a API do Google Gemini utilizando a linguagem Ruby para realizar um OCR de uma imagem de um documento.

O objetivo é enviar uma imagem de um documento para a API e obter um JSON com os dados obtidos pela leitura (OCR) dessa imagem, esses dados poderão ser utilizados para um registro/entrada automatizada desse documento na nossa aplicação. Hoje esse registro é realizado manualmente no sistema. 

Podemos reduzir o tempo do registro desses documentos, automatizando a tarefa que hoje é realizada por um usuário do sistema.

Nesse protótipo de integração com o Gemini, utilizamos a linguagem Ruby na versão 3.1.5 e a gem (biblioteca) rest-client que é um cliente HTTP e REST para Ruby.

Para a integração se conectar com a API do Google Gemini é necessário a API KEY.
