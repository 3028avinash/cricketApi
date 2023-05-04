class User < ApplicationRecord
    has_many :app_opens, dependent: :restrict_with_error
    has_one :account
    has_one :user_profile


    geocoded_by :ip_address
    after_validation :geocode

    # def location
    #   result = Geocoder.search(ip_address).first
    #   {
    #     city: result.city,
    #     state: result.state,
    #     country: result.country
    #   }
    # end
    # geocoded_by :full_street_address   
    # after_validation :geocode
    # geocoded_by :ip_address,
    # :latitude => :lat, :longitude => :lon
    # after_validation :geocode
    # reverse_geocoded_by :lat, :lon do |obj,results|
    #     if geo = results.first
    #       obj.city    = geo.city
    #       obj.zipcode = geo.postal_code
    #       obj.country = geo.country_code
    #     end
    #   end
    #   after_validation :reverse_geocode


end
