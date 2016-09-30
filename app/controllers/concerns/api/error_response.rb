module Api
  module ErrorResponse
    def self.included(base)
      base.rescue_from Api::Exceptions::UnAuthorized, with: :throw_401
      base.rescue_from Api::Exceptions::Forbidden, with: :throw_403
      base.rescue_from Api::Exceptions::NotFound, with: :throw_404
      base.rescue_from Api::Exceptions::InvalidCallback, with: :throw_403
      base.rescue_from StandardError, with: :throw_500 if Rails.env.production?
    end

    def throw_400
      json_response('BadRequest', 'Request cannot be fulfilled due to bad syntax!')
    end

    def throw_401
      json_response('UnAuthorized', 'Authentication required!', 401)
    end

    def throw_403
      json_response('Forbidden', 'You are not authorized to fulfill this action!', 403)
    end

    def throw_404
      json_response('NotFound', 'Requested resource could not be found!', 404)
    end

    def throw_500
      json_response('InternalServerError', 'Error in module', 500)
    end

    def json_response(err, desc, status = 400)
      render json: {
                      error:
                        {
                          title: err,
                          description: desc,
                          status: status.to_s
                        }
                    }, status: status
    end

  end

end
