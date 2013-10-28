class CalculationRequest < ActiveRecord::Base
  validates :package, presence: true
  validates :function, presence: true
  validates :data, presence: true, json: true
end
