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
    render :inline => "<?xml version='1.0' encoding='ISO-8859-1'?>
          <Location>
            <% for location in @allLocation%>
             <item>
              <Name><%= location.name %> </Name>
              <Long><%= location.long %> </Long>
              <Lat><%= location.lat %> </Lat>
             </item>
          <% end %>
          </Location>"
  end
end
