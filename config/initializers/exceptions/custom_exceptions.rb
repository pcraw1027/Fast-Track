# config/initializers/exceptions/custom_exceptions.rb

# Raised when a resource is unavailable
class ResourceUnavailableError < StandardError 
  def initialize(msg="The requested resource is unavailable")
      super
  end
end

class LimitOfRepliesReached < StandardError; end

# Raised when user authentication fails
class AuthenticationError < StandardError; end

# Raised when access is denied due to insufficient permissions
class AccessDeniedError < StandardError; end
