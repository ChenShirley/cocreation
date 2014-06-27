class UpfileController < ApplicationController
	def save_file
    @start = Presub.includes(:projectparam).find(params[:id])

		# 處理上傳檔案欄是空的情況下鍵入上傳的情形
		if params['filename'].nil? or params['filename'] == ''
			flash[:error] = "請選擇檔案！"  
			redirect_to :action => 'index'
			return  
		end

		# 把上一個舊的pdf設成false
		pastfile = Upfile.where("presub_id=? AND usage=? AND currentuse=?",@start.id,"summary",true)
		if !pastfile.empty?
			pastfile.each do |change|
				change.update_attributes!(:currentuse=>false)
			end
		end

		# 上傳新的	pdf
				# 取一個獨一的代表檔名  
				token = gettoken  
				# 原始檔名
				filename = params['filename'].original_filename
				filetype = File.extname("#{filename}")
				@filetoken = "#{token}"+filetype
				# 指定將存到的位置及檔名  
				filewhere = "/home/tdog/crowdfunding-master/public/files/#{@filetoken}"  
				# 真正的儲存動作  
				File.open("#{filewhere}", "wb") do |f|  
					f.write(params['filename'].read)  
				end  
				# 讀出該檔的格式、大小為何  
				@content_type = get_content_type(filewhere)  
				@size = File.size(filewhere)  
				# 上述所得的檔案資訊存到 table 裡  
				Upfile.new  
				Upfile.create(:filename => filename, :filetoken => @filetoken, :filetype => @content_type, :size => @size, :usage=>"summary", :currentuse=>true, :user_id=>@start.user.id, :projectparam_id=>@start.projectparam.id, :presub_id=>@start.id)
				@nowfile = Upfile.where("presub_id=? AND usage=? AND currentuse=?",@start.id,'summary',true)
				@start.update_attributes!(:upfile_id=>@nowfile[0].id)

				flash[:notice] = "檔案上傳成功！"
		redirect_to :action=>"fileshow", :id=>@nowfile[0].id
	end  

	def save_pic
    @start = Presub.includes(:projectparam).find(params[:id])

		# 處理上傳檔案欄是空的情況下鍵入上傳的情形
		if params['picname'].nil? or params['picname'] == ''
			flash[:error] = "請選擇檔案！"  
			redirect_to :action => 'index'
			return  
		end

		# 把上一個舊的pic設成false
		pastpic = Upfile.where("presub_id=? AND usage=? AND currentuse=?",@start.id,"pic",true)
		if !pastpic.empty?
			pastpic.each do |change|
				change.update_attributes!(:currentuse=>false)
			end
		end

		# 上傳新的	pic
				# 取一個獨一的代表檔名  
				token = gettoken  
				# 原始檔名
				picname = params['picname'].original_filename
				pictype = File.extname("#{picname}")
				@pictoken = "#{token}"+pictype
				# 指定將存到的位置及檔名  
				picwhere = "/home/tdog/crowdfunding-master/app/assets/images/#{@pictoken}"  
				# 真正的儲存動作  
				File.open("#{picwhere}", "wb") do |f|  
					f.write(params['picname'].read)  
				end  
				# 讀出該檔的格式、大小為何  
				@content_type = get_content_type(picwhere)  
				@size = File.size(picwhere)  
				# 上述所得的檔案資訊存到 table 裡  
				Upfile.new  
				Upfile.create(:filename => picname, :filetoken => @pictoken, :filetype => @content_type, :size => @size, :usage=>"pic", :currentuse=>true, :user_id=>@start.user.id, :projectparam_id=>@start.projectparam.id, :presub_id=>@start.id)
				@nowpic = Upfile.where("presub_id=? AND usage=? AND currentuse=?",@start.id,'pic',true)
				@start.update_attributes!(:pic=>@nowpic[0].id)

				flash[:notice] = "檔案上傳成功！"
		redirect_to :action=>"picshow", :id=>@nowpic[0].id
	end  

	def fileupload
		render :layout => false
  end

	def picupload
		render :layout => false
  end

	def fileshow
		@files = Upfile.find(params[:id])
		@pastfiles = Upfile.order("created_at desc").where("presub_id=? AND currentuse=? AND usage=?",@files.presub_id,false,'summary').all
		render :layout => false
  end

	def picshow
		@pics = Upfile.find(params[:id])
		render :layout => false
  end

	def index
		#@dir = get_local_list
		@files = Upfile.find(:all, :order => 'created_at desc')
		render :layout => false
  end

	def dl  
		# 從資料庫抓出所 query 的項目，因為不想用檔案的 id 來作參數，而改用 filetoken 做為存取依據  
		@dlfile = Upfile.find_by_filetoken(params[:filetoken])  
		# 如果query的網址，在資料庫中沒此筆資料則中止下載動作，並導回到首頁  
		if @dlfile.nil?  
			flash[:error] = "沒有這個檔案"  
			redirect_to :action => 'index'  
			return  
		end  
		# 若無上述中止動作則開始將檔名  
		send_file("/home/tdog/crowdfunding-master/public/files/#{@dlfile.filetoken}",
							:filename => "#{@dlfile.filename}",
							:type => "#{@dlfile.filetype}",  
							:stream => true,  
		# 以下的 disposition 兩種選一種用，看是要用儲存檔案的方式，或直接秀在瀏覽器中。  
		#					:disposition => "attachment")  
							:disposition => "inline")  
	end  
			
	private  

	# 將上傳檔案的目錄中，將檔名讀成一個array，除了「本目錄」及「父目錄」之外  
#	def get_local_list  
#		@dir = []  
#		dir = Dir.open('./public/upload')  
#		dir.sort.each do |d|  
#	    if d !~ /^\.*$/  
#				@dir << d  
#	    end  
#		end  
#		dir.close
#		return @dir  
#	end  

  def gettoken  
		#filetoken=Digest::SHA1.hexdigest(Time.now.to_s.split(//).sort_by {rand}.join) 
		filetoken=Time.now.to_i
		return filetoken  
	end 

	def get_content_type(filewhere)  
		content_type = `file -bi "#{filewhere}"`.chomp  
		content_type = fallback unless $?.success?  
		content_type.gsub!(/;.+$/,"") if content_type  
		return content_type  
	end  
end
