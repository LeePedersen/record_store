require('sinatra')
require('sinatra/reloader')
require('./lib/album')
require('pry')
also_reload('lib/**/*.rb')

get('/') do
  @albums = Album.all
  erb(:albums)
end

get('/albums') do
  @album = Album.find_by_name(params[:search])
  erb(:search_results)
end

post('/albums') do
  name = params[:album_name]
  album = Album.new(name, nil, nil, nil, nil)
  album.save()
  @albums = Album.all
  erb(:albums)
end

get('/albums/new') do
  erb(:new_album)
end

get('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  erb(:album)
end

get('/albums/:id/edit') do
  @album = Album.find(params[:id].to_i())
  erb(:edit_album)
end

patch('/albums/:id') do
  @album = Album.find(params[:id].to_i())
  @album.update(params[:name], params[:artist], params[:genre], params[:year])
  @albums = Album.all
  erb(:albums)
end

delete('/albums/:id') do

  @album = Album.find(params[:id].to_i())
  @album.delete()
  @albums = Album.all
  erb(:albums)

end

get('/custom_route') do
  "We can even create custom routes, but we should only do this when needed."
end
