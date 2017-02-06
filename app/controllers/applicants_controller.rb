class ApplicantsController < ApplicationController
  before_action :set_applicant, only: [:show, :edit, :update, :destroy]

  def search_form
    @q = Applicant.search(params[:q])
  end

  # GET /applicants
  def index
    @q = Applicant.search(params[:q])
    @applicants = @q.result
  end

  # GET /applicants/1
  def show
  end

  # GET /applicants/1/edit
  def edit
  end

  # PATCH/PUT /applicants/1
  def update
    if @applicant.update(applicant_params)
      applicant_params[:tag_ids].each do |t, i|
        next if i == 1

        ApplicantsTag.new(applicant_id: @applicant.id,
                          tag_id: t).save!
      end
      redirect_to @applicant, notice: 'Applicant was successfully updated.'
    else
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_applicant
      @applicant = Applicant.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def applicant_params
      params.require(:applicant).permit(:name, :age, tag_ids: [])
    end
end
