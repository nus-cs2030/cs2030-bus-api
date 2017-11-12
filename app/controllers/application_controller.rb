class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def respond_with(text)
    sleep(0.5)
    render plain: text
  end

  private

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
