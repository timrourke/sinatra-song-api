require 'bundler'
require 'sinatra/base'
require 'sinatra/cross_origin'
Bundler.require()

class Songs < Sinatra::Base
	register Sinatra::CrossOrigin

	get '/' do
		puts 'Hi tim.'
	end

	get '/api/:name' do
		cross_origin
		@song = params[:name]
		get_song(@song)
	end

	def never_gonna_give_you_up
		{:title => 'Never Gonna Give You Up',
		:release_year => 1987,
		:artist => 'Rick Astley'}.to_json
	end

	def puttin_on_the_ritz
		{:title => 'Puttin\' on the Ritz',
		:release_year => 1983,
		:artist => 'Taco'}.to_json
	end

	def ricky
		{:title => 'Ricky',
		:release_year => 1982,
		:artist => 'Toni Basil'}.to_json
	end

	def get_song(song)
		case song
			when 'never-gonna-give-you-up'
				never_gonna_give_you_up

			when 'puttin-on-the-ritz'
				puttin_on_the_ritz

			when 'ricky'
				ricky

			else
				halt(404)
			
		end
	end
	run! if app_file == $0
end