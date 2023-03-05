module Users
  class UpdateService
    attr_reader :params, :user

    def initialize(user, params)
      @user = user
      @params = params
    end

    def call
      update_user

      user
    end

    def update_user
      user.name = params[:name] if params.key?(:name)
      user.email = params[:email] if params.key?(:email)
      user.address = params[:address] if params.key?(:address)
      user.tel = params[:tel] if params.key?(:tel)
      user.age = params[:age] if params.key?(:age)
      
      user.save
    end
  end
end