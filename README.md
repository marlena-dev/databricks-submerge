# Projeto API com Requests

Este projeto demonstra como fazer requisições para APIs usando a biblioteca `requests` do Python e imprimir os resultados.

## 📋 Descrição

O projeto consiste em scripts Python que fazem chamadas para APIs externas e exibem os dados retornados no terminal usando o comando `print()`.

## 🚀 Funcionalidades

- Fazer requisições HTTP para APIs
- Imprimir resultados formatados no terminal
- Tratamento básico de erros
- Exemplos de diferentes tipos de APIs

## 📦 Pré-requisitos

- Python 3.6 ou superior
- Biblioteca `requests`

## 🛠️ Instalação

1. Clone este repositório:
```bash
git clone <url-do-repositorio>
cd imersao_databricks
```

2. Instale as dependências:
```bash
pip install requests
```

## 📖 Como Usar

### Exemplo Básico

```python
import requests

# Fazer uma requisição GET
response = requests.get('https://api.exemplo.com/dados')

# Verificar se a requisição foi bem-sucedida
if response.status_code == 200:
    dados = response.json()
    print("Dados recebidos:")
    print(dados)
else:
    print(f"Erro na requisição: {response.status_code}")
```

### Exemplo com API JSONPlaceholder

```python
import requests

# API de exemplo para testes
url = 'https://jsonplaceholder.typicode.com/posts/1'

try:
    response = requests.get(url)
    response.raise_for_status()  # Levanta exceção para códigos de erro HTTP
    
    post = response.json()
    print("=== POST RECEBIDO ===")
    print(f"ID: {post['id']}")
    print(f"Título: {post['title']}")
    print(f"Conteúdo: {post['body']}")
    
except requests.exceptions.RequestException as e:
    print(f"Erro na requisição: {e}")
```

## 📁 Estrutura do Projeto

```
imersao_databricks/
├── README.md
├── requirements.txt
├── main.py
└── examples/
    ├── basic_api.py
    ├── json_placeholder.py
    └── weather_api.py
```

## 🔧 Configuração

1. Crie um arquivo `requirements.txt`:
```
requests==2.31.0
```

2. Para APIs que requerem autenticação, configure as variáveis de ambiente:
```bash
export API_KEY="sua_chave_aqui"
```

## 📝 Exemplos de APIs

### 1. API de CEP (ViaCEP)
```python
import requests

cep = "01310-100"
url = f"https://viacep.com.br/ws/{cep}/json/"

response = requests.get(url)
dados = response.json()

print("=== DADOS DO CEP ===")
print(f"CEP: {dados['cep']}")
print(f"Logradouro: {dados['logradouro']}")
print(f"Bairro: {dados['bairro']}")
print(f"Cidade: {dados['localidade']}")
print(f"Estado: {dados['uf']}")
```

### 2. API do GitHub
```python
import requests

username = "octocat"
url = f"https://api.github.com/users/{username}"

response = requests.get(url)
usuario = response.json()

print("=== DADOS DO USUÁRIO GITHUB ===")
print(f"Nome: {usuario['name']}")
print(f"Login: {usuario['login']}")
print(f"Repositórios públicos: {usuario['public_repos']}")
print(f"Seguidores: {usuario['followers']}")
```

## 🐛 Tratamento de Erros

```python
import requests

def fazer_requisicao(url):
    try:
        response = requests.get(url, timeout=10)
        response.raise_for_status()
        return response.json()
    except requests.exceptions.Timeout:
        print("Erro: Timeout na requisição")
    except requests.exceptions.ConnectionError:
        print("Erro: Problema de conexão")
    except requests.exceptions.HTTPError as e:
        print(f"Erro HTTP: {e}")
    except requests.exceptions.RequestException as e:
        print(f"Erro na requisição: {e}")
    return None

# Uso
dados = fazer_requisicao("https://api.exemplo.com/dados")
if dados:
    print(dados)
```

## 🚀 Executando o Projeto

```bash
# Executar o script principal
python main.py

# Executar exemplos específicos
python examples/basic_api.py
python examples/json_placeholder.py
```

## 📚 Recursos Úteis

- [Documentação do Requests](https://docs.python-requests.org/)
- [HTTP Status Codes](https://developer.mozilla.org/pt-BR/docs/Web/HTTP/Status)
- [JSONPlaceholder API](https://jsonplaceholder.typicode.com/)
- [ViaCEP API](https://viacep.com.br/)

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes.

## 👨‍💻 Autor

Luciano Galvão

---

**Nota**: Este projeto é para fins educacionais e demonstração. Sempre respeite os termos de uso das APIs que você utilizar.
