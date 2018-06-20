node[:homebrew][:package_names].each do |name|
  package name
end

node[:homebrew][:tap_names].each do |name|
  execute "brew tap #{name}" do
    not_if "brew tap | grep -q '#{name}'"
  end
end
