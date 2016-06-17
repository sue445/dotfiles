# Generate tag links for Docker Hub
# https://gist.github.com/sue445/10ddbff927e986d3d9a9f2fcda5d8258

# fetch remote branch
remote_branches =
  `git branch -r`.lines.map(&:strip).
  reject { |branch| branch.start_with?("origin/HEAD") }.
  map { |branch|
    branch.gsub(%r{^origin/([.\w]+)}) { Regexp.last_match[1] }
  }

# generate GitHub link from remote url
fetch_line = `git remote -v`.lines.first
fetch_line =~ %r{git@github\.com:(.+)/(.+)\.git}
github_url = "https://github.com/#{Regexp.last_match[1]}/#{Regexp.last_match[2]}"

# generate markdown format links
content =
  remote_branches.sort_by(&:itself).reverse.each_with_object("") do |branch, content|
    tag = branch == "master" ? "latest" : branch
    url = "#{github_url}/blob/#{branch}/Dockerfile"

    content << "* `#{tag}` [(#{branch}/Dockerfile)](#{url})\n"
  end

puts content
