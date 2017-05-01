module Votable
  extend ActiveSupport::Concern

  included do
    attr_reader :votable
    append_before_action :set_votable
  end

  def upvote
    if (votable.votes << Vote.new(user: current_user))
      voted
    else
      flash.now.alert = "Avevi gia' votato"
    end
  end

  def downvote
    if votable.votes << Vote.new(user: current_user, up: false)
      voted
    else
      flash.now.alert = "Avevi gia' votato!"
    end
  end

  private

  def set_votable
    @votable = @comment || @paragraph
    logger.debug "BEh.. votable? #{ @votable }"
  end

  def voted
    respond_to do |format|
      format.js {
        render 'application/voted'
      }
    end
  end
end
