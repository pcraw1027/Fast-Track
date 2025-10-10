Dir[Rails.root.join("app/domains/**/*.rb")].each do |file|
  require file
end