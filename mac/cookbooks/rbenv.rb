rbenv_root = ENV["HOME"] + "/.rbenv"

git rbenv_root do
  repository "https://github.com/rbenv/rbenv.git"
end

directory "#{rbenv_root}/plugins"

node["rbenv-plugins"].each do |name, repo_url|
  git "#{rbenv_root}/plugins/#{name}" do
    repository repo_url
  end
end
