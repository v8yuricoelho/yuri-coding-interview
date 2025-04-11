class TweetsController < ApplicationController
  def index
    if params[:page].present?
      page = params[:page].to_i
    else
      page = 1
    end

    if params[:per_page].present?
      per_page = params[:per_page].to_i
    else
      per_page = 5
    end

    tweets = Tweet.all.by_user(params[:user_id])
    render json: tweets.limit(per_page).offset((page - 1) * per_page)
  end

  private

  def search_params
    params.permit(:user_id, :page, :per_page)
  end
end
