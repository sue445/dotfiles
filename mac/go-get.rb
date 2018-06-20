node["go-get"].each do |repo_name|
  execute "go get #{repo_name}" do
    not_if "ls #{ENV["GOPATH"]}/src/#{repo_name}"
  end
end
