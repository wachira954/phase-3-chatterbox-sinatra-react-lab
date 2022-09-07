class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/messages' do 
  messages=Message.all
  messages.to_json
  end
  # ApplicationController POST /messages creates a new message in the database
   post '/messages' do 
   messages=Message.create(
     body: params[:body],
     username: params[:username]
   )
   messages.to_json
   end
   # ApplicationController PATCH /messages/:id updates the body of the message in the database
   patch '/messages/:id' do 
    messages=Message.find(params[:id])
   messages.update(
     body: params[:body]
   )
   messages.to_json
   end 
   # ApplicationController DELETE /messages/:id deletes the message from the database
  delete '/messages/:id' do 
   message=Message.find(params[:id])
   message.destroy
   message.to_json
  end
end