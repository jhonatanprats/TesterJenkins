class MoviePage
    include Capybara::DSL

    def initialize
        @movie_list_css = "table tbody tr" #Usado em muitas partes do código, então criado como um construtor
    end

    def form
        MovieAdd.new
    end

    def sweet_alert
        SweetAlert.new
    end

    def add
        find(".nc-simple-add").click
    end

    def movie_tr(title)
        find(@movie_list_css, text: title)
    end

    def remove(title)
        movie_tr(title).find(".btn-trash").click
    end

    def has_no_movie(title)
        page.has_no_css?(@movie_list_css, text: title) #Faz uma verificação se no caminho do objeto, se não existe 'x' texto
    end

    def has_movie(title)
        page.has_css?(@movie_list_css, text: title) #Faz uma verificação se no caminho do objeto, existe 'x' texto
    end

end