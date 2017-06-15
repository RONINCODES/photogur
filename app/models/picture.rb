class Picture < ApplicationRecord

  validates :artist, presence: true
  validates :title, presence: true
  validates :url, presence: true
  validates :url, uniqueness: true
  validates :url, format: {with: /https?:\/\/[\S]+/} 


  def self.created_before(time)
    Picture.where("created_at < ?", time)
  end

  def self.pictures_created_in_year(year)
    year_start = DateTime.new(year)
    year_end = DateTime.new(year).end_of_year
    Picture.where("created_at BETWEEN ? AND ?", year_start, year_end)
  end
end
