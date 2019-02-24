class UsersController < ApiController
    before_action :require_login, except: [:create]

    def create 
        user = User.create!(user_params)
        render json: { token: user.auth_token }
    end

    def profile
        user = User.find_by_auth_token!(request.headers[:token])
        user_courses = user.courses
        user_enrollments = user.enrollments
        render json: {user: {username: user.username, email: user.email, name: user.name}, courses: user_courses, enrollments: user_enrollments}
    end

    private
    def user_params
        params.require(:user).permit(:username, :password, :name, :email)
    end
end
