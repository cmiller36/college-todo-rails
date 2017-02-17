class College < ApplicationRecord
  belongs_to :user

  validates_presence_of :name
  validate :college_visit_cannot_be_in_the_past

  extend FriendlyId
  friendly_id :name, use: :slugged

  def self.pop_colleges
    College.group(:name).order('count_id DESC').limit(5).count(:id)
  end

  def college_visit_cannot_be_in_the_past
    if college_visit.present? && college_visit < Date.today
      errors.add(:college_visit, "can not be in the past, please choose a future date!")
    end
  end    
  

end
