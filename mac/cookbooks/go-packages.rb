node["go-packages"].each do |repo_name, bin_name|
  execute "go install #{repo_name}@latest" do
    not_if "which #{bin_name}"
  end
end
