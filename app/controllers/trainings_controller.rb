class TrainingsController < ApplicationController
    def index
        @results = []
        trainings = Training.all
        trainings.each do |training|
            professor = User.find_by_id(training.user_id)
            @results.push(
                {
                    id: training.id,
                    name: training.name,
                    description: training.activity,
                    day: training.date.day(),
                    month: training.date.month(),
                    year: training.date.year(),
                    hour: training.date.hour(),
                    minutes: training.date.min(),
                    teacher_name: professor.name
                }
            )
        end
        render json: 
        @results,
        status: :ok
    end

    # calendar/id
    def show
        t = Training.find_by_id(params[:id])
        if t
            professor = User.find_by_id(t.user_id)
            render json:
            {
                status: "OK",
                message: "Evento encontrado com sucesso",
                dados: {
                    id: t.id,
                    name: t.name,
                    description: t.activity,
                    day: t.date.day(),
                    month: t.date.month(),
                    year: t.date.year(),
                    hour: t.date.hour(),
                    minutes: t.date.min(),
                    teacher_name: professor.name
                }
            },
            status: :ok
        
        else
            render json:{
                status: "ERROR",
                message: "Não foi possível encontrar o evento.",
                id: params[:id]
            },
            status:  :unprocessable_entity
        end
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

    #delete /excluitreino
    def destroy
       @training.destroy
    end        
    
    private
    # Use callbacks to share common setup or constraints between actions.
    def set_training
      @training = Training.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def training_params
      params.require(:training).permit(:day, :month, :year, :hour, :minutes, :description,
        :user_id)
    end

end
