class UsersController < ApiController
    before_action :require_login, except: [:create]

    def create 
        user = User.create!(user_params)
        user.user_type = UserType.find(params[:user][:role])
        render json: { token: user.auth_token }
    end

    def profile
        user = User.find_by_auth_token!(request.headers[:token])
        if user.user_type: :creator
            user_courses = user.courses
            render json: {user: {username: user.username, email: user.email, name: user.name, user_type: user.user_type}, courses: user_courses}
        else
            render json: {user: {username: user.username, email: user.email, name: user.name, user_type: user.user_type}}
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :name, :email, :role)
    end
end
