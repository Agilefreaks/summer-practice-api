# frozen_string_literal: true

namespace :deploy do
  desc 'Build docs (meant to be run on CI)'
  task :build_docs do
    system('bash ./bin/deploy-docs.sh')
  end
end
