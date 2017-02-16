class StoryTag < ApplicationRecord
  belongs_to :story
  belongs_to :tag
end
