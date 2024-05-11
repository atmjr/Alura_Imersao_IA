require 'uri'
require 'json'
require 'rest-client'
require 'base64'

# Sua API Key gerada pelo Google Ai Studio
API_KEY = "AIzaSyCfvb8Yc4xafv9brQufaHUKQ0wiq2hsVAs"

# URL do google gemini
gemini_url =  "https://generativelanguage.googleapis.com/v1beta/models/gemini-1.5-pro-latest:generateContent?key=#{API_KEY}"

# Configuracoes
config =  {
  "temperature": 1,
  "topK": 0,
  "topP": 0.95,
  "maxOutputTokens": 8192,
  "stopSequences": []
}

# Safety Settings
settings = [
  {
    "category": "HARM_CATEGORY_HARASSMENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_HATE_SPEECH",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_SEXUALLY_EXPLICIT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  },
  {
    "category": "HARM_CATEGORY_DANGEROUS_CONTENT",
    "threshold": "BLOCK_MEDIUM_AND_ABOVE"
  }
]

# Preparando o JSON para requisicao, enviando uma imagem de uma documento 
# para que os dados desse documento possam ser recuperados pela IA
data = {
  generationConfig: config,
  safetySettings: settings,
  contents: [
    {
      role: "user",
      parts: [
        {
          text: "Essa imagem é de uma declaração de transporte aduaneira, gere um arquivo JSON com os dados dessa imagem."
        },
        { 
          inline_data: {
            mime_type: 'image/png',
            data: Base64.strict_encode64(File.read('Img-DTA.png'))
          }
        }  
      ]
    }
  ]
}

# Headers da requisição
headers = {
  'Accept' => 'application/json',
  'Content-type'  => 'application/json; charset=utf-8'
}

# incio da transação com a API
begin
  response = RestClient::Request.execute(
    method: :post,
    url: gemini_url,
    headers: headers,
    payload: data.to_json 
  )
  json_body = JSON.parse(response.body)      

  # O response da API contem um json com os dados do documento
  p json_body
  
  # Posso agora extrair os dados do documento e automatizar o registro desse documento no sistema. 
  return json_body

rescue RestClient::ExceptionWithResponse => e   
  # tratando erro
  if e.response.nil?
    p "--> Erro: #{e}"
  else
    body = JSON.parse(e.response.body)
    p body
  end
end
