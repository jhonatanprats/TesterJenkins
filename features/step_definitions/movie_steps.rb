Dado("que {string} é um novo filme") do |movie_code|
    file = YAML.load_file(File.join(Dir.pwd, "features/support/fixtures/movies.yaml")) #Dir.pwd Para ele pegaro caminho da raiz da execução
    @movie = file[movie_code] #Passando um argumento no caso nome do filme, ele trás todos os dados do filme X que está dentro do arquivo YAML
    Database.new.delete_movie(@movie["title"])
  end

  Dado("esse filme já existe no catálago") do
    Database.new.insert_movie(@movie)
  end
  
  Quando("eu faço o cadastro deste filme") do
    @movie_page.add
    @movie_page.form.create(@movie)
  end
  
  Então("devo ver o novo filme na lista") do
    result = @movie_page.movie_tr(@movie["title"])
    expect(result).to have_text @movie["title"]
    expect(result).to have_text @movie["status"]
  end

  Então("devo ver a notificação {string}") do |expect_alert|
    expect(@movie_page.form.alert).to eql expect_alert
  end

  Dado("que {string} está catálago") do |movie_code|
    steps %{
      Dado que "#{movie_code}" é um novo filme
      E esse filme já existe no catálago
    } #Assim é executado um step de outro cucumber,no caso o de cadastro de filme
  end
  
  Quando("eu solicito a exclusão") do
    @movie_page.remove(@movie["title"])
  end
  
  Quando("eu confirmo a solicitação") do
   @movie_page.sweet_alert.confirm
  end
  
  Então("este item deve ser removido do catálago") do
    expect(@movie_page.has_no_movie(@movie["title"])).to be true
  end

  Quando("cancelo a solicitação") do
    @movie_page.sweet_alert.cancel
  end
  
  Então("este item deve permanecer no catálago") do
    expect(@movie_page.has_movie(@movie["title"])).to be true
  end      