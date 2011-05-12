class AlertController < ApplicationController
  def receive
    @alertRecord = Alert.create(:name => params[:name],
                                :long => params[:long],
                                :lat => params[:lat])
    @alertRecord.type = params[:type]
    @alertRecord.save
  end

end
