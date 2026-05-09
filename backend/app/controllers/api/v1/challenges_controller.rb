module Api 
    module V1
        class ChallengesController < ApplicationController
            before_action :authenticate_user!, only: %i[create update destroy]
            before_action :set_challenge, only: %i[show update destroy]
            before_action :authorize_admin, only: %i[create update destroy]

            def index
                @challenges = Challenge.all
                render json: Challenge.all
            end

            def create
                
                @challenge = Challenge.new(challenges_params.merge(user_id: current_user.id))
                if @challenge.save
                    render json: {status: 'Challenge created succesfully', data: @challenge }    
                else
                    render json: {status: 'Failed to create Challenge  ', data: @challenge.errors }    
                end
            end

            def show
                #@challenge = Challenge.find(params[:id])
                if @challenge
                    render json: {status:  'Challenge found', data: @challenge}
                else
                    render json: {status:  'challlenge not found', data: @challenge.errors}
                end
            end

            def update
                #@challenge = Challenge.find(params[:id])
                if @challenge.update(challenges_params)
                    render json: {status: 'Challenge updated', data: @challenge }
                else
                    render json: {status: 'Challenge not updated', data: @challenge.errors }
                end
            end

            def destroy
                #@challenge = Challenge.find(params[:id])
                if @challenge.destroy()
                    render json: {status: 'Challenge deleted', data: @challenge }
                else
                    render json: {status: 'Challenge not deleted', data: @challenge.errors }
                end
            end
            
            private
            def authorize_admin 
                render json: {  status: 'Unauthorised user action'  } unless current_user.email == ENV['ADMIN_EMAIL']
            end

            def challenges_params
                 params.require(:challenge).permit(:title, :description, :start_date, :end_date)
                 
                
            end
        end
    end
end