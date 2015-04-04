class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :milkpunches

  def last_left
    last_of_kind('left')
  end

  def last_right
    last_of_kind('right')
  end

  def last_bottle
    last_of_kind('bottle')
  end

  def last_meds
    last_of_kind('meds')
  end

  def last_of_kind(kind)
    milkpunches.where(boob: kind).last
  end

  def punches_today_hash
    grouped_punches = {}
    punches = milkpunches.where(['? < milkpunch AND milkpunch < ?', today_beginning, today_end]).group_by{ |p| p.milkpunch.hour }
    punches.keys.each do |key|
      grouped_punches[key] = punches[key].group_by(&:boob)
    end
    grouped_punches
  end

  def punches_today
    milkpunches.where(['? < milkpunch AND milkpunch < ?', today_beginning, today_end]).group_by(&:boob)
  end

  def today_beginning
    Time.now.in_time_zone(time_zone).to_date.beginning_of_day
  end

  def today_end
    Time.now.in_time_zone(time_zone).to_date.end_of_day
  end
end
