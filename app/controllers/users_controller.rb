class UsersController < ApplicationController
    # GET /users
    def index
        @users = User.all

        usuarios = []

        @users.each do |user|
          usuarios.push({
            name: user.name,
            email: user.email
					})
				end
    end

    # GET /users/1
    def show
        render json: {
          name: @user.name,
					email: @user.email
        },
        status: :ok
		end
		
		 # POST /users
		def create
			@user = User.new(user_params)

			if @user.save
				render json: {
					name: @user.name,
					auth_token: @user.authentication_token,
					email: @user.email
				},
				status: :created
			else
				render json: @user.errors, status: :unprocessable_entity
			end
		
		end

		# PATCH/PUT /users/1
		def update
			if @user.update(user_params)
				render json: @user
			else
				render json: @user.errors, status: :unprocessable_entity
			end
		end

		# DELETE /users/1
		def destroy
			@user.destroy
		end

		private 

		 	# Use callbacks to share common setup or constraints between actions.
		 	def set_user
				@user = User.find(params[:id])
			end

			# Only allow a trusted parameter "white list" through.
			def user_params
				params.permit(:name, :email, :password, :password_confirmation, :age, :score)
			end

end
