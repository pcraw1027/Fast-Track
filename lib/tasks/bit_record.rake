# lib/tasks/update_symbology.rake
namespace :bit_record do
  desc "Update all BitRecord symbology values"
  task update_symbology: :environment do
    puts "Updating BitRecord symbology..."

    BitRecord.find_each do |record|
      # Example: infer symbology from barcode length
      case record.barcode&.length
      when 6
        record.update(symbology: "UPC-E")
      when 8
        record.update(symbology: "EAN-8")
      when 12
        record.update(symbology: "UPC-A")
      when 13
        record.update(symbology: "EAN-13")
      else
        record.update(symbology: "UNKNOWN")
      end
    end

    puts "Finished updating BitRecord symbology."
  end
end


