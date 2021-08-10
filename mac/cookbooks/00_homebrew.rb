node[:homebrew][:tap_names] ||= []
node[:homebrew][:tap_names].each do |name|
  execute "brew tap #{name}" do
    not_if "brew tap | grep -q '#{name}'"
  end
end

node[:homebrew][:package_names].each do |name|
  package name do
    not_if "brew list | grep -E '^#{name}(@.+)?$'"
  end
end

node[:homebrew][:service_names].each do |name|
  execute "brew services start #{name}" do
    only_if "brew services list | grep -E '#{name}\\s+stopped'"
  end
end
