class LoginPage
    include Capybara::DSL #importar as funções do capybara para dentro desta nova classe

    def go 
        visit "/"
    end

    def with(email, pass)
        find("input[name=email]").set email
        find('#passId').set pass
        click_button 'Entrar'
    end

    def alert
        find('.alert span').text
    end

end