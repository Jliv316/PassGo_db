class CompanySerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state, :zip_code, :image_url, :lat, :lng
end
