

class Topic < ActiveRecord::Base

  has_many :comments

  # @@all = []

  # def initialize (name:, url:)
  #   @name = name
  #   @url = url
  #   @@all << self
  # end



end