class CoursesController < ApiController
    before_action :require_login, except: [:index, :show]

    def index 
        courses = Course.all 
        render json: {courses: courses}
    end

    def show 
        course = Course.find(params[:id])
        render json: {course: course}
    end

    def create 
        if user.user_type :creator
            course = Course.new(course_params)
            course.user = current_user

            if course.save 
                render json:{ message: 'ok', course: course}
            else
                render json: {message: "Could not create Course!"}
            end
        else 
            render json: {message: "Course creation is only for creators"}
        end
    end

    private
    def course_params
        params.require(:course).permit(:title, :description, :price)
    end
end
