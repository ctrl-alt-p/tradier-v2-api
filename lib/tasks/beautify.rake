namespace :beautify do

  desc "Beautify all Ruby files"
  task :ruby do
    folders = [
      "app/controllers",
      "app/helpers",
      "app/mailers",
      "app/models",
      "app/views",
      "config",
      "db",
      "lib",
      "public",
      "test",
    ]
    system("cd #{Rails.root} && find #{folders.join(' ')} -name '*.rb' -exec ruby-beautify --overwrite {} \\; -exec git add {} \\;")
  end

  desc "Beautify all JS files"
  task :js  do
    system("npm install js-beautify >/dev/null")
    folders = [
      "app/assets/javascripts",
    ]
    system("cd #{Rails.root} && find #{folders.join(' ')} -name '*\\.js*' -exec js-beautify --replace {} \\; -exec git add {} \\;")
  end


  desc "Beautify all SCSS files"
  task :scss  do
    folders = [
      "app/assets/stylesheets",
    ]
    system("cd #{Rails.root} && find #{folders.join(' ')} -name '*.scss' -exec sass-convert --unix-newlines --indent 4 --from scss --to scss {} {} \\; -exec git add {} \\;")
  end

end
