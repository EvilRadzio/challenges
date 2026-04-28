module Api 
    module V1
        class ChallengesController < ApplicationController
            def index
                #@challenges = Challenge.all
                render json: Challenge.all
            end

            def create
                
                challenge = Challenge.new(challenges_params)
                if challenge.save
                    render json: {status: 'Challenge created succesfully', data: challenge }    
                else
                    render json: {status: 'Failed to create Challenge  ', data: challenge.errors }    
                end
            end

            def show
                challenge = Challenge.find(params[:id])
                if challenge
                    render json: {  "Challenge found", data: challenge}
                else
                    render json: {  "challlenge not found", data: challenge.errors}
                end
            end

            def update
                challenge = Challenge.find(params[:id])
                if challenge.update(challenges_params)
                    render json: { "Challenge updated", data: challenge }
                else
                    render json: { "Challenge not updated", data: challenge.errors }
                end
            end

            def destroy
                challenge = Challenge.find(params[:id])
                if challenge.destroy()
                    render json: { "Challenge deleted", data: challenge }
                else
                    render json: { "Challenge not deleted", data: challenge.errors }
                end
            end
            
            private
            
            def challenges_params
                 params.require(:challenge).permit(:title, :description, :start_date, :end_date)
                
            end
        end
    end
end