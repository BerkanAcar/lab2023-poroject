class Tweet < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :users
	validates :text, presence: true,
                    length: { maximum: 140 }
end
