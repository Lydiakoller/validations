class Event < ActiveRecord::Base
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :organizer_name, presence: true
  validates :organizer_email, format: {with: /.+\@.+\..+/}
  validates :date, presence: true
  validate  :date_not_in_the_past



  def date_not_in_the_past
    if date < Date.today
      errors.add(:date, "must be in future")
    else
      true
    end
  end
end
   # t.string :organizer_name, :organizer_email, :title
   #    t.date :date
