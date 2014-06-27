class ProjectController < ApplicationController
	def index #一開始進去的首頁，分成兩個區塊
	end

  def aboutus
  end

  def whoami
  end
  
  def askforhelpc
    @ask = Askforhelp.all
  end
end
