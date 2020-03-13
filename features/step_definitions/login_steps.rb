Quando("eu faço login com {string} e {string}") do |email, senha|
    @login_page.go
    @login_page.with(email, senha)
  end
  
  Então("devo ser autenticado") do
    expect(get_token.length).to be 147 #Sem aspas vira inteiro, com aspas String
  end
  
  Então("devo ver {string} na área logada") do |expect_name|
    expect(@sidebar.logged_user).to eql expect_name
  end

  Então("não devo ser autenticado") do                                  
    expect(get_token).to be nil #Campo vazio em ruby é "nil"
  end                                                                   
                                                                        
  Então("devo ver a mensagem de alerta {string}") do |expect_message|           
    expect(@login_page.alert).to eql expect_message                            
  end                                                                   