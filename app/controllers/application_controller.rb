class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def respond_with(text)
    introduce_delay unless params.key?(:no_delay)
    render plain: text
  end

  private

  def introduce_delay
    if ENV['DELAY'] == "1"
      puts 'Introducing 100ms delay...'
      sleep(0.1)
    end
  end

  def record_not_found
    render plain: '404 Not Found', status: 404
  end
end
