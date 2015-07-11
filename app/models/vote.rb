class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :post

  def up_votes
    votes.where(value: 1).count
  end

end


