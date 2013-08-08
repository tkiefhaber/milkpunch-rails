class Milkpunch < ActiveRecord::Base
  before_validation :set_milkpunch, :on => :create
  belongs_to :user

  def set_milkpunch
    self.milkpunch = Time.zone.now
  end
end
