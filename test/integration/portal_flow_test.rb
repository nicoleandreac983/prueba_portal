require 'test_helper'

class PortalFlowTest < ActionDispatch::IntegrationTest
    def setup
        @user = users(:one) # Asegúrate de que el nombre de fixture coincida con el que tienes en tu archivo
        @job_offer = job_offers(:one) # Asegúrate de que el nombre de fixture coincida con el que tienes en tu archivo
    end
    
    test "user can apply to a job offer" do
        log_in_as(@user) # Asumiendo que tienes una función de ayuda para iniciar sesión al usuario
        visit job_offer_path(@job_offer)
        click_button "Aplicar"
    
        assert_text "¡Has aplicado a la oferta laboral exitosamente!"
        assert_difference '@job_offer.applications.count', 1 do
            click_button "Aplicar"
        end
    
        assert_text "Ya has aplicado a esta oferta laboral"
    end
end