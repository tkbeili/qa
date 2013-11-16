require 'spec_helper'

describe AnswersController do
  describe "Creating An Answer" do
    context "with valid params" do
      let(:valid_params) do
        {answer: {body: "Some valid answer"}}
      end
      before { @valid_params={first_name: "Joe", last_name: "Sample"} }

      it "should redirect to Answer Show path" do
        post :create, valid_params
        response.should redirect_to answer_path(Answer.last)
      end

      it "should increase the number of answers by 1" do
        expect {
          post :create, valid_params
        }.to change{Answer.count}.by(1)
      end
    end

    context "with invalid params" do
      let(:invalid_params) do
        { answer: {body: ""}}
      end
      it "should redirect to Answer Show path" do
        post :create, invalid_params
        response.should render_template :new
      end

      it "should increase the number of answers by 1" do
        expect {
          post :create, invalid_params
        }.to change{Answer.count}.by(0)
      end
    end

  end
end

