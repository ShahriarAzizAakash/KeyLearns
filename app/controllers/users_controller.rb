class UsersController < ApiController

    before_action :authorize_access_request!

    def profile
        user = User.find_by(id: current_user.id)
        user_courses = user.courses
        user_enrollments = user.enrollments
        render json: {user: {username: user.username, email: user.email, name: user.name, courses: user_courses, enrollments: user_enrollments}}
    end

end
