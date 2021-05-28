class ExpendituresController < ApplicationController
  before_action :set_expenditure, only: %i[ show edit update destroy ]
  before_action :authenticate

  # GET /expenditures or /expenditures.json
  def index
    @expenditures =  if params[:ungrouped]
                        current_user.ungrouped_expenditures_from_user(current_user.id)
                      else
                        current_user.expenditures.all
                      end
  end

  # GET /expenditures/1 or /expenditures/1.json
  def show
    @expenditure = Expenditure.find(params[:id])
    @groups = @expenditure.group.nil? ? nil : @expenditure.group 
  end

  # GET /expenditures/new
  def new
    @expenditure = Expenditure.new
    @groups = Group.all
    @groups_array = create_groups_array
    @expenditures_created = expenditures_created
  end

  # GET /expenditures/1/edit
  def edit
  end

  # POST /expenditures or /expenditures.json
  def create
    @expenditure = Expenditure.new(expenditure_params)
    @expenditure.author_id = current_user.id

    respond_to do |format|
      if @expenditure.save
        format.html { redirect_to @expenditure, notice: "Expenditure was successfully created." }
        format.json { render :show, status: :created, location: @expenditure }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /expenditures/1 or /expenditures/1.json
  def update
    respond_to do |format|
      if @expenditure.update(expenditure_params)
        format.html { redirect_to @expenditure, notice: "Expenditure was successfully updated." }
        format.json { render :show, status: :ok, location: @expenditure }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @expenditure.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /expenditures/1 or /expenditures/1.json
  def destroy
    @expenditure.destroy
    respond_to do |format|
      format.html { redirect_to expenditures_url, notice: "Expenditure was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # This checks if a user is logged in
    def authenticate
      return if logged_in?

      flash[:alert] = 'To continue, please Sign In or Sign Up if you don\'t have an account '
      redirect_to '/login'
    end

    def expenditures_created
      Expenditure.ascending.pluck(:name)
    end
  
    def create_groups_array
      arr = Group.all.pluck(:name, :id)
      arr.insert(0, ['No group', nil])
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_expenditure
      @expenditure = Expenditure.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def expenditure_params
      params.require(:expenditure).permit(:name, :author_id, :group_id, :amount)
    end
end
