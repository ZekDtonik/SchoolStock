# Acess System
##### Sistema complexo de login de acesso

#### Dependências 

    const __ACUSERS = __USERS;
    const __ACAUTH = __AUTH;
    const __ACINTIME = __INTIME;
    const __ACSETS = __SETTINGS;
    
As dependências acima definem a manipulação 
de dados do banco para realização de acesso 
de um sistema restrito:
* __ACUSERS = Define o nome da tabela de usuarios
que podem acessar o sistema por meio de login e senha
* __ACAUTH = Em alguns versões da classe, define uma 
tabela alternativa de nivel isolado para conexão, muito
usado quando o sistema possui acesso de administradores
e usuários de nível secundário 
* __ACINTIME = Define o tempo permitido de acesso ao login
ou seja, é uma sessão de usuário baseado em um tempo definido
antes da sessão ser encerrada, por inatividade por exemplo.
  
