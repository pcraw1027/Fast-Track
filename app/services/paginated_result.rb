class PaginatedResult
  attr_reader :records, :per_page, :page, :total_count, :total_pages, :next_page, :prev_page

  def initialize(records, per_page, page, total_count)
    @records = records
    @per_page = per_page
    @page = page
    @total_count = total_count
    @total_pages = compute_total_pages
    @next_page = compute_next_page
    @prev_page = compute_prev_page
  end


  private


  def compute_total_pages
    (total_count.to_f / per_page).ceil
  end

  def compute_next_page
    page < total_pages ? page + 1 : nil
  end

  def compute_prev_page
    page > 1 ? page - 1 : nil
  end
end
