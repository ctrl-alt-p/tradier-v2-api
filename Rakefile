# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Rails.application.load_tasks


# Hookup our pre-commit hooks on boot.
system("ln -sf bin/pre-commit .git/hooks/pre-commit")
