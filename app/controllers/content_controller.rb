class ContentController < ApiController
    before_action :authorize_access_request!

    def create 
        course_content = Content.new(content_params)                 
        course = Course.find(course_content.course_id)
        
        if course.user == current_user
            if course_content.save
                render json:{ message: 'ok', course_content: course_content}, status: :ok
            else
                render json: {message: "Could not upload!"}, status: :unprocessable_entity
            end
        else
            render json:{message: "You don't have permission to edit this course!"}, status: :unauthorized
        end
    end

    private
        def content_params
            params.require(:content).permit(:course_id, attachments: [])
        end
end