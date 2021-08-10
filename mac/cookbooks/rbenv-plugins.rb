rbenv_root = `rbenv root`.strip

directory "#{rbenv_root}/plugins"

node["rbenv-plugins"].each do |name, repo_url|
  git "#{rbenv_root}/plugins/#{name}" do
    repository repo_url
  end
end
