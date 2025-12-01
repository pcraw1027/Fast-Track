require 'csv'

    Domains::Companies::Company.destroy_all
    Domains::Companies::IndustryCategoryType.destroy_all
    Domains::Companies::CompanyRelationshipType.destroy_all
    Domains::Companies::CompanyRelationship.destroy_all
    Domains::Companies::CompanyContactType.destroy_all
    Domains::Companies::CompanyContact.destroy_all
    Domains::Companies::EmployeeType.destroy_all
    Domains::Companies::CompanyEthnicityStat.destroy_all
    Domains::Companies::CompanyGenderStat.destroy_all
    Domains::People::EthnicityType.destroy_all
    Domains::People::GenderType.destroy_all

    Domains::Products::Product.destroy_all
    Domains::Products::ProductVariant.destroy_all
    Domains::Classifications::Brick.destroy_all
    Domains::Classifications::Klass.destroy_all
    Domains::Classifications::Family.destroy_all
    Domains::Classifications::Segment.destroy_all
    Domains::CroupierCore::PitLevelUser.destroy_all
    Domains::CroupierCore::CitLevelUser.destroy_all

    Domains::CroupierCore::BitRecord.destroy_all
    Domains::CroupierCore::PitRecord.destroy_all
    Domains::CroupierCore::CitRecord.destroy_all
    Domains::Classifications::ProductCategorySource.destroy_all
    Domains::Users::User.destroy_all

    Domains::Socials::SocialSite.destroy_all
    Domains::ContactAndIdentity::CountryReference.destroy_all
    Domains::ContactAndIdentity::AddressType.destroy_all

admin = Domains::Users::User.create!(email: "oshanani@gmail.com", password: "Edpass@2", role: 1, status: 0, 
username: "Ed", country: "US", postal_code: "07077")

admin2 = Domains::Users::User.create!(email: "pcraw1027@gmail.com", password: "Ptpass@2", role: 1, status: 0, 
username: "pcraw", country: "US", postal_code: "07077")


 Domains::Companies::CompanyRelationshipType.create(
        [{ relationship: "Parent/Child", definition: "Parent Company has a Child Subsidary" },
         { relationship: "Parent/Brand", definition: "Parent Company has a Child Brand" },
         { relationship: "Parent/Supplier", definition: "Parent Company has a Child Supplier" },
         { relationship: "Other", definition: "Other type of relationship not yet defined" }]
    )

    Domains::Companies::CompanyContactType.create(
        [{ role: "CEO", definition: "Company head" },
         { role: "Decision Maker", definition: "Company officer" },
         { role: "CMO", definition: "Chief Marketing Officer - Head of Marketing" },
         { role: "PR Head", definition: "Head of Public Relations" }]
    )

    Domains::People::EthnicityType.create(
        [{ ethnicity: "Hispanic", definition: "Hispanic or Latino - A person of Cuban, Mexican, Puerto Rican, South or Central American, or other Spanish culture or origin regardless of race.", source: "Hispanic or Latino" },
         { ethnicity: "White", definition: "White - A person having origins in any of the original peoples of Europe, the Middle East, or North Africa.", source: "White" },
         { ethnicity: "Black", definition: "Black or African American - A person having origins in any of the black racial groups of Africa.", source: "Black or African American" },
         { ethnicity: "Native Hawaiian", definition: "Native Hawaiian or Other Pacific Islander - A person having origins in any of the peoples of Hawaii, Guam, Samoa, or other Pacific Islands.", source: "Native Hawaiian or Other Pacific Islander" },
         { ethnicity: "Asian", definition: "Asian - A person having origins in any of the original peoples of the Far East, Southeast Asia, or the Indian Subcontinent, including, for example, Cambodia, China, India, Japan, Korea, Malaysia, Pakistan, the Philippine Islands, Thailand, and Vietnam.", source: "Asian" },
         { ethnicity: "American Indian", definition: "American Indian or Alaska Native - A person having origins in any of the original peoples of North and South America (including Central America), and who maintain tribal affiliation or community attachment.", source: "American Indian or Alaska Native" },
         { ethnicity: "Two or More", definition: "Two or More Races - All persons who identify with more than one of the above five races (White, Black or African American, Native Hawaiian or Other Pacific Islander, Asian, American Indian or Alaska Native). For the purposes of this group, identifying as Hispanic or Latino and only one of the listed 5 race groups does NOT qualify.", source: "Two or More Races" }]
    )

    Domains::People::GenderType.create(
        [{ gender: "Male", definition: "" },
         { gender: "Female", definition: "" },
         { gender: "Transgender", definition: "" },
         { gender: "Nonbinary", definition: "" },
         { gender: "Other", definition: "" }]
    )

    Domains::ContactAndIdentity::CountryReference.create(
        [{ country_code: "CAN", country: "Canada" },
         { country_code: "GBR", country: "United Kingdom and Northern Ireland" },
         { country_code: "USA", country: "United States of America" },
         { country_code: "OTH", country: "Other" }]
    )

    Domains::Socials::SocialSite.create(
        [
          { site_code: "X", site: "X (formerly Twitter)" },
          { site_code: "LinkedIn", site: "LinkedIn" },
          { site_code: "TikTok", site: "TikTok" },
          { site_code: "YouTube", site: "YouTube" },
          { site_code: "Instagram", site: "Instagram" },
          { site_code: "FB", site: "FaceBook" },
          { site_code: "Bluesky", site: "Bluesky" },
          { site_code: "Discord", site: "Discord" },
          { site_code: "Slack", site: "Slack" },
          { site_code: "Threads", site: "Threads" },
          { site_code: "Pinterest", site: "Pinterest" },
          { site_code: "OTH", site: "Other" }
        
        ]
        )

