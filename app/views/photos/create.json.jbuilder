json.photo do
  json.title @photo.title
  json.image_url @photo.image.url
  json.medium @photo.image.url(:medium)
  json.image_url_thumb @photo.image.url(:thumb)
  json.url url_for(@photo)
end
