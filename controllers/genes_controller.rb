class GenesController < Sinatra::Base
  set :root, File.join(File.dirname(__FILE__), '..')
  set :views, Proc.new { File.join(root, "views") }

  configure :development do
      register Sinatra::Reloader
  end
#INDEX
  get '/' do 
  	@genes = Gene.all
  	erb :'index'
  end
#NEW
  get '/new' do 
  	@gene = Gene.new
  	erb :'new'
  	
  end
#EDIT
  get '/:id/edit' do 
  	id = params[:id].to_i
  	@gene = Gene.find id
  	erb :'edit'
  end



  get '/:id' do 
  	id = params[:id].to_i
  	@gene = Gene.find id
  	erb :'show'

  end

  post '/' do 
  	gene = Gene.new
  	gene.name = params[:name]
  	gene.protein = params[:protein]
  	gene.chromosome = params[:chromosome].to_i
  	gene.location = params[:location]
  	gene.species = params[:species]
  	gene.save
  	redirect "/"

  end

  put '/:id' do
  	id = params[:id].to_i
  	gene = Gene.find id
  	gene.name = params[:name]
  	gene.protein = params[:protein]
  	gene.chromosome = params[:chromosome].to_i
  	gene.location = params[:location]
  	gene.species = params[:species]

  	gene.save
  	redirect "/"

  end

  delete '/:id' do 
  	id = params[:id].to_i
  	Gene.destroy id
  	redirect "/"
  end
  
end