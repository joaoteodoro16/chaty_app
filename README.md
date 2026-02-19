# Chatty App

Aplicativo de chat em tempo real desenvolvido com **Flutter** utilizando **Firebase**, com foco em **boas práticas de arquitetura**, escalabilidade e organização de código.

Este projeto foi criado com fins de **estudo**, aplicando conceitos modernos como **Clean Architecture**, **BLoC/Cubit**, **Provider** e integração com **Firebase**.

---

# 🚀 Funcionalidades

- ✅ Autenticação com email e senha (Firebase Auth)
- ✅ Cadastro de contatos através do email
- ✅ Envio de mensagens em tempo real
- ✅ Inbox com lista de conversas
- ✅ Criação automática de conversa ao enviar mensagem
- ✅ Persistência de sessão

---

# 🧠 Arquitetura utilizada

O projeto utiliza:

## Clean Architecture + Feature First

Estrutura organizada em camadas:

```
features/
├ presentation → UI, Cubits, Pages
├ domain → Entities, Usecases, Contracts
└ data → Repositories, Datasources, Models
```


## Padrões e tecnologias aplicadas

- Clean Architecture
- Feature First
- Repository Pattern
- Dependency Injection
- Cubit (BLoC)
- Provider
- Firebase Auth
- Firebase Cloud Firestore

---

# 📁 Estrutura simplificada

```
lib/
├ app/
│ ├ core/
│ └ ui/
│
├ features/
│ ├ auth/
│ ├ contact/
│ ├ messaging/
│ ├ splash/
│ └ user/

```

Cada feature é independente e modular.

---

# 🛠 Tecnologias utilizadas

Flutter Version: 3.35.7


Principais dependências:

- flutter_bloc
- provider
- firebase_auth
- cloud_firestore
- freezed
- build_runner

---

# 🔥 Configuração do Firebase

Necessário realizar a confirugação do Firebase no projeto, pra isso pode seguir essa documentação: https://firebase.google.com/docs/flutter/setup?hl=pt-br&platform=ios


---

# ▶️ Como rodar o projeto

## 1 — Clone o repositório

```
git clone https://github.com/seuusuario/chatty_app.git
```


---

## 2 — Entre na pasta

```
cd chatty_app
```


---

## 3 — Instale as dependências

```
flutter pub get
```


---

## 4 — Execute o build_runner

Necessário para arquivos freezed: 
```
dart run build_runner watch --delete-conflicting-outputs
```

---

## 5 — Execute o projeto

```
flutter run
```

---

# 🧪 Fluxo do app

1 — Usuário cria conta

2 — Usuário adiciona contato pelo email

3 — Usuário inicia conversa

4 — Usuário envia mensagens em tempo real

---

# 🎯 Objetivo do projeto

Este projeto foi criado para estudo de:

- Arquitetura limpa
- Firebase
- Chat em tempo real
- Boas práticas Flutter

---

# 📚 Aprendizados aplicados

- Separação de responsabilidades
- Código escalável
- Organização profissional
- Arquitetura enterprise

---