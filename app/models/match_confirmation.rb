class MatchConfirmation

  include Mongoid::Document
  include Mongoid::Timestamps

  field :requirements, :type => Array

  field :name, :type => String
  field :email, :type => String
  field :profile_url, :type => String

  validates :email, :presence => true
  validates :name, :presence => true

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end

end