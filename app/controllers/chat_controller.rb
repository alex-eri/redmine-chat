class ChatController < ApplicationController
  unloadable

  def list
    puts params
    @project = Project.find(params[:project])
    if params[:last]
      c = 0
      while c < 5
        c += 1
        @chats = Chats.where(["id > ?", params[:last] ]).where(["project_id = ?", @project.id ]).find(:all, :include => :user, :order => "time DESC", :limit => 15)
        if @chats.length != 0
          break
        end
        sleep 1
      end
    else
      @chats = Chats.where(["project_id = ?", @project.id ]).find(:all, :include => :user, :order => "time DESC", :limit => 15)
    end
    respond_to do |format|
      format.js
      format.html {render :layout => nil}
    end    
  end

  def new
    puts params
    puts session[:user_id]
    @project = Project.find(params[:project])
    user = User.find(session[:user_id])
    if params[:text] != ''
      msg = Chats.new({:text => params[:text], :project => @project, :user => user, :time => DateTime.now })
      msg.save
    end
    respond_to do |format|
      format.js { render json: '"OK"', :content_type => 'application/json' }
      format.html { redirect_to :action=>'list' }
    end
    
  end
end
