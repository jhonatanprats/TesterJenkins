module Helpers
    def get_token
        2.times do
            js_script = 'return window.localStorage.getItem("default_auth_token");' #Esse script retorna valor no console, logo usamos o "return" para ele retornar o valor obetido
            @token = page.execute_script(js_script)
            break if @token != nil
            sleep 3
        end
        @token
    end
end