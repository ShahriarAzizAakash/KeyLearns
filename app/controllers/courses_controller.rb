class CoursesController < ApiController
    before_action :authorize_access_request!, except: [:index, :show, :search, :top]

    def search
        courses = Course.where(["LOWER(title) LIKE ?","%#{params[:search].downcase}%"]).order('created_at DESC')
        render json: {number_of_search_results: courses.count, courses: courses}
    end

    def index 
        courses = Course.order('created_at DESC') 
        render json: {courses: courses}
    end

    def show 
        course = Course.find(params[:id])
        course_id = course.id
        course_content = Content.where(course_id: course_id)
        author = Course.find_by(params[:author])
        course_enrollments = course.enrollments
        render json: {course: course,course_content: course_content, enrollments: course_enrollments}
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

    def top
        top_courses = Course.order("numofenrollments DESC").limit(10)
        
        render json: {top_courses: top_courses}
    end

    def update 
        course = Course.find(params[:id])
        if current_user == course.user
            if course.update_attributes(course_params)
                render json: {message: "updated", course: course}
            else
                render json: {message: "Could not update course!"}, status: :unprocessable_entity
            end
        else 
            render json: {message: "You aren't allowed to update this course!"}, status: :unauthorized
        end
    end

    private
        def course_params
            params.require(:course).permit(:title, :description, :price)
        end
end
