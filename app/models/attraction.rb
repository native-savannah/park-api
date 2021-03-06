class Attraction < ApplicationRecord
    belongs_to :park

    def url
        Rails.application.routes.url_helpers.attraction_url(park.resort.slug, park.slug, self.slug)
    end

    def as_json(options={})
        options.merge! :methods => [:url], :only => [:name]
        super(options)
    end
end
