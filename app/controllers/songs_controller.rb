class SongsController < ApplicationController
  before_action :set_list, only: [:songs_list, :add_song_list, :show]  
  before_action :set_artist, except: [:songs_list, :add_song_list, :update, :show, :edit, :destroy]
  before_action :set_song, only: [:show, :edit, :update, :destroy]
    
      def index
        @songs = @artist.songs
      end
    
    
      def show
      
      end
    
      def new
        @song = @artist.songs.new
      end
    
      def create
        @song = @artist.songs.new(song_params)
    
        if @song.save
          # redirect_to [@department, @item]
          redirect_to artist_path(@artist, @song)
        else
          render :new
        end
      end
      
    
      def edit
      end
    
      def update
        current = request.env['PATH_INFO']
        if current.include?("artists")
          if @song.update(song_params)
            redirect_to artist_songs_path(@song.artist_id)
          else
            render :edit
          end
        elsif current.include?("lists")
          if @song.update(list_song_params)
            redirect_to lists_path
          else
            render :edit
          end
        end

      end
    
      def destroy
        @song.destroy
        redirect_to root_path
      end

      def songs_list
        @songs = Song.all.sort_by { |s| [s.artist_id]}
      end

      def add_song_list
      end
    
      private

    
      def set_artist
        @artist = Artist.find(params[:artist_id])
      end
    
      def set_song
        @song = Song.find(params[:id])
      end
    
      def list_song_params
        params.permit(:list_id)
      end

      def song_params
        params.require(:song).permit(:name)
      end

      def set_list
        @list = List.find(params[:list_id])
      end
      
    end