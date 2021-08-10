Dir.glob("cookbooks/*").sort.each do |name|
  include_recipe name
end
