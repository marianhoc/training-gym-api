class TrainingsController < ApplicationController
    def index
        @results = []
        trainings = Training.all
        trainings.each do |training|
            professor = User.where(id: training.user_id)
            puts professor
            @results.push(
                {
                name: training.name,
                description: training.activity,
                day: training.date.day(),
                month: training.date.month(),
                year: training.date.year(),
                hour: training.date.hour(),
                minutes: training.date.min(),
                teacher_name: professor
            }
            )
        end
        render json: 
        {
            status: "OK",
            message: "Arquivos carregados com sucesso",
            treinos: @results
        },
        status: :ok
    end

    #post /criatreino
    def create
        @treino = Training.new
        @treino.name = params[:name]
        @treino.activity = params[:description]
        @treino.date = DateTime.new(params[:year], params[:month], params[:day],
            params[:hour], params[:minutes])
        if User.where(id: params[:user_id])
            @treino.user_id = params[:user_id]
        else
            render json: {
                status: "ERROR",
                message: "Não foi possível encontrar o professor associado",
                dados: @treino
            },
            status: :unprocessable_entity
        end
            
        if @treino.save
            @professor = User.where(id: @treino.user_id)
            render json:
                {
                    message: "Aula cadastrada com sucesso.",
                    name: @treino.name,
                    description: @treino.activity,
                    date: @treino.date,
                    professor: @professor.name
                },
                status: :ok
        end

    end

        
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:day, :month, :year, :hour, :minutes, :description)
    end

end
