class UserLocationController < ApplicationController
  def update
    @nameDisplay = params[:name]
    @longDisplay = params[:long]
    @latDisplay = params[:lat]
    @recordCreate = CurrentUsersLocation.create(:name => @nameDisplay,
                                                :long => @longDisplay,
                                                :lat  => @latDisplay
    )
    @successOrNot = @recordCreate.save
  end
end
