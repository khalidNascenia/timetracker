class HolidayScheme < ActiveRecord::Base
  has_many :exclusion_dates, as: :excluded, dependent: :destroy
  has_many :holidays, dependent: :destroy
  has_many :users

  belongs_to :leave_year

  def self.today?(user)
    user.holiday_scheme.holidays.include? Date.today if user.holiday_scheme
  end

  def self.excluded?(user)
    user.holiday_scheme.exclusion_dates.include? Date.today if user.holiday_scheme
  end
end
