#language: pt

Funcionalidade: Login
    Para que eu possa gerenciar os filmes do catálogo NinjaFlix
    Sendo um usuário previamente cadastrado
    Posso acessar o sistema com o meu email e senha

 @login_happy
Cenario: Acesso
    Quando eu faço login com "tony@stark.com" e "123456"
    Então devo ser autenticado
    E devo ver "Tony Stark" na área logada

@login_hapless
Esquema do Cenario: Login sem Sucesso
    Quando eu faço login com <email> e <senha>
    Então não devo ser autenticado
    E devo ver a mensagem de alerta <texto>

Exemplos:
    | email            | senha    | texto                          |
    | "tony@stark.com" | "123455" | "Usuário e/ou senha inválidos" |
    | "404@yahoo.com"  | "123456" | "Usuário e/ou senha inválidos" |
    | ""               | "123456" | "Opps. Cadê  email?"          |
    | "tony@stark.com" | ""       | "Ops. Cadê a senha?"          |