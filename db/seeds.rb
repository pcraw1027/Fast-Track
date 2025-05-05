# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'


Company.destroy_all
IndustryCategoryType.destroy_all
CompanyRelationshipType.destroy_all
CompanyRelationship.destroy_all
CompanyContactType.destroy_all
CompanyContact.destroy_all
EthnicityType.destroy_all
EmployeeType.destroy_all
GenderType.destroy_all
CompanyEthnicityStat.destroy_all
CompanyGenderStat.destroy_all

Product.destroy_all
Brick.destroy_all
Klass.destroy_all
Family.destroy_all
Segment.destroy_all
PitLevelUser.destroy_all
CitLevelUser.destroy_all

BitRecord.destroy_all
PitRecord.destroy_all
CitRecord.destroy_all
ProductCategorySource.destroy_all
User.destroy_all

admin = User.create!(email:"oshanani@gmail.com", password:"Edpass@2", role: 1, status: 0, 
username:"Ed", country: "US", postal_code:"07077")


csv_text = File.read(Rails.root.join('lib','seeds','6_digit_2022_Codes_2022_6_digit_industries.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = IndustryCategoryType.find_by(category_code: row['2022 NAICS Code'])
    next if t
    t = IndustryCategoryType.new
    t.category_code = row['2022 NAICS Code']
    t.title = row['2022 NAICS Title']
    t.naics_year = row['NAICS Year']
    t.save
end

csv_text = File.read(Rails.root.join('lib','seeds','2017_naics_codes.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = IndustryCategoryType.find_by(category_code: row['2017 NAICS Code'])
    next if t
    t = IndustryCategoryType.new
    t.category_code = row['2017 NAICS Code']
    t.title = row['2017 NAICS Title']
    t.naics_year = row['NAICS Year']
    t.save
end



#Companies Seed
companies = []
csv_text = File.read(Rails.root.join('lib','seeds','Companies.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = nil
    i = 0
    companies.find{|c| c.name == row['Company']}
    companies.each.with_index do |c, ind| 
        if c.name == row['Company']
            t = c
            i = ind
            break
        end
    end
    if t
        mids = t.mids
        mids << row['MID']
        t.mids = mids
        t.save
        companies[i] = t
    else
        t = Company.new
        t.mids = [row['MID']]
        t.name = row['Company']
        ind_type = IndustryCategoryType.find_by(category_code: row['Industry_NAICS_Code'])
        t.industry_category_type_id = ind_type.id if ind_type
         unless ind_type
            p row['Industry_NAICS_Code']
            next
         end
        t.website = row['Website']
        begin
            t.save!
            companies << t
        rescue => e
            p e.message
        end
    end
   
end



#BIT Record Seed
csv_text = File.read(Rails.root.join('lib','seeds','BIT.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = BitRecord.new
    t.barcode = row['Barcode']
    t.source = row['Source']
    t.status = row['Status'].downcase == "open" ? 0 : 1
    t.user_id = admin.id
    t.save!
   
end

#PIT Record Seed
csv_text = File.read(Rails.root.join('lib','seeds','PIT.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = PitRecord.new
    t.barcode = row['Barcode']
    t.level = row['Level'].to_i
    t.product_activity_count = row['Product_Activity_Count'].to_i
    t.source = row['Source']
    t.mid = row['Company_MID']
    t.product_id = row['Product_ID']
    begin
        t.save!
        PitLevelUser.create!(user_id: admin.id, pit_record_id: t.id, level: t.level)
    rescue => e
        puts "Error: #{e.message} - barcode: #{t.barcode}"
        puts "Skipping the row..."
    end
    
end

#CIT Record Seed
csv_text = File.read(Rails.root.join('lib','seeds','CIT.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    t = CitRecord.new
    t.level = row['Level'].to_i
    t.product_activity_count = row['Product_Activity_Count'].to_i
    t.product_orphan_count = row['Product_Orphan_Count'].to_i
    t.source = row['Source']
    t.brand = row['Brand_Name']
    t.company_name = row['Company']
    t.company_id = row['Company_ID']
    t.mid = row['MID']
    begin
        t.save!

        CitLevelUser.create!(user_id: admin.id, cit_record_id: t.id, level: t.level)
    rescue => e
        puts "Error: #{e.message} - mid: #{t.mid}"
        puts "Skipping the row..."
    end
end



CompanyRelationshipType.create(
    [{relationship: "Parent/Child", definition: "Parent Company has a Child Subsidary"},
    {relationship: "Parent/Brand", definition: "Parent Company has a Child Brand"},
    {relationship: "Parent/Supplier", definition: "Parent Company has a Child Supplier"},
    {relationship: "Other", definition: "Other type of relationship not yet defined"}]
)

CompanyContactType.create(
    [{role: "CEO", definition: "Company head"},
    {role: "Decision Maker", definition: "Company officer"},
    {role: "CMO", definition: "Chief Marketing Officer - Head of Marketing"},
    {role: "PR Head", definition: "Head of Public Relations"}]
)

EthnicityType.create(
    [{ethnicity: "Hispanic", definition: "Hispanic or Latino - A person of Cuban, Mexican, Puerto Rican, South or Central American, or other Spanish culture or origin regardless of race.", source: "Hispanic or Latino"},
    {ethnicity: "White", definition: "White - A person having origins in any of the original peoples of Europe, the Middle East, or North Africa.", source: "White"},
    {ethnicity: "Black", definition: "Black or African American - A person having origins in any of the black racial groups of Africa.", source: "Black or African American"},
    {ethnicity: "Native Hawaiian", definition: "Native Hawaiian or Other Pacific Islander - A person having origins in any of the peoples of Hawaii, Guam, Samoa, or other Pacific Islands.", source: "Native Hawaiian or Other Pacific Islander"},
    {ethnicity: "Asian", definition: "Asian - A person having origins in any of the original peoples of the Far East, Southeast Asia, or the Indian Subcontinent, including, for example, Cambodia, China, India, Japan, Korea, Malaysia, Pakistan, the Philippine Islands, Thailand, and Vietnam.", source: "Asian"},
    {ethnicity: "American Indian", definition: "American Indian or Alaska Native - A person having origins in any of the original peoples of North and South America (including Central America), and who maintain tribal affiliation or community attachment.", source: "American Indian or Alaska Native"},
    {ethnicity: "Two or More", definition: "Two or More Races - All persons who identify with more than one of the above five races (White, Black or African American, Native Hawaiian or Other Pacific Islander, Asian, American Indian or Alaska Native). For the purposes of this group, identifying as Hispanic or Latino and only one of the listed 5 race groups does NOT qualify.", source: "Two or More Races"}]
)

GenderType.create(
    [{gender: "Male", definition: ""},
    {gender: "Female", definition: ""},
    {gender: "Transgender", definition: ""},
    {gender: "Nonbinary", definition: ""},
    {gender: "Other", definition: ""}]
)

EmployeeType.create(
    [{employee: "Management", definition: "A type of employee classification that can include top-level, mid-level, and first-line management."},
    {employee: "Exempt", definition: "Employees who are paid a salary of at least $684 per week and work in an exempt profession. Exempt employees are not subject to the same tracking requirements as non-exempt employees, such as tracking hours, overtime, and meal periods."},
    {employee: "Non-Exempt", definition: "Employees who are paid an hourly rate and are subject to minimum wage."},
    {employee: "Full-Time", definition: "Employees who are regularly scheduled to work 40 hours per week. Full-time employees are eligible for benefits like paid time off and medical insurance."},
    {employee: "Part-Time", definition: "Employees who are regularly scheduled to work more than 20 hours but less than 40 hours per week."},
    {employee: "Contract", definition: "Employees who have a clearly defined time period of employment."},
    {employee: "Independent Contractor", definition: "Also known as freelancers, independent contractors are considered self-employed and are responsible for their own taxes."},
    {employee: "Temporary", definition: "Employees who work full- or part-time for a period of no more than 90 days."},
    {employee: "On-Call", definition: "Employees who are not regularly scheduled but are employed as needed by the company."},
    {employee: "Volunteer/Intern", definition: "Employees who are employed for a specific period of time, such as a school semester."}]
)

ProductCategorySource.create(
    [{code: "AMZ", description: "Amazon"},
    {code: "GPC" , description: "Global Product Classification"}]
)


#Products Seed
csv_text = File.read(Rails.root.join('lib','seeds','Products.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
products = []
csv.each do |row|
    v = ProductVariant.find_by(barcode: row['Barcode'])
    next if v
    match = products.find{|p|p.name == row['Product_Name']}
    image_path = Rails.root.join('lib','seeds', 'prod_images', "#{row['Barcode']}.jpg")
    if match
        v = ProductVariant.new
        v.barcode = row['Barcode']
        v.product_id = match.id
        if File.exist?(image_path)
            v.image = File.open(image_path) 
        else
            puts "Image not found for #{row['Barcode']}: #{image_path}"
        end
        v.save!
    else

        t = Product.new
        t.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        t.name = row['Product_Name']
        t.size = row['Size']
        if t.save
            v = ProductVariant.new
            v.barcode = row['Barcode']
            v.product_id = t.id
            if File.exist?(image_path)
                v.image = File.open(image_path) 
            else
                puts "Image not found for #{row['Barcode']}: #{image_path}"
            end
            v.save!
        end
        products << t
    end
end


csv_text = File.read(Rails.root.join('lib','seeds','GPC_May_2024_Schema.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
last_segment_code = ""
last_family_code = ""
last_class_code = ""
last_brick_code = ""
gpc_rows = 1

csv.each do |row|
    p "GPC - #{gpc_rows} " + +  row['SegmentTitle']
    gpc_rows += 1
    if row['SegmentCode'] != last_segment_code
        t = Segment.new
        t.code = row['SegmentCode']
        t.title = row['SegmentTitle']
        t.description = row['SegmentDefinition']
        t.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        t.save

        last_segment_code = row['SegmentCode']

        s = Family.new
        s.segment_id = Segment.find_by(code: last_segment_code).id
        s.code = row['FamilyCode']
        s.title = row['FamilyTitle']
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        s.save

        last_family_code = row['FamilyCode']

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        q.save

        last_brick_code = row['BrickCode']

    elsif row['FamilyCode'] != last_family_code
        s = Family.new
        s.segment_id = Segment.find_by(code: last_segment_code).id
        s.code = row['FamilyCode']
        s.title = row['FamilyTitle']
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        s.save

        last_family_code = row['FamilyCode']

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        q.save

        last_brick_code = row['BrickCode']
                
    
    elsif row['ClassCode'] != last_class_code

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        q.save

        last_brick_code = row['BrickCode']
                    
    elsif row['BrickCode'] != last_brick_code 

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 
        q.save

        last_brick_code = row['BrickCode']       
              
    else
    
    end
    
end




csv_text = File.read(Rails.root.join('lib','seeds','AmazonCategoryCodesOutput.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
last_segment_title = ""
last_family_title = ""
last_class_title = ""
last_brick_title = ""

s_code = 82300
f_code = 54100
c_code = 54100
b_code = 31000
ac_rows = 1
csv.each do |row|
    p "AC - #{ac_rows} " +  row['SegmentTitle'] + " " + row['FamilyTitle'] +  " " + row['ClassTitle'] + " " + row['BrickTitle']
    ac_rows +=1
    if row['SegmentTitle']&.strip != last_segment_title
        t = Segment.new
        t.code = s_code
        s_code +=1 
        last_segment_title = row['SegmentTitle'].strip
        t.title = last_segment_title
        t.description = row['SegmentDefinition']
        t.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        t.save

        
        s = Family.new
        s.segment_id = Segment.find_by(title: last_segment_title)&.id
        s.code = f_code
        f_code += 1
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        s.save
        
        
        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = c_code
        c_code += 1
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save
        
        
        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = b_code
        b_code += 1
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save
        

    elsif row['FamilyTitle']&.strip != last_family_title
        s = Family.new
        s.segment_id = Segment.find_by(title: last_segment_title)&.id
        s.code = f_code
        f_code += 1
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        s.save


        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = c_code
        c_code += 1
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save


        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = b_code
        b_code += 1
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

             
    
    elsif row['ClassTitle']&.strip != last_class_title

        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = c_code
        c_code += 1
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save


        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = b_code
        b_code += 1
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save
                    
    elsif row['BrickTitle']&.strip != last_brick_title 

        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = b_code
        b_code += 1    
        last_brick_title = row['BrickTitle'].strip     
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

    else
    
    end
    
end


=begin
csv_text = File.read(Rails.root.join('lib','seeds','GPC as of May 2024 v20240603 GB.xlsx - Schema.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

csv.each do |row|
    If row|segmentcode| = last_segment_title
        If row|familycode| = last _familly_code
        
            If row|classcode| = last _class_code
                If row|brickcode| = last _brick_code
                    
                else
                    q = Brick.new
                    q.segment_id = Klass.where(code: last_class_title).id
                    q.code = row|brickcode|
                    q.title = row|bricktitle|
                    q.description = row|brickdefinition|
                    q.product_catergory_source_id = ProductCategorySource.id.where(code: “GPC”). 
                    q.save
    
                    last_brick_title = row|brickcode|
                end

            else
                r = Klass.new
                r.segment_id = Family.id.where(code: last_family_title)
                r.code = row|classcode|
                r.title = row|classtitle|
                r.description = row|classdefinition|
                r.product_catergory_source_id = ProductCategorySource.id.where(code: “GPC”). 
                r.save
    
                last_class_title = row|classcode|
            end
            

        else
            s = Family.new
            s.segment_id = Segment.id.where(code: last_segment_title)
            s.code = row|familycode|
            s.title = row|familytitle|
            s.description = row|familydefinition|
            s.product_catergory_source_id = ProductCategorySource.id.where(code: “GPC”). 
            s.save
    
            last_family_title = row|familycode|

        end
    else
        t = Segment.new
        t.code = row|segmentcode|
        t.title = row|segmenttitle|
        t.description = row|segmentdefinition|
        t.product_catergory_source_id = ProductCategorySource_id.where(code: “GPC”). 
        t.save
    
        last_segment_title = row|segmentcode|
    end

    
end
=end


=begin
IndustryCategoryType.create(
    [{type: "11", definition: "Agriculture, Forestry, Fishing and Hunting"},
    {type: "21", definition: "Mining, Quarrying, Oil and Gas Extraction"},
    {type: "22", definition: "Utilities"},
    {type: "23", definition: "Construction"},
    {type: "31-33", definition: "Manufacturing"},
    {type: "42", definition: "Wholesale Trade"},
    {type: "44-45", definition: "Retail Trade"},
    {type: "48-49", definition: "Transportation and Warehousing"}]
)

 If row|attributecode| = last _attribute_code
                        If row|attributevaluecode| = last _attribute_value_code

                        else

                        end

                    else

                    end

=end
