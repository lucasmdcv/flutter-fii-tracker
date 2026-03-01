# 📊 FII Tracker Analytics

![Flutter](https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white)
![Clean Architecture](https://img.shields.io/badge/Clean_Architecture-222222?style=for-the-badge)
![BLoC](https://img.shields.io/badge/State_Management-BLoC-blue?style=for-the-badge)

## 🎯 Sobre o Projeto
O **FII Tracker Analytics** é uma aplicação mobile focada no monitoramento inteligente de Fundos de Investimento Imobiliário (FIIs). Projetado com foco em investidores que buscam o "Efeito Bola de Neve", o sistema consome dados financeiros em tempo real e processa algoritmos locais para calcular o **Dividend Yield Mensal** e o **Número Mágico** (quantidade exata de cotas necessárias para que os rendimentos comprem uma nova cota automaticamente).

Este projeto foi construído sob rigorosos padrões de engenharia de software, visando escalabilidade, testabilidade e separação de responsabilidades.

## 🏗️ Arquitetura e Engenharia
A aplicação adota a **Clean Architecture** dividida em três camadas estritas, respeitando os princípios **SOLID** (com ênfase em Inversão de Dependência e Responsabilidade Única):

* **Domain (Domínio):** O núcleo do sistema. Contém as regras de negócio puras (`FiiEntity`), isoladas de qualquer framework ou pacote externo, e os Casos de Uso (ex: `GetSavedPortfolioData`).
* **Data (Dados):** Responsável por abstrair a origem da informação. Implementa o padrão *Repository* e gerencia chamadas de rede através de *Data Sources* utilizando o cliente HTTP. Realiza o *parsing* seguro de JSON para *Models*.
* **Presentation (Apresentação):** A interface de usuário (UI). Utiliza o padrão **BLoC (Business Logic Component)** para reagir a eventos de forma reativa e desvincular completamente a regra de negócio da árvore de *widgets*.

## 🚀 Tecnologias e Pacotes
* **`flutter_bloc` & `equatable`:** Gerenciamento de estado previsível e imutável de padrão corporativo.
* **`dio`:** Cliente HTTP robusto para consumo da API REST financeira, configurado com interceptadores de tratamento de erro.
* **`get_it`:** Service Locator para implementação estrita de Injeção de Dependências (DI), permitindo o isolamento de instâncias e facilitando a criação de *Mocks* para testes.
* **`flutter_dotenv`:** Gestão de Variáveis de Ambiente, garantindo que chaves de API (Tokens) permaneçam criptografadas e fora do controle de versão.
* **Concorrência (Dart Async):** Uso de `Future.wait` para execução paralela de múltiplas chamadas HTTP, reduzindo o tempo de carregamento da carteira a uma fração do tempo padrão.

## ⚙️ Como Executar o Projeto

<img width="1108" height="785" alt="image" src="https://github.com/user-attachments/assets/a8cf4933-8c6e-4c1e-b2a3-2d79344b846b" />

**1. Clone o repositório:**
```bash
git clone [https://github.com/SEU_USUARIO/fii_tracker.git](https://github.com/SEU_USUARIO/fii_tracker.git)


