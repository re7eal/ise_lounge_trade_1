class WantCoursesController < ApplicationController
  respond_to :json

  def index
    respond_with WantCourse.all
  end
 
  def show
    respond_with WantCourse.find(params[:id])
  end
 
  def create
    @want_course = WantCourse.new(want_course_params)
    @want_course.trade_id = $trade_id
    if @want_course.save
      respond_with @want_course
    else
      respond_with json: @want_course.errors, status: :unprocessable_entity
    end
  end
 
  def update
    respond_with WantCourse.update(params[:id], params[:want_course])
  end
 
  def destroy
    respond_with WantCourse.destroy(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def want_course_params
      params.require(:want_course).permit(:course_number, :course_name, :course_section)
    end

end
