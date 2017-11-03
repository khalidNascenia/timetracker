class Users::RegistrationsController < Devise::RegistrationsController

  layout 'time_tracker'

    protected

    def account_update_params
      params.require(:user).permit(:personal_email, :present_address, :mobile_number, :alternate_contact,
                                   :permanent_address, :date_of_birth, :last_degree, :last_university, :passing_year,
                                   :emergency_contact_person_name, :emergency_contact_person_relation,
                                   :emergency_contact_person_number, :blood_group, :joining_date)
    end

    def update_resource(resource, params)
      params[:date_of_birth] = params[:date_of_birth].to_date
      params[:joining_date] = params[:joining_date].to_date
      resource.update_without_password(params)
    end

    def after_sign_up_path_for(resource)
      after_sign_in_path_for(resource)
    end
end