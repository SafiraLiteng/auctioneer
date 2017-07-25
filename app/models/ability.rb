
class Ability
	include CanCan::Ability

	def initialize(user)
		user ||= User.new

		alias_action :create, :read, :update, :destroy, to: :crud

		if user.is_admin?
			can :manage, :all
		end
		
		can :crud, Item do |item|
			item.user == user
		end

		can :like, Item do |item|
			item.user != user
		end

		cannot :like, Item do |item|
			item.user == user
		end
	end
end
