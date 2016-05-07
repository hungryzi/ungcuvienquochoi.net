require 'base64'

class LinksController < ApplicationController
  def redirect
    candidate_id = params[:candidate_id]
    url = Base64.decode64(params[:url])
    Link.increment(candidate_id: candidate_id, url: url)

    redirect_to url
  end
end

