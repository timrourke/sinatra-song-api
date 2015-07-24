require 'bundler'
require 'sinatra/base'
require 'sinatra/cross_origin'
require './movies_list'
Bundler.require()

class Movies < Sinatra::Base
	register Sinatra::CrossOrigin

	get '/' do
		puts 'Hi tim.'
	end

	get '/api/:name' do
		cross_origin
		@movie = params[:name]
		get_movie(@movie)
	end

	def wizard_of_oz
		{:title => 'The Wizard of Oz',
		:date => 1939,
		:description => 'Follow the Yellow Brick shut the hell up.'}.to_json
	end

	def the_third_man
		{:title => 'The Third Man',
		:date => 1949,
		:description => 'Note: Not an adult film.'}.to_json
	end

	def citizen_kane
		{:title => 'Citizen Kane',
		:date => 1941,
		:description => 'The worst possible first date movie ever written.'}.to_json
	end

	def all_about_eve
		{:title => 'All About Eve',
		:date => 1950,
		:description => 'Note: Not about feminine hygiene products.'}.to_json
	end

	def a_hard_days_night
		{:title => 'A Hard Day\'s Night',
		:date => 1964,
		:description => 'A celebration of failed baby boomer idealism.'}.to_json
	end

	def the_cabinet_of_dr_caligari
		{:title => 'Das Cabinet des Dr. Caligari. (The Cabinet of Dr. Caligari)',
		:date => 1920,
		:description => 'Ew, it\'s grosss in there, don\'t look.' }.to_json
	end

	def modern_times
		{:title => 'Modern Times',
		:date => 1936,
		:description => 'GEARS!!!'}.to_json
	end

	def the_godfather
		{:title => 'The Godfather',
		:date => 1972,
		:description => 'The last good thing Marlon Brando did as a fat man.'}.to_json
	end

	def et
		{:title => 'E.T. The Extra-Terrestrial',
		:date => 1982,
		:description => 'A charming tale about an alien who befriends a child actress who grows up to be a moron.'}.to_json
	end

	def metropolis
		{:title => 'Metropolis',
		:date => 1927,
		:description => 'Robots have point boobs...?'}.to_json
	end

	def get_movie(movie)
		puts movie
		case movie
			when 'wizard-of-oz'
				wizard_of_oz

			when 'the-third-man'
				the_third_man

			when 'citizen-kane'
				citizen_kane

			when 'all-about-eve'
				all_about_eve

			when 'a-hard-days-night'
				a_hard_days_night

			when 'the-cabinet-of-dr-caligari'
				the_cabinet_of_dr_caligari

			when 'modern-times'
				modern_times

			when 'the-godfather'
				the_godfather

			when 'et'
				et

			when 'metropolis'
				metropolis

			else
				halt(404)
			
		end
	end
	run! if app_file == $0
end

	