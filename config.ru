require 'sinatra'
require 'sinatra/reloader' if development?
require 'pg'
require 'pry'
require_relative './models/gene.rb'
require_relative './controllers/genes_controller.rb'

use Rack::Reloader

use Rack::MethodOverride

run GenesController