
require 'csv'

csv_text = File.read(Rails.root.join('lib','seeds','AmazonCategoryCodesOutput.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
last_segment_code = ""
last_family_code = ""
last_class_code = ""
last_brick_code = ""

csv.each do |row|
    p row
    if row['SegmentCode'] != last_segment_code
        t = Segment.new
        t.code = row['SegmentCode']
        t.title = row['SegmentTitle']
        t.description = row['SegmentDefinition']
        t.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        t.save

        last_segment_code = row['SegmentCode']

        s = Family.new
        s.segment_id = Segment.find_by(code: last_segment_code).id
        s.code = row['FamilyCode']
        s.title = row['FamilyTitle']
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        s.save

        last_family_code = row['FamilyCode']

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

        last_brick_code = row['BrickCode']

    elsif row['FamilyCode'] != last_family_code
        s = Family.new
        s.segment_id = Segment.find_by(code: last_segment_code).id
        s.code = row['FamilyCode']
        s.title = row['FamilyTitle']
        s.description = row['FamilyDefinition']
        s.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        s.save

        last_family_code = row['FamilyCode']

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

        last_brick_code = row['BrickCode']
                
    
    elsif row['ClassCode'] != last_class_code

        r = Klass.new
        r.family_id = Family.find_by(code: last_family_code).id
        r.code = row['ClassCode']
        r.title = row['ClassTitle']
        r.description = row['ClassDefinition']
        r.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        r.save

        last_class_code = row['ClassCode']

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

        last_brick_code = row['BrickCode']
                    
    elsif row['BrickCode'] != last_brick_code 

        q = Brick.new
        q.klass_id = Klass.find_by(code: last_class_code).id
        q.code = row['BrickCode']
        q.title = row['BrickTitle']
        q.description = row['BrickDefinition']
        q.product_category_source_id = ProductCategorySource.find_by(code: 'AMZ').id 
        q.save

        last_brick_code = row['BrickCode']       
              
    else
    
    end
    
end


