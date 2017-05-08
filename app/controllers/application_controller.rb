class ApplicationController < ActionController::API
  before_action :authenticate, except: [:index, :show]
  # before_action :authenticate, only: [:login]

  def logged_in?
    !!current_user
  end

  def current_user
    if auth_present?
      if auth != 'FAILED'
        user = User.find(auth["user"])
        if user && !user.disabled
          @current_user ||= user
        end
      end
    end
  end

  def authenticate
    render json: {error: "unauthorized"}, status: 401 unless logged_in?
  end

  private
    def pagination(collection)
      {
        pagination: {
          current: collection.current_page,
          next: collection.next_page,
          prev: collection.prev_page
        },
        total_pages: collection.total_pages,
        total_count: collection.total_count
      }
    end

    def token
      request.env["HTTP_AUTHORIZATION"].scan(/Bearer (.*)$/).flatten.last
    end

    def auth
      Auth.decode(token)
    end

    def auth_present?
      !!request.env.fetch("HTTP_AUTHORIZATION", "").scan(/Bearer/).flatten.first
    end
end
