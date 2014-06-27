class ReflashindexController < ApplicationController
  def index	#已經審核過顯示的地方，不須用nowstage控制，因為keeper通過才會create Pro
    #@allproject = Pro.where(:teacheron=>true)
		@allproject = Presub.includes(:pro).includes(:projectparam).where("projectparams.nowstage>='3'")

    page = params[:page]
    @allproject = Presub.includes(:pro).includes(:projectparam).where("projectparams.nowstage>='3'")
    if page == '1'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='1' AND projectparams.nowstage='3'")
    elsif page == '2' 
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='2' AND projectparams.nowstage='3'")
    elsif page == '3'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='3' AND projectparams.nowstage='3'")
    elsif page == '4'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='4' AND projectparams.nowstage='3'")
    elsif page == '5'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='5' AND projectparams.nowstage='3'")
    elsif page == '6'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='6' AND projectparams.nowstage='3'")
    elsif page == '7'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='7' AND projectparams.nowstage='3'")
    elsif page == '8'
      @allproject = Presub.includes(:pro).includes(:projectparam).where("presubs.classify='8' AND projectparams.nowstage='3'")
    elsif page == '9' #正在進行 需要重寫條件
      @allproject = Presub.includes(:pro).includes(:projectparam).where("projectparams.nowstage='3'")
    elsif page == '10'	#成功募集
      @allproject = Presub.includes(:pro).includes(:projectparam).where("pros.got>=presubs.goal AND projectparams.nowstage='4'")
    elsif page == '11'	#募集失敗
      @allproject = Presub.includes(:pro).includes(:projectparam).where("pros.got<presubs.goal AND projectparams.nowstage='4'")
    end
  end

  def show
		@thisp = Pro.includes(:presub).find(params[:id])
		@thisp_feedback = Feedback.order("money ASC").where(:pro_id=>@thisp.id).all
		@allinvest = Investment.where(:pro_id=>params[:id], :confirm=>true)
		@allpeople = @allinvest.count
		@message = 	Question.where(:pro_id=>params[:id])
		@event = Question.new
		@answer = Answer.new

		@files = Upfile.where("id=? AND currentuse=? AND usage=?",@thisp.presub.upfile_id,true,'summary')
		@pics = Upfile.where("id=? AND currentuse=? AND usage=?",@thisp.presub.pic,true,'pic')
  end

  def create
    @event = Question.create(params[:question])
		@event.save
    redirect_to reflashindex_path(params[:question][:pro_id])
  end

  def updateanswer
    @answer = Answer.includes(:question).create(params[:answer])
		@answer.save
    redirect_to reflashindex_path(@answer.question.pro_id)
  end

#not work!!!
  def history
		@thispro = Pro.includes(:presub).find(params[:id])
		@post = Story.where(:pro_id=>params[:id])
  end

  def updateh
    @sto = Story.create(params[:story])
		@sto.save
    redirect_to reflashindex_path(@sto.pro_id)
  end

  def updatemail
		allinvest = Investment.where(:pro_id=>params[:pro], :confirm=>true)
    @story = Story.includes(:pro).find(params[:story])
	  allinvest.each do |set|
			Usernotice.sendemail(set.user_id.email, @story.topic, "#{simple_format(@story.story)}").deliver
	  end
		@story.update_attributes!(:send=>Time.now)
    redirect_to reflashindex_path(@story.pro_id)
  end
end
