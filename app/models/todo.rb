class Todo < ActiveRecord::Base
  attr_accessible :is_completed, :title
end
