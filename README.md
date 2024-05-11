# OCR de uma uma imagem de documento usando a API GOOGLE GEMINI.

--------------------------------------------------------------------------------------------
Nesse protótipo de integração com o Gemini, utilizamos a linguagem Ruby versão 3.1.5 e a 
gem (biblioteca) rest-client que é um cliente HTTP e REST para Ruby.
--------------------------------------------------------------------------------------------

Usando o Google Gemini para obter dados de um documento e automatizar o registro de dados.

O objetivo é enviar uma imagem de um documento para a API e obter um JSON com os dados obtidos pela leitura (OCR) dessa imagem, esses dados poderão ser utilizados para um registro/entrada automatizada desse documento na nossa aplicação. Hoje esse registro é realizado manualmente no sistema. 

Podemos reduzir o tempo do registro desses documentos, automatizando a tarefa que hoje é realizada por um usuário do sistema.

Para a integração se conectar com a API do Google Gemini é necessário a API KEY.

Prompt que foi enviado ao modelo junto com a imagem do documento: "Essa imagem é de uma declaração de transporte aduaneira, gere um arquivo JSON com os dados dessa imagem."

Abaixo o retorno da API para a imagem "Img_DTA.png" usada nessa integração. Todos os dados obtidos e lidos da imagem estão abaixo: No da declaração, tipo, Via de Transporte, etc.


{
  "candidates": [
    {
      "content": {
        "parts": [
          {
            "text": "```json\n{\n  \"No. da Declaração\": \"24/0195141-0\",\n  \"Tipo\": \"DTA - ENTRADA COMUM\",\n  \"Via de Transporte/Situação\": \"RODOVIÁRIA\",\n  \"Declaração solicitada em\": \"29/04/2024 às 16:01:31 hs\",\n  \"CPF\": \"582.677.600-59\",\n  \"Declaração registrada em\": \"29/04/2024 às 17:11:31 hs\",\n  \"CPF\": \"582.677.600-59\",\n  \"Esta declaração ainda não tem veículo(s) informado(s)\",\n  \"Esta declaração possui dossiê(s) vinculado(s)\": \"20240023554223-7\",\n  \"Origem\": {\n    \"Unidade Aduaneira\": \"1017700 - PORTO DE RIO GRANDE\",\n    \"Recinto Local\": \"0301304 - INST.PORT.MAR.ALF.USO PUBLICO-TECON RIO GRANDE-RIO GRANDE/RS\"\n  },\n  \"Destino\": {\n    \"Unidade Aduaneira\": \"1010600 - DRF CAXIAS DO SUL\",\n    \"Recinto Local\": \"0353201 - EADI - PORTO SECO TRANSPORTES LTDA\"\n  },\n  \"Beneficiário/Transportador\": {\n    \"CNPJ/CPF do Beneficiário\": \"00.893.913/0001-84\",\n    \"Nome do Beneficiário\": \"REYPEL IMPORTADORA DE MAQUINAS LTDA\",\n    \"CNPJ/CPF do Transportador\": \"91.795.278/0001-58\",\n    \"Nome do Transportador\": \"TRANSPORTES SERGIO A MURARO LTDA\"\n  },\n  \"Identificação da Rota\": {\n    \"Código da Rota\": \"00005\",\n    \"Descrição da Rota\": \"SAÍDA DE RIO GRANDE VIA BR 392 ATÉ PELOTAS, BR 116 ATÉ SÃO LEOPOLDO, RS 240 ATÉ SÃO SEBASTIÃO DO CAI, RS 122 ATÉ FARROUPILHA, RS 453 ATÉ EADI CAXIAS DO SUL/RS\",\n    \"Prazo da Rota\": \"24 horas\"\n  },\n  \"Modalidade de Transporte da Declaração\": {\n    \"Tipo\": \"UNIMODAL\"\n  },\n  \"Tratamento na Origem/Totais\": {\n    \"Tipo\": \"Armazenamento\",\n    \"Valor Total do Trânsito em Dólar\": \"45.697,80\",\n    \"Valor Total do Trânsito na Moeda Nacional\": \"233.899,78\"\n  },\n  \"Cargas da Declaração (1 a 1/Total : 1) - Página : 1/1\": {\n    \"Carga 1)\": {\n      \"Identificação da Carga\": \"CEMERCANTE310322008212405103271500\",\n      \"Tipo de Documento\": \"12 - HBL\",\n      \"TC de Destino\": \"TEM anuência\",\n      \"Esta carga NÃO TEM armazenamento\",\n      \"CNPJ/CPF do Importador\": \"00.893.913/0001-84\",\n      \"Nome do Importador\": \"REYPEL IMPORTADORA DE MAQUINAS LTDA\",\n      \"Divergência da Carga na Origem\": \"avaria e/ou falta com desistência de vistoria na origem\",\n      \"Modalidade de Embarque\": \"Total\",\n      \"Peso Bruto da Carga\": \"768.000 Kg\",\n      \"Tipo da Carga\": \"03 - Containerizada\",\n      \"Identificação do(s) Container(s)\": {\n        \"1)\": \"PONU066374\",\n        \"Valor FOB/FCA da Carga em Dólar\": \"45.697,80\",\n        \"Valor da Carga em Moeda Nacional\": \"233.899,78\"\n      }\n    }\n  }\n}\n```"
          }
        ],
        "role": "model"
      },
      "finishReason": "STOP",
      "index": 0,
      "safetyRatings": [
        {
          "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
          "probability": "NEGLIGIBLE"
        },
        {
          "category": "HARM_CATEGORY_HATE_SPEECH",
          "probability": "NEGLIGIBLE"
        },
        {
          "category": "HARM_CATEGORY_HARASSMENT",
          "probability": "NEGLIGIBLE"
        },
        {
          "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
          "probability": "NEGLIGIBLE"
        }
      ]
    }
  ],
  "usageMetadata": {
    "promptTokenCount": 281,
    "candidatesTokenCount": 1023,
    "totalTokenCount": 1304
  }
}
