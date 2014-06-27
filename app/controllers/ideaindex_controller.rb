class IdeaindexController < ApplicationController
  def index	#目前是第一階段的專案顯示的地方，任何人都看得到 不確定9 10 11是作什麼用的
    @allidea = Presub.includes(:projectparam).where("projectparams.nowstage='1'")

    page = params[:page]
    @allidea = Presub.includes(:projectparam).where("projectparams.nowstage='1'")
    if page == '1'
      @allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='1'")
    elsif page == '2'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='2'")
    elsif page == '3'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='3'")
    elsif page == '4'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='4'")
    elsif page == '5'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='5'")
    elsif page == '6'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='6'")
    elsif page == '7'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='7'")
    elsif page == '8'
			@allidea = Presub.includes(:projectparam).where("(projectparams.nowstage='1') AND presubs.classify='8'")
    end
  end

	def show
		@thisp = Presub.find(params[:id])
		@thisp_feedback = Feedback.order("money ASC").where(:presub_id=>@thisp.id).all
	  @message = 	Questionforidea.where(:presub_id=>params[:id])
		@voteresult = Vote.where(:presub_id=>params[:id])
		@allpeople = @voteresult.count
		@market_avg = @voteresult.average( :marketability)
		@feasible_avg = @voteresult.average( :feasibility)
		@innovativa_avg = @voteresult.average( :innovative)
		@event = Questionforidea.new
		@answer = Answerforidea.new
		@vote = Vote.new

		@files = Upfile.where("id=? AND currentuse=? AND usage=?",@thisp.upfile_id,true,'summary')
		@pics = Upfile.where("id=? AND currentuse=? AND usage=?",@thisp.pic,true,'pic')
	end

  def create
    @event = Questionforidea.create(params[:questionforidea])
		@event.save
    redirect_to ideaindex_path(params[:questionforidea][:presub_id])
  end

  def updateanswer
    @answer = Answerforidea.includes(:questionforidea).create(params[:answerforidea])
		@answer.save
    redirect_to ideaindex_path(@answer.questionforidea.presub_id)
  end

  def votecreate
    @vote = Vote.create(params[:vote])
		@vote.save
    redirect_to ideaindex_path(@vote.presub_id)
  end
end
