class InvestController < ApplicationController
  before_filter :authenticate_user!
  def edit
    @thisp = Pro.find(params[:id])
    @pro_id = params[:id].to_i
    @feedback = Feedback.find(params[:feedback])
  end

  def update
		@invest = Investment.create(params[:invest])
		@thisp = Pro.find(params[:id])
		@allinvest = Investment.where(:pro_id=>params[:id], :user_id=>current_user.id, :id=>params[:invest][:id])
		if @invest.save 
		#寄信給贊助者
    Usernotice.sendemail(@invest.user.email,'co-creation 專案通知','您贊助了【'+@thisp.presub.name+'】，提醒您於三日內匯款，匯款完畢後請儘速填寫匯款完成通知（匯款資訊  戶名：林福仁 ， 銀行：玉山銀行新竹分行（代碼為808） ， 帳戶：0060-968-405296）。您可利用此網址回到Cocreation平台完成後續動作：http://cocreation.ctm.nthu.edu.tw/startaproject/newindex').deliver

		#寄信給提案者說明有誰投資
    #Usernotice.sendemail(@thisp.user.email,'Someone want to invest your idea!', User.find(params[:invest][:user_id].to_i).email+' want to support your project:'+@thisp.presub.name+'with'+params[:invest][:howmuch]+'NTD').deliver
    redirect_to reflashindex_path(@thisp.id)
		end
  end
end
