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
    render :action => "get"
  end

end
