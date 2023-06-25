# frozen_string_literal: true

namespace :deploy do
  desc 'Run tasks that need to be executed on release phase'
  task :release_tasks do
    Rake::Task['db:migrate'].invoke
    Rake::Task['db:seed'].invoke
  end
end
