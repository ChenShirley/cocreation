class MentorController < ApplicationController
  before_filter :authenticate_user!

#mentor只有留言功能，無審核功能
#分兩個區域，一個是目前正在第二階段的(需要給建議的)，一個是輔導過的專案後續成果

  def index
  	#取出所有把mentor設為自己的
  	@myteamproject = Presub.includes(:projectparam).where("projectparams.mentor_id=? AND (projectparams.nowstage=? OR projectparams.nowstage=? OR projectparams.nowstage=?)",current_user.id,0,1,2).all  	
  	@trackproject = Presub.includes(:projectparam).where("projectparams.mentor_id=? AND (projectparams.nowstage=? OR projectparams.nowstage=? OR projectparams.nowstage=?)",current_user.id,3,4,-1).all
  end

  def postmessage
    Question.create(params[:message])
    redirect_to ideaindex_path(params[:message][:presub_id])
  end
end
