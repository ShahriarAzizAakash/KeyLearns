class EnrollmentsController < ApiController
    before_action :require_login

    #Don't need to index all enrollments right now. this is for admin accounts only.
    #def index 
       # enrollments = Enrollment.all 
       # render json: {enrollments: enrollments}
    #end

    def show 
        enrollment = Enrollment.find(params[:id])
        render json: {enrollment: enrollment}
    end

    def create 
        enrollment = Enrollment.new(enrollment_params)
        course_id = enrollment.course_id
        course = Course.find(course_id)
        user = current_user
        enrollment.course_title = course.title 
        enrollment.username = user.username
        enrollment.user_id = user.id


        if enrollment.save 
            render json:{ message: 'ok', enrollment: enrollment}
        else
            render json: {message: "You have already enrolled!"}
        end

    end

    private
    def enrollment_params
        params.require(:enrollment).permit(:course_id)
    end
    
end