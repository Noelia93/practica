class SubjectsController < ApplicationController

  def create
    @subject = Subject.new(subject_params)
  end

  private

  def subject_params
    params.require(:subject).permit(:name)
  end

end