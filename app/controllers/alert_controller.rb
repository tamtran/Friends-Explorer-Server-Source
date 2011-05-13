class AlertController < ApplicationController
  def receive
    @alertRecord = Alert.create(:name => params[:name],
                                :long => params[:long],
                                :lat => params[:lat],
                                :alert_type => params[:type])   
    @alertRecord.save
  end
  def get
    @alertSetRecords = Alert.find(:all, :conditions => ["name NOT IN (?)", [params[:name]]])    
    render :inline => "<% for alertRecord in @alertSetRecords%><item><Type><%= alertRecord.alert_type %></Type><Long><%= alertRecord.long %></Long><Lat><%= alertRecord.lat %></Lat></item><% end %>"
  end

end
