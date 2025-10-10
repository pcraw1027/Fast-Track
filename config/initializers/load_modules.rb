Rails.root.glob("app/domains/**/*.rb").each do |file|
  require file
end