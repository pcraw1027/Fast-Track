namespace :elasticsearch do
  desc "Reindex searchable models"
  task reindex: :environment do
    models = [Product, Company]

    product_index_name = 'product_search_index'
    company_index_name = 'company_search_index'

    # puts "🧹 Deleting existing index: #{product_index_name}"
    # begin
    #   client = models.first.__elasticsearch__.client
    #   client.indices.delete(index: product_index_name)
    #   puts "✅ Deleted index: #{product_index_name}"
    # rescue Elasticsearch::Transport::Transport::Errors::NotFound
    #   puts "ℹ️ Index #{product_index_name} does not exist, skipping delete."
    # end

    # puts "🧹 Deleting existing index: #{company_index_name}"
    # begin
    #   client = models.second.__elasticsearch__.client
    #   client.indices.delete(index: company_index_name)
    #   puts "✅ Deleted index: #{company_index_name}"
    # rescue Elasticsearch::Transport::Transport::Errors::NotFound
    #   puts "ℹ️ Index #{company_index_name} does not exist, skipping delete."
    # end

    puts "⚙️  Creating index: #{product_index_name}"
    begin
      models.first.__elasticsearch__.create_index!(force: true)
      puts "✅ Created index: #{product_index_name}"
    rescue => e
      puts "❌ Failed to create index: #{e.class} - #{e.message}"
      puts e.backtrace.take(5).join("\n")
      exit 1
    end

    puts "⚙️  Creating index: #{company_index_name}"
    begin
      models.second.__elasticsearch__.create_index!(force: true)
      puts "✅ Created index: #{company_index_name}"
    rescue => e
      puts "❌ Failed to create index: #{e.class} - #{e.message}"
      puts e.backtrace.take(5).join("\n")
      exit 1
    end

    models.each do |model|
      puts "➡️  Importing documents for #{model.name}..."
      begin
        model.import(force: true)
        puts "✅ #{model.name} imported successfully."
      rescue => e
        puts "❌ Failed to import #{model.name}: #{e.class} - #{e.message}"
        puts e.backtrace.take(5).join("\n")
      end
    end

    puts "🟢 Reindexing complete."
  end
end
