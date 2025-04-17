class ApplicationService
  Response = Struct.new(:success?, :payload, :error) do
    def failure?
      !success?
    end
  end

  def initialize(propagate = true)
    @propagate = propagate
  end

  def self.call(...)
    service = new(false)
    service.call(...)
  rescue StandardError => e
    service.failure(e)
  end

  def self.call!(...)
    new(true).call(...)
  end

  def success(payload = nil)
    Response.new(true, payload)
  end


  def failure(excpt_or_reason, options = {})
    exception = excpt_or_reason.is_a?(Exception) ? excpt_or_reason : StandardError.new(excpt_or_reason.to_s)
    raise exception if @propagate
    #ErrorService.error(exception, options)
    Response.new(false, nil, exception)
  end

end