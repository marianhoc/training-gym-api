class TrainingsController < ApplicationController
    def show
        @results = []
        trainings = Training.all
        trainings.each do |training|
            professor = User.where_id(training.user_id)
            @results.push({date: training.date, time: training.time, name: training.name,
                teacher: professor.name})
        end
        render json: @results, status: :ok
    end

    def create
        
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:date, :month, :year, :hour, :minutes, :description)
    end

end
