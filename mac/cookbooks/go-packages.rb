node["go-packages"].each do |repo_name, bin_name|
  execute "go get #{repo_name}" do
    not_if "which #{bin_name}"
  end
end
