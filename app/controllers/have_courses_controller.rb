class HaveCoursesController < ApplicationController
  before_action :set_have_course, only: [:show, :edit, :update, :destroy]

  # GET /have_courses
  # GET /have_courses.json
  def index
    @have_courses = HaveCourse.all
  end

  # GET /have_courses/1
  # GET /have_courses/1.json
  def show
  end

  # GET /have_courses/new
  def new
    @have_course = HaveCourse.new
  end

  # GET /have_courses/1/edit
  def edit
  end

  # POST /have_courses
  # POST /have_courses.json
  def create
    @have_course = HaveCourse.new(have_course_params)

    respond_to do |format|
      if @have_course.save
        format.html { redirect_to @have_course, notice: 'Have course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @have_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @have_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /have_courses/1
  # PATCH/PUT /have_courses/1.json
  def update
    respond_to do |format|
      if @have_course.update(have_course_params)
        format.html { redirect_to @have_course, notice: 'Have course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @have_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /have_courses/1
  # DELETE /have_courses/1.json
  def destroy
    @have_course.destroy
    respond_to do |format|
      format.html { redirect_to have_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_have_course
      @have_course = HaveCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def have_course_params
      params.require(:have_course).permit(:course_number, :course_name, :course_section, :trade_id)
    end
end
