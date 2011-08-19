module BlogEngine
  class Authors::RegistrationsController < Devise::RegistrationsController
    before_filter :authenticate_author!, :only => [:new, :edit, :update]
  end
end
