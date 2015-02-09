class ApplicationController < Sinatra::Base
  helpers Sinatra::AuthenticationHelper
  helpers Sinatra::FormHelper
  helpers Sinatra::LinkHelper
  helpers ActiveSupport::Inflector

  before do
    @connection = ActiveRecord::Base.establish_connection({adapter: 'postgresql',database: 'restaurant'})
  end
  after do
    @connection.disconnect!
  end

  set :views, File.expand_path('../../views', __FILE__)
  set :stylesheets_folder, File.expand_path('../../public/stylesheets', __FILE__)
  set :javascripts_folder, File.expand_path('../../public/javascripts', __FILE__)
  set :public_folder, File.expand_path('../../public', __FILE__)

  enable :sessions, :method_override

  get '/' do
    erb :index
  end

end