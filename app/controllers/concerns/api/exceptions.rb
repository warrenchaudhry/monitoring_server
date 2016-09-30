module Api
  module Exceptions

    class UnAuthorized < StandardError; end
    class Forbidden < StandardError; end
    class BadRequest < StandardError; end
    class NotFound < StandardError; end
    class InvalidCallback < StandardError; end

  end
end
