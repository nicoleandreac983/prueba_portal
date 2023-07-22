class JobOffersController < ApplicationController
    before_action only: [:new, :create, :show,:applicants] do
        authorize_request([ "admin"])
    end
    before_action only: [:edit, :update, :destroy] do
        authorize_request(["admin"])
    end

    def index
        @job_offers = JobOffer.all
    end
    def apply
        @job_offer = JobOffer.find(params[:id])
        current_user.job_offers << @job_offer
        redirect_to applied_offers_job_offer_path(@job_offer), notice: '¡Has aplicado a la oferta laboral exitosamente!'
    end
    def applied_offers
        @applied_offers = current_user.job_offers
    end
    def applicants
        @job_offer = JobOffer.find(params[:id])
        @applicants = @job_offer.applicants
    end
    def show
        @job_offer = JobOffer.find(params[:id])
    end
    
    def new
        @job_offer = JobOffer.new
    end
    
    def create
        @job_offer = current_user.job_offers.build(job_offer_params)
    
        if @job_offer.save
            redirect_to @job_offer, notice: 'La oferta laboral ha sido creada con éxito.'
        else
            render :new
        end
    end
    
    def edit
        @job_offer = JobOffer.find(params[:id])
    end
    
    def update
        @job_offer = JobOffer.find(params[:id])
    
        if @job_offer.update(job_offer_params)
            redirect_to @job_offer, notice: 'La oferta laboral ha sido actualizada con éxito.'
        else
            render :edit
        end
    end
    
    def destroy
        @job_offer = JobOffer.find(params[:id])
        @job_offer.destroy
        redirect_to job_offers_path, notice: 'La oferta laboral ha sido eliminada con éxito.'
    end
    
    private
    
    def job_offer_params
        params.require(:job_offer).permit(:title, :description)
    end
end
