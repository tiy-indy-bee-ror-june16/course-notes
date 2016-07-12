require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "should not save album without title" do
    album = Album.new
    refute album.save
    refute album.errors.blank?
  end

  test "titles should be longer than two letters" do
    album = Album.new(title: "ab")
    refute album.save
    refute album.errors.blank?
    assert album.errors.messages.detect do |key, value|
      value.detect do |error|
        error.include? "minimum"
      end
    end
  end

  test "album should have an artist" do
    artist = Artist.create!(name: 'CCR')
    album = Album.new(title: "Down on the Corner")
    refute album.save
    refute album.errors.blank?
    assert album.errors.messages.detect do |key, value|
      value.detect do |error|
        error.include? "artist"
      end
    end
  end

end
