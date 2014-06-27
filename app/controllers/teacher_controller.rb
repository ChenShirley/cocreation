class TeacherController < ApplicationController
  before_filter :authenticate_user!

  def index
  	#取出所有把keeper1設為自己的
  	#尚未審核的(keeper1要審核)
  	#@allpresub = Presub.where(:confirm=>nil).all
  	@allpresub = Presub.joins(:projectparam).where("projectparams.keeper1_id=? AND projectparams.nowstage=?",current_user.id,0).all
  	
  	#取出所有把keeper2設為自己的
  	#尚未審核的(keeper2要審核)，還在第二階段
  	#@allreadytoon = Presub.where("confirm='t' AND (teacheron=? OR teacheron IS NULL)",false).all
  	@allreadytoon = Presub.includes(:projectparam).where("projectparams.keeper2_id=? AND projectparams.nowstage=? ",current_user.id,2).all
  	
  	#取出所有把keeper設為自己的專案的後續
  	@trackproject = Presub.includes(:projectparam).where("(projectparams.keeper1_id=? OR projectparams.keeper2_id=?) AND projectparams.nowstage!=?",current_user.id,current_user.id,-2).all
  end

=begin
  def editpresub #keeper1審核草案
    @presub = Presub.includes(:projectparam).find(params[:id])
		@files = Upfile.where("id=? AND currentuse=?",@presub.upfile_id,true)
		@feedback = Feedback.order("money ASC").where(:presub_id=>@presub.id).all
  end

  def updatepresub #keeper1審核草案的submit動作
    @confirm = Presub.find(params[:id])
    @confirm.update_attributes!(params[:confirm])
    if @confirm.confirm
    	#keeper1審核通過就進入第一階段，並寄信通知使用者
	    @confirm.projectparam.update_attributes!(:nowstage=>1)
      Usernotice.sendemail(User.find(@confirm.user_id).email,'co-creation 專案通知','你的專案：'+@confirm.name+' 已經通過審核，進入創意發想階段囉！您可利用此網址回到Cocreation平台檢視專案：http://cocreation.ctm.nthu.edu.tw/startaproject/myindex').deliver
    else
			#keeper1審核未通過就紀錄原因並寄信通知
      Usernotice.sendemail(User.find(@confirm.user_id).email,'co-creation 專案通知','你的專案：'+@confirm.name+' 未通過第一階段審核，請檢視未通過原因，並重新發起你的創意發想。您可利用此網址回到Cocreation平台檢視專案：http://cocreation.ctm.nthu.edu.tw/startaproject/myindex').deliver
      #儲存不通過的原因     
			@why = Reason.find_by_presub_id(params[:id])
	    @why.update_attributes!(params[:whynot])
	    @confirm.projectparam.update_attributes!(:nowstage=>-1)
    end
		redirect_to teacher_index_path
  end

  def edit #keeper2審核
    @presub = Presub.includes(:projectparam).find(params[:id])
		@files = Upfile.where("id=? AND currentuse=?",@presub.upfile_id,true)
		@feedback = Feedback.order("money ASC").where(:presub_id=>@presub.id).all
  end

  def update #keeper2審核的submit動作
    @confirm = Presub.includes(:projectparam).includes(:pro).find(params[:id])
    @confirm.update_attributes!(params[:confirm])
    if @confirm.teacheron
    	#keeper2審核通過就進入第三階段，並寄信通知使用者
	    @confirm.projectparam.update_attributes!(:nowstage=>3)
      @confirm.pro.update_attributes!(:resultletter=>false, :got=>0, :classify=>@confirm.classify, :teacheron=>true, :user_id=>@confirm.user_id, :start=>Time.now)
      Usernotice.sendemail(User.find(@confirm.user_id).email,'co-creation 專案通知','你的專案：'+@confirm.name+' 已經審核通過進入正式募資階段了，快去找尋投資者來贊助你的專案吧！您可利用此網址回到Cocreation平台檢視專案：http://cocreation.ctm.nthu.edu.tw/startaproject/myindex').deliver
    else
			#keeper2審核未通過就紀錄原因並寄信通知
      Usernotice.sendemail(User.find(@confirm.user_id).email,'co-creation 專案通知','你的專案：'+@confirm.name+' 未能通過審核，請與指導者討論並重新修改專案內容，並請記得送出給審核者審核。您可利用此網址回到Cocreation平台檢視專案：http://cocreation.ctm.nthu.edu.tw/startaproject/myindex').deliver
      #儲存不通過的原因
			@why = Reason.find_by_presub_id(params[:id])
	    @why.update_attributes!(params[:whynot])
    end
		redirect_to teacher_index_path
	end

=end
end
