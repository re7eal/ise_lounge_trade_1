class Trade < ActiveRecord::Base
  has_many :have_courses, dependent: :destroy
  has_many :want_courses, dependent: :destroy
  has_many :trade_messages, dependent: :destroy
  belongs_to :user

  def self.search_by_note(search)
    if search
      where('note LIKE lower(?)', "%#{search.downcase}%")
    else
      all
    end
  end

  def self.search_by_have_courses(search)
    if search
      joins(:have_courses).where('course_number LIKE lower(?) OR course_name LIKE lower(?)', "%#{search.downcase}%", "%#{search.downcase}%")
    else
      all
    end
  end

  def self.search_by_want_courses(search)
    if search
      joins(:want_courses).where('course_number LIKE lower(?) OR course_name LIKE lower(?)', "%#{search.downcase}%", "%#{search.downcase}%")
    else
      all
    end
  end

end
