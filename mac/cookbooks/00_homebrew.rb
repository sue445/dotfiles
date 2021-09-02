# NOTE: brewでgoを入れないとgo getができないので全てのcookbookの一番最初に実行する

# NOTE: aws-sam-cliのように先にbrew tapしないとinstallできないものがあるので先に実行する
node[:homebrew][:tap_names] ||= []
node[:homebrew][:tap_names].each do |name|
  execute "brew tap #{name}" do
    not_if "brew tap | grep -q '#{name}'"
  end
end

formula_installed_packages = `brew list -1 --formula`.each_line.map(&:strip)
cask_installed_packages    = `brew list -1 --cask`.each_line.map(&:strip)

# NOTE: mruby contains Set
all_installed_packages = (formula_installed_packages + cask_installed_packages).each_with_object({}) do |package_name, hash|
  package_name = package_name.gsub(/@.+$/, "")
  hash[package_name] = true
end

node[:homebrew][:package_names].each do |name|
  # NOTE: this is very slow!
  # package name do
  #   not_if "brew list | grep -E '^#{name}(@.+)?$'"
  # end

  unless all_installed_packages[name]
    package name
  end
end

node[:homebrew][:service_names].each do |name|
  execute "brew services start #{name}" do
    only_if "brew services list | grep -E '#{name}\\s+stopped'"
  end
end