Domains::ContactAndIdentity::AddressType.create(
        [
          { name: "Main Address (Corporate HQ)", is_person_address: false },
          { name: "Country HQ", is_person_address: false },
          { name: "Regional HQ", is_person_address: false },
          { name: "Manufacturing Facility", is_person_address: false },
          { name: "Distribution Facility", is_person_address: false },
          { name: "Storage Facility (Warehouse)", is_person_address: false },
          { name: "Registered Office (UK)", is_person_address: false },
          { name: "Trading Office (UK)", is_person_address: false }
        ])

    Domains::Companies::EmployeeType.create(
        [{ employee: "Management", definition: "A type of employee classification that can include top-level, mid-level, and first-line management." },
         { employee: "Exempt", definition: "Employees who are paid a salary of at least $684 per week and work in an exempt profession. Exempt employees are not subject to the same tracking requirements as non-exempt employees, such as tracking hours, overtime, and meal periods." },
         { employee: "Non-Exempt", definition: "Employees who are paid an hourly rate and are subject to minimum wage." },
         { employee: "Full-Time", definition: "Employees who are regularly scheduled to work 40 hours per week. Full-time employees are eligible for benefits like paid time off and medical insurance." },
         { employee: "Part-Time", definition: "Employees who are regularly scheduled to work more than 20 hours but less than 40 hours per week." },
         { employee: "Contract", definition: "Employees who have a clearly defined time period of employment." },
         { employee: "Independent Contractor", definition: "Also known as freelancers, independent contractors are considered self-employed and are responsible for their own taxes." },
         { employee: "Temporary", definition: "Employees who work full- or part-time for a period of no more than 90 days." },
         { employee: "On-Call", definition: "Employees who are not regularly scheduled but are employed as needed by the company." },
         { employee: "Volunteer/Intern", definition: "Employees who are employed for a specific period of time, such as a school semester." }]
    )

    Domains::Classifications::ProductCategorySource.create(
        [{ code: "AMZ", description: "Amazon" },
         { code: "GPC", description: "Global Product Classification" }]
    )


csv_text = Rails.root.join("lib/seeds/AmazonCategoryCodesOutput.csv").read
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

product_category_source_id = Domains::Classifications::ProductCategorySource.find_by(code: 'AMZ').id 

ac_rows = 1
csv.each do |row|
    Rails.logger.debug "AC - #{ac_rows} " +  row['SegmentTitle'] + " " + row['FamilyTitle'] +  " " + row['ClassTitle'] + " " + row['BrickTitle']
    ac_rows +=1

       s = Domains::Classifications::Segment.find_or_create_by!(code: row['SegmentCode'], title: row['SegmentTitle']&.strip,
          product_category_source_id: product_category_source_id
       )
     
        
        f = Domains::Classifications::Family.find_or_create_by!(
            segment_id: s.id, code: row['FamilyCode'], title: row['FamilyTitle']&.strip,
            product_category_source_id: product_category_source_id
        )

        k = Domains::Classifications::Klass.find_or_create_by!(
            family_id: f.id, code: row['ClassCode'], title: row['ClassTitle']&.strip,
            product_category_source_id: product_category_source_id
        )

        b = Domains::Classifications::Brick.find_or_create_by!(
            klass_id: k.id, code: row['BrickCode'], title: row['BrickTitle']&.strip,
            product_category_source_id: product_category_source_id
        )
        
end




csv_text = Rails.root.join("lib/seeds/GPC_May_2024_Schema.csv").read
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
last_segment_title = ""
last_family_title = ""
last_class_title = ""
last_brick_title = ""
gpc_rows = 1
product_category_source_id = Domains::Classifications::ProductCategorySource.find_by(code: 'GPC').id 

csv.each do |row|
    Rails.logger.debug "GPC - #{gpc_rows} " + row['SegmentTitle']
    gpc_rows += 1
    if row['SegmentTitle']&.strip != last_segment_title
        t = Domains::Classifications::Segment.new
        t.code = row['SegmentCode']
        last_segment_title = row['SegmentTitle'].strip
        t.title = last_segment_title
        t.description = row['SegmentDefinition']
        t.product_category_source_id = product_category_source_id 
        t.save

        
        s = Domains::Classifications::Family.new
        s.segment_id = Domains::Classifications::Segment.find_by(title: last_segment_title)&.id
        s.code = row['FamilyCode']
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = product_category_source_id 
        s.save
        
        
        r = Domains::Classifications::Klass.new
        r.family_id = Domains::Classifications::Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save
        
        q = Domains::Classifications::Brick.new
        q.klass_id = Domains::Classifications::Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save
        

    elsif row['FamilyTitle']&.strip != last_family_title
        s = Domains::Classifications::Family.new
        s.segment_id = Segment.find_by(title: last_segment_title)&.id
        s.code = row['FamilyCode']
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = product_category_source_id 
        s.save

        r = Domains::Classifications::Klass.new
        r.family_id = Domains::Classifications::Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save

        q = Domains::Classifications::Brick.new
        q.klass_id = Domains::Classifications::Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save             
    
    elsif row['ClassTitle']&.strip != last_class_title

        r = Domains::Classifications::Klass.new
        r.family_id = Domains::Classifications::Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save


        q = Domains::Classifications::Brick.new
        q.klass_id = Domains::Classifications::Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save
                    
    elsif row['BrickTitle']&.strip != last_brick_title 

        q = Domains::Classifications::Brick.new
        q.klass_id = Domains::Classifications::Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode'] 
        last_brick_title = row['BrickTitle'].strip     
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save

    else
    
    end
    
end



