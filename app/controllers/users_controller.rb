class UsersController < ApiController

    before_action :authorize_access_request!

    def profile
        user = User.find_by(id: current_user.id)
        user_courses = user.courses
        user_enrollments = user.enrollments
        user_image = user.image
        render json: {user: {username: user.username, email: user.email, name: user.name, image: user_image, courses: user_courses, enrollments: user_enrollments}}
    end

    def update 
        user = User.find_by(id: current_user.id)

        if user.update_attributes(user_params)
            courses = Course.where(user_id: user.id)
            courses.update_all(author: user.name)

            user_courses = user.courses

            enrollment = Enrollment.where(user_id: user.id)
            enrollment.update_all(username: user.username)
            
            user_enrollments = user.enrollments
            user_image = user.image
            render json: {message: "Profile Updated!", user: {username: user.username, email: user.email, name: user.name, image: user_image, courses: user_courses, enrollments: user_enrollments}}
        else
            render json: {message: "Couldn't Update Profile!"}, status: :unprocessable_entity
        end
    end

    private
        def user_params
        params.require(:user).permit(:email, :password, :name, :username, :image)
        end

end
