<h1 align="center">BanksManager</h1>

Este projeto foi desenvolvido como parte do trabalho semestral da disciplina de <b>Desenvolvimento Mobile II</b>, no 5º período de Tecnologia em Sistemas para Internet (TSI) do <b>IFES - Campus Santa Teresa</b>. O objetivo principal foi aprimorar habilidades em desenvolvimento de aplicações interativas, integrando um backend próprio (API REST) com um frontend moderno utilizando Flutter.

<br>

<h2>📚 Sobre o Projeto</h2>

O <b>BanksManager</b> é uma solução para centralizar e gerenciar todas as informações bancárias de um usuário em um só lugar. O sistema permite o cadastro de usuários, contas bancárias, cartões, empréstimos e transações, facilitando o controle financeiro e a visualização de gastos.

- O <b>backend</b> foi desenvolvido em Python com Django REST Framework e está hospedado na nuvem pelo <b>Railway</b>.
- O <b>frontend</b> foi desenvolvido em Flutter e está hospedado como aplicação web no <b>Vercel</b>.

<br>

<h2>🛠 Funcionalidades</h2>

- Cadastro, edição e exclusão de usuários
- Login simples (sem token, validando usuário e senha)
- Cadastro e gerenciamento de contas bancárias
- Cadastro e gerenciamento de cartões vinculados às contas
- Cadastro e gerenciamento de empréstimos vinculados às contas
- Cadastro e gerenciamento de transações bancárias
- Visualização centralizada de todas as informações financeiras do usuário
- Integração total entre frontend Flutter e backend Django REST

<br>

<h2>🌐 Arquitetura e Integração</h2>

- O <b>backend</b> expõe uma API RESTful, consumida diretamente pelo app Flutter via HTTP.
- O <b>frontend</b> utiliza serviços para consumir os endpoints da API, exibindo e manipulando os dados em tempo real.
- Toda a comunicação é feita em JSON, garantindo integração simples e eficiente.
- O login é realizado por endpoint próprio, sem uso de token, retornando apenas o status e o ID do usuário autenticado.

<br>

<h2>🗄 Diagrama do Banco de Dados</h2>

<p align="center">
  <img src="https://i.imgur.com/YYWIpi1.png" alt="Diagrama Banco de Dados BanksManager">
</p>

<br>

<h2>🚀 Deploy</h2>

- <b>Backend (Django REST):</b> Hospedado no Railway, acessível via URL pública.
- <b>Frontend (Flutter Web):</b> Hospedado no Vercel, acessível via navegador em qualquer dispositivo.

<br>

<h2>👨‍💻 Como Executar Localmente</h2>

Instalação das dependências do backend:

        pip install 

Inicialização da API Django:

        python .\manage.py runserver 

Inicialização do App Flutter: 

        flutter run -d chrome 


<br>

<h2>🛠 Tecnologias Utilizadas</h2>
<div>
  <img align="center" alt="Dart" height="25" src="https://img.shields.io/badge/Dart-015496?style=for-the-badge&logo=dart&logoColor=white">
  <img align="center" alt="Flutter" height="25" src="https://img.shields.io/badge/Flutter-5cc3f0?style=for-the-badge&logo=flutter&logoColor=white">
  <img align="center" alt="Python" height="25" src="https://img.shields.io/badge/Python-3b78a9?style=for-the-badge&logo=python&logoColor=white">
  <img align="center" alt="Django REST" height="25" src="https://img.shields.io/badge/Django%20REST-32ac7b?style=for-the-badge&logo=django&logoColor=white">
  <img align="center" alt="Railway" height="25" src="https://img.shields.io/badge/Railway-000000?style=for-the-badge&logo=railway&logoColor=white">
  <img align="center" alt="Vercel" height="25" src="https://img.shields.io/badge/Vercel-000000?style=for-the-badge&logo=vercel&logoColor=white">
</div>

<br>

<h2>☕️ Autoria</h2>
  <a href="https://github.com/igorgmassi" target="_blank"><img align="center" alt="Igor Massi" height="25" src="https://img.shields.io/badge/Igor Massi-4a4a4a?style=for-the-badge&logo=github&logoColor=white"></a>
  <a href="https://github.com/luiz-foeger" target="_blank"><img align="center" alt="Luiz Föeger" height="25" src="https://img.shields.io/badge/Luiz Föeger-4a4a4a?style=for-the-badge&logo=github&logoColor=white"></a>

