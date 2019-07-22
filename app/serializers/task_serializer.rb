class TaskSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :goal
	belongs_to :user
end
