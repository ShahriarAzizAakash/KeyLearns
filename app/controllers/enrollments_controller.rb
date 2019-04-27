class EnrollmentsController < ApiController
    before_action :authorize_access_request!

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
            number_of_enrollment = Enrollment.where(course_id: course_id).count        
            course.update_columns(numofenrollments: number_of_enrollment)
            render json:{ message: 'ok', enrollment: enrollment, number_of_enrollment: course.numofenrollments}
        else
            render json: {message: "You have already enrolled!"}
        end

    end

    private
        def enrollment_params
            params.require(:enrollment).permit(:course_id)
        end
    
end