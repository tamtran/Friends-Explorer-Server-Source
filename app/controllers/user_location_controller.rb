class UserLocationController < ApplicationController
  def update
    @nameDisplay = params[:name]
    @longDisplay = params[:long]
    @latDisplay = params[:lat]
    @recordChecking = CurrentUsersLocation.find_or_create_by_name(:name => @nameDisplay)
    @recordChecking.long = @longDisplay
    @recordChecking.lat = @latDisplay
    @successOrNot = @recordChecking.save

    @allLocation = CurrentUsersLocation.find(:all, :conditions => ["name NOT IN (?)", [@nameDisplay]])
    render :action => "update"
  end
end
