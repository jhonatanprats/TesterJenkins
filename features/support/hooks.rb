# frozen_string_literal: true



Before do

  @login_page = LoginPage.new

  @sidebar = SideBarView.new

  @movie_page = MoviePage.new

  page.current_window.resize_to(1440, 900)

  # page.driver.browser.manage.window.maximize

end



Before ('@login') do

  user = CONFIG['users']['cat_manager']

  @login_page.go

  @login_page.with(user['email'], user['pass'])

end



After do |scenario|

  # if scenario.failed?

  temp_shot = page.save_screenshot("log/screenshots/#{scenario.__id__}.png")

  screenshot = Base64.encode64(File.open(temp_shot).read) # Convertendo a imagem para o formato base 64

  embed(screenshot, 'image/png', 'Screenshot') # Anexa o screenshot no relatório

  # end

end

