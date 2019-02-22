class CoursesController < ApiController
    before_action :require_login, except: [:index, :show]

    def index 
        courses = Course.all 
        author = User.find_by(params[:user_id])
        render json: {courses: courses}
    end

    def show 
        course = Course.find(params[:id])
        author = Course.find_by(params[:author])
        render json: {course: course}
    end

    def create 
        course = Course.new(course_params)
        course.user = current_user
        course.author = current_user.name

        if course.save 
            render json:{ message: 'ok', course: course}
        else
            render json: {message: "Could not create Course!"}
        end
    end

    private
    def course_params
        params.require(:course).permit(:title, :description, :price)
    end
end
