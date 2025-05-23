class Review < ApplicationRecord
  belongs_to :reviewable, polymorphic: true
  belongs_to :user

  validates :rating, presence: { message: "is required" }, inclusion: { in: 1..5, message: "must be between 1 and 5" }

  def self.load_data(per_page, page, record_id, class_name)
    page = page.to_i > 0 ? page : 1
    per_page = per_page.to_i > 0 ? per_page : 10
    offset   = (page - 1) * per_page

    base_query = Review.joins(:user)
                   .where(reviewable_type: class_name, reviewable_id: record_id)
                   .where.not(title: nil)

    total_count = base_query.count

    paginated_reviews = base_query
      .select('reviews.*, users.username, users.country')
      .limit(per_page)
      .offset(offset)
      .order(updated_at: :desc, rating: :desc)
    PaginatedResult.new(paginated_reviews, per_page, page, total_count)
end

def self.stats_for(record)
  sql = <<-SQL
    SELECT 
      AVG(rating)::float AS average,
      COUNT(*) AS total,
      COUNT(CASE WHEN comment IS NOT NULL AND TRIM(comment) <> '' THEN 1 END) AS commented_count
    FROM reviews
    WHERE reviewable_id = $1 AND reviewable_type = $2
  SQL

  result = ActiveRecord::Base.connection.exec_query(
    sql,
    "SQL - Review Stats",
    [[nil, record.id], [nil, record.class.name]]
  ).first

  {
    average_ratings: result["average"]&.round(2) || 0,
    total_ratings: result["total"],
    total_reviews: result["commented_count"]
  }
end


def self.rating_distribution_for(record)
    sql = <<-SQL
      WITH ratings AS (
        SELECT rating, COUNT(*) AS count
        FROM reviews
        WHERE reviewable_id = $1 AND reviewable_type = $2
        GROUP BY rating
      ),
      total AS (
        SELECT COUNT(*) AS total_count
        FROM reviews
        WHERE reviewable_id = $1 AND reviewable_type = $2
      ),
      full_scale AS (
        SELECT generate_series(1, 5) AS rating
      )
      SELECT 
        full_scale.rating,
        COALESCE(ratings.count, 0) AS count,
        total.total_count,
        ROUND(
          COALESCE((ratings.count::float / NULLIF(total.total_count, 0)) * 100, 0)::numeric,
          2
        ) AS percentage

      FROM full_scale
      LEFT JOIN ratings ON ratings.rating = full_scale.rating
      CROSS JOIN total
      ORDER BY full_scale.rating
    SQL

    results = ActiveRecord::Base.connection.exec_query(
      sql,
      "SQL - Rating Distribution",
      [[nil, record.id], [nil, record.class.name]]
    )

    results.rows.to_h { |rating, count, total, percentage| [rating, percentage] }
  end


  # def self.rating_distribution_for(record)
  #   total = where(reviewable: record).count.to_f

  #   return {} if total == 0

  #   group(:rating)
  #     .where(reviewable: record)
  #     .count
  #     .transform_values { |count| ((count / total) * 100).round(2) }
  #     .tap do |dist|
  #       # Ensure all 1..5 keys are present, even if 0%
  #       (1..5).each { |r| dist[r] ||= 0.0 }
  #     end
  # end

end

