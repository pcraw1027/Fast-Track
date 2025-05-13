class PaginatedResult
  attr_reader :records, :limit, :page, :total_count

  def initialize(records, limit, page, total_count)
    @records = records
    @limit = limit
    @page = page
    @total_count = total_count
  end

  def total_pages
    (total_count.to_f / limit).ceil
  end

  def next_page
    page < total_pages ? page + 1 : nil
  end

  def prev_page
    page > 1 ? page - 1 : nil
  end
end
