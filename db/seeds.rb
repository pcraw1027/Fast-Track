
require 'csv'

csv_text = File.read(Rails.root.join('lib','seeds','AmazonCategoryCodesOutput.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 

ac_rows = 1
csv.each do |row|
    p "AC - #{ac_rows} " +  row['SegmentTitle'] + " " + row['FamilyTitle'] +  " " + row['ClassTitle'] + " " + row['BrickTitle']
    ac_rows +=1

       s = Segment.find_or_create_by!(code: row['SegmentCode'], title: row['SegmentTitle']&.strip,
          product_category_source_id: product_category_source_id
       )
     
        
        f = Family.find_or_create_by!(
            segment_id: s.id, code: row['FamilyCode'], title: row['FamilyTitle']&.strip,
            product_category_source_id: product_category_source_id
        )

        k = Klass.find_or_create_by!(
            family_id: f.id, code: row['ClassCode'], title: row['ClassTitle']&.strip,
            product_category_source_id: product_category_source_id
        )

        b = Brick.find_or_create_by!(
            klass_id: k.id, code: row['BrickCode'], title: row['BrickTitle']&.strip,
            product_category_source_id: product_category_source_id
        )
        
end




csv_text = File.read(Rails.root.join('lib','seeds','GPC_May_2024_Schema.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
last_segment_title = ""
last_family_title = ""
last_class_title = ""
last_brick_title = ""
gpc_rows = 1
product_category_source_id = ProductCategorySource.find_by(code: 'GPC').id 

csv.each do |row|
    p "GPC - #{gpc_rows} " + +  row['SegmentTitle']
    gpc_rows += 1
    if row['SegmentTitle']&.strip != last_segment_title
        t = Segment.new
        t.code = row['SegmentCode']
        last_segment_title = row['SegmentTitle'].strip
        t.title = last_segment_title
        t.description = row['SegmentDefinition']
        t.product_category_source_id = product_category_source_id 
        t.save

        
        s = Family.new
        s.segment_id = Segment.find_by(title: last_segment_title)&.id
        s.code = row['FamilyCode']
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = product_category_source_id 
        s.save
        
        
        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save
        
        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save
        

    elsif row['FamilyTitle']&.strip != last_family_title
        s = Family.new
        s.segment_id = Segment.find_by(title: last_segment_title)&.id
        s.code = row['FamilyCode']
        last_family_title = row['FamilyTitle'].strip
        s.title = last_family_title
        s.description = row['FamilyDefinition']
        s.product_category_source_id = product_category_source_id 
        s.save

        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save

        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save             
    
    elsif row['ClassTitle']&.strip != last_class_title

        r = Klass.new
        r.family_id = Family.find_by(title: last_family_title)&.id
        r.code = row['ClassCode']
        last_class_title = row['ClassTitle'].strip
        r.title = last_class_title
        r.description = row['ClassDefinition']
        r.product_category_source_id = product_category_source_id 
        r.save


        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode']
        last_brick_title = row['BrickTitle'].strip
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save
                    
    elsif row['BrickTitle']&.strip != last_brick_title 

        q = Brick.new
        q.klass_id = Klass.find_by(title: last_class_title)&.id
        q.code = row['BrickCode'] 
        last_brick_title = row['BrickTitle'].strip     
        q.title = last_brick_title
        q.description = row['BrickDefinition']
        q.product_category_source_id = product_category_source_id 
        q.save

    else
    
    end
    
end



