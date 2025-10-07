#!/usr/bin/env python3
"""
Script principal para demonstrar requisições de API usando requests
"""

import requests
import json

def main():
    """
    Função principal que demonstra como fazer requisições para APIs
    """
    print("=== PROJETO API COM REQUESTS ===\n")
    
    # Exemplo 1: API JSONPlaceholder (para testes)
    print("1. Testando API JSONPlaceholder...")
    try:
        url = 'https://jsonplaceholder.typicode.com/posts/1'
        response = requests.get(url)
        response.raise_for_status()
        
        post = response.json()
        print("✅ Dados recebidos com sucesso!")
        print(f"   ID: {post['id']}")
        print(f"   Título: {post['title']}")
        print(f"   Conteúdo: {post['body'][:50]}...")
        print()
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro na requisição: {e}\n")
    
    # Exemplo 2: API de CEP (ViaCEP)
    print("2. Testando API ViaCEP...")
    try:
        cep = "01310-100"  # CEP da Av. Paulista
        url = f"https://viacep.com.br/ws/{cep}/json/"
        response = requests.get(url)
        response.raise_for_status()
        
        dados_cep = response.json()
        if 'erro' not in dados_cep:
            print("✅ CEP encontrado!")
            print(f"   CEP: {dados_cep['cep']}")
            print(f"   Logradouro: {dados_cep['logradouro']}")
            print(f"   Bairro: {dados_cep['bairro']}")
            print(f"   Cidade: {dados_cep['localidade']}")
            print(f"   Estado: {dados_cep['uf']}")
        else:
            print("❌ CEP não encontrado")
        print()
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro na requisição: {e}\n")
    
    # Exemplo 3: API do GitHub
    print("3. Testando API do GitHub...")
    try:
        username = "octocat"  # Usuário de exemplo do GitHub
        url = f"https://api.github.com/users/{username}"
        response = requests.get(url)
        response.raise_for_status()
        
        usuario = response.json()
        print("✅ Dados do usuário GitHub recebidos!")
        print(f"   Nome: {usuario['name']}")
        print(f"   Login: {usuario['login']}")
        print(f"   Repositórios públicos: {usuario['public_repos']}")
        print(f"   Seguidores: {usuario['followers']}")
        print(f"   Seguindo: {usuario['following']}")
        print()
        
    except requests.exceptions.RequestException as e:
        print(f"❌ Erro na requisição: {e}\n")
    
    print("=== FIM DOS TESTES ===")

if __name__ == "__main__":
    main()
