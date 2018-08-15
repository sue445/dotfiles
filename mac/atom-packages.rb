node["atom-packages"].each do |name|
  execute "apm install #{name}" do
    not_if "apm list --installed --bare | grep -E '^#{name}@'"
  end
end
