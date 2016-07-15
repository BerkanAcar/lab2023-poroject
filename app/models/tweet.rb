class Tweet < ActiveRecord::Base
	validates :text, presence: true,
                    length: { maximum: 140 }
end
