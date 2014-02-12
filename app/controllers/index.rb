get '/' do
  @events = Event.all
  erb :index
end

get '/events/:id/show' do |id|
  @event = Event.find(id)
  erb :event_show
end

get '/events/new' do
  #TODO IMPLEMENT ME
  erb :event_form
end

post '/events/create' do
  event = Event.create(params[:event])
  unless event.errors.any?
    redirect "/"
  else
    @errors = event.errors
    erb :event_errors
  end
end
