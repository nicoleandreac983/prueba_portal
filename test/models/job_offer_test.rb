require "test_helper"

class JobOfferTest < ActiveSupport::TestCase
    test "user can apply to a job offer" do
        disable_referential_integrity do
            # Simulate a logged-in user (you may need to set up authentication)
            sign_in_as(user)
        
            # Visit the job offer page
            get job_offer_path(@job_offer_one)
        
            # Check that the page is rendered successfully
            assert_response :success
        
            # Apply to the job offer
            post job_applications_path(job_offer_id: @job_offer_one.id)
        
            # Check that a new application was created
            assert_difference 'JobApplication.count', 1 do
                post job_applications_path(job_offer_id: @job_offer_one.id)
            end
        
            # Check that the user is redirected to the applications index page
            assert_redirected_to job_applications_path
        end
    end
end
