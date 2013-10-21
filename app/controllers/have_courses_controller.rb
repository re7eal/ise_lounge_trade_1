class HaveCoursesController < ApplicationController
  respond_to :json

  def index
    respond_with HaveCourse.all
  end
 
  def show
    respond_with HaveCourse.find(params[:id])
  end
 
  def create
    @have_course = HaveCourse.new(have_course_params)
    @have_course.trade_id = $trade_id
    if @have_course.save
      respond_with @have_course
    else
      respond_with json: @have_course.errors, status: :unprocessable_entity
    end
  end
 
  def update
    respond_with HaveCourse.update(params[:id], params[:have_course])
  end
 
  def destroy
    respond_with HaveCourse.destroy(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def have_course_params
      params.require(:have_course).permit(:course_number, :course_name, :course_section)
    end

end
