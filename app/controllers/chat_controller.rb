class ChatController < ApplicationController
  unloadable

  def list
    @project = Project.find(params[:project])
    @chats = Chats.where(["project_id = ?", @project.id ]).find(:all, :include => :user, :order => "time DESC", :limit => 15)
    respond_to do |format|
      format.js
      format.html {render :layout => nil}
    end    
  end

  def new
    puts "Hello, World!"
    puts params
    puts session[:user_id]
    @project = Project.find(params[:project])
    user = User.find(session[:user_id])
    if params[:text] != ''
      msg = Chats.new({:text => params[:text], :project => @project, :user => user, :time => DateTime.now })
      msg.save
    end
    redirect_to :action=>'list' 
    
  end
end
