require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe WantCoursesController do

  # This should return the minimal set of attributes required to create a valid
  # WantCourse. As you add validations to WantCourse, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "course_number" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # WantCoursesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all want_courses as @want_courses" do
      want_course = WantCourse.create! valid_attributes
      get :index, {}, valid_session
      assigns(:want_courses).should eq([want_course])
    end
  end

  describe "GET show" do
    it "assigns the requested want_course as @want_course" do
      want_course = WantCourse.create! valid_attributes
      get :show, {:id => want_course.to_param}, valid_session
      assigns(:want_course).should eq(want_course)
    end
  end

  describe "GET new" do
    it "assigns a new want_course as @want_course" do
      get :new, {}, valid_session
      assigns(:want_course).should be_a_new(WantCourse)
    end
  end

  describe "GET edit" do
    it "assigns the requested want_course as @want_course" do
      want_course = WantCourse.create! valid_attributes
      get :edit, {:id => want_course.to_param}, valid_session
      assigns(:want_course).should eq(want_course)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new WantCourse" do
        expect {
          post :create, {:want_course => valid_attributes}, valid_session
        }.to change(WantCourse, :count).by(1)
      end

      it "assigns a newly created want_course as @want_course" do
        post :create, {:want_course => valid_attributes}, valid_session
        assigns(:want_course).should be_a(WantCourse)
        assigns(:want_course).should be_persisted
      end

      it "redirects to the created want_course" do
        post :create, {:want_course => valid_attributes}, valid_session
        response.should redirect_to(WantCourse.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved want_course as @want_course" do
        # Trigger the behavior that occurs when invalid params are submitted
        WantCourse.any_instance.stub(:save).and_return(false)
        post :create, {:want_course => { "course_number" => "invalid value" }}, valid_session
        assigns(:want_course).should be_a_new(WantCourse)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        WantCourse.any_instance.stub(:save).and_return(false)
        post :create, {:want_course => { "course_number" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested want_course" do
        want_course = WantCourse.create! valid_attributes
        # Assuming there are no other want_courses in the database, this
        # specifies that the WantCourse created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        WantCourse.any_instance.should_receive(:update).with({ "course_number" => "MyString" })
        put :update, {:id => want_course.to_param, :want_course => { "course_number" => "MyString" }}, valid_session
      end

      it "assigns the requested want_course as @want_course" do
        want_course = WantCourse.create! valid_attributes
        put :update, {:id => want_course.to_param, :want_course => valid_attributes}, valid_session
        assigns(:want_course).should eq(want_course)
      end

      it "redirects to the want_course" do
        want_course = WantCourse.create! valid_attributes
        put :update, {:id => want_course.to_param, :want_course => valid_attributes}, valid_session
        response.should redirect_to(want_course)
      end
    end

    describe "with invalid params" do
      it "assigns the want_course as @want_course" do
        want_course = WantCourse.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WantCourse.any_instance.stub(:save).and_return(false)
        put :update, {:id => want_course.to_param, :want_course => { "course_number" => "invalid value" }}, valid_session
        assigns(:want_course).should eq(want_course)
      end

      it "re-renders the 'edit' template" do
        want_course = WantCourse.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        WantCourse.any_instance.stub(:save).and_return(false)
        put :update, {:id => want_course.to_param, :want_course => { "course_number" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested want_course" do
      want_course = WantCourse.create! valid_attributes
      expect {
        delete :destroy, {:id => want_course.to_param}, valid_session
      }.to change(WantCourse, :count).by(-1)
    end

    it "redirects to the want_courses list" do
      want_course = WantCourse.create! valid_attributes
      delete :destroy, {:id => want_course.to_param}, valid_session
      response.should redirect_to(want_courses_url)
    end
  end

end
