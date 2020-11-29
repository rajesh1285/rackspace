class Friendship < ApplicationRecord
  belongs_to :user
  before_create :generate_short_url

  def self.search(search)
	  if search  
			all.where("titile LIKE ?", "%#{search}%" )  
	  else
	  	all
	  end
  end

  # def self.generate_short_url(website_url)
  #   rand(36**8).to_s(36)
  # end

end