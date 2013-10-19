class WantCoursesController < ApplicationController
  before_action :set_want_course, only: [:show, :edit, :update, :destroy]

  # GET /want_courses
  # GET /want_courses.json
  def index
    @want_courses = WantCourse.all
  end

  # GET /want_courses/1
  # GET /want_courses/1.json
  def show
  end

  # GET /want_courses/new
  def new
    @want_course = WantCourse.new
  end

  # GET /want_courses/1/edit
  def edit
  end

  # POST /want_courses
  # POST /want_courses.json
  def create
    @want_course = WantCourse.new(want_course_params)

    respond_to do |format|
      if @want_course.save
        format.html { redirect_to @want_course, notice: 'Want course was successfully created.' }
        format.json { render action: 'show', status: :created, location: @want_course }
      else
        format.html { render action: 'new' }
        format.json { render json: @want_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /want_courses/1
  # PATCH/PUT /want_courses/1.json
  def update
    respond_to do |format|
      if @want_course.update(want_course_params)
        format.html { redirect_to @want_course, notice: 'Want course was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @want_course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /want_courses/1
  # DELETE /want_courses/1.json
  def destroy
    @want_course.destroy
    respond_to do |format|
      format.html { redirect_to want_courses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_want_course
      @want_course = WantCourse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def want_course_params
      params.require(:want_course).permit(:course_number, :course_name, :course_section, :trade_id)
    end
end
