
class TwitsController < ApplicationController

  #in order to be able to use link_to helper...
  include ActionView::Helpers::UrlHelper

  def index
    return redirect_to :root unless params[:q].present?

    search_options = {
        count: 30,
        lang: :en
    }
    search_options[:max_id] = params[:max_id].to_i if params[:max_id].present?
    search = Twitter.search params[:q], search_options

    # "pagination"
    @max_id = search.max_id

    @twits = search.statuses.map do |status|
      @max_id = [@max_id, status.id].min
      #size = 165+165*(status.text.length/100).round
      status.urls.each { |url| status.text.gsub!(url.url, link_to(url.url, url.expanded_url, target: "_blank")) }
      status.user_mentions.each { |mention| status.text.gsub!("@#{mention.screen_name}", link_to("@#{mention.screen_name}", "https://twitter.com/#{mention.screen_name}", target: "_blank"))  }
      status.hashtags.each { |hashtag| status.text.gsub!("##{hashtag.text}", link_to("##{hashtag.text}", "https://twitter.com/search?#{hashtag.text.to_query('q')}&src=hash", target: "_blank"))  }
      {
          text: status.text.html_safe,
          user_pic: status.user.profile_image_url,
          user_name: status.user.screen_name,
          #debug: status.to_yaml,
          #size: size
      }
    end


    respond_to do |format|
      format.html
      format.json { render json: @twits }
    end
  end


end
