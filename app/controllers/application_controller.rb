class ApplicationController < ActionController::API
  def sanitize_params(params)
    params.values.each do |str|
      str.squish! if str.is_a? String
    end
    params
  end
end
