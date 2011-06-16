# encoding: utf-8

class Service < ActiveRecord::Base
  belongs_to :category
  
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
  
    def ensure_not_referenced_by_any_line_item
      if line_items.count.zero?
        return true
      else
        errors.add(:base, 'Услуга находится в одном из нарядов и не может быть удалена.')
        return false
      end
    end
end
