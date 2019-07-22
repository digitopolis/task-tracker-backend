class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :username
	has_many :tasks
end
