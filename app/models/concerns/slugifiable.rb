module Slugifiable
  module InstanceMethods
    def slug
      self.name.gsub(" ", "-").downcase
    end
  end

  # module ClassMethods
  #   def find_by_slug(slug)
  #     name = slug.gsub("-", " ").split.map(&:capitalize).join(" ")
  #     self.find_by(name: name.downcase)
  #   end
  # end

  module ClassMethods
    def find_by_slug(slug)
      self.all.find {|instance| instance.slug == slug }
    end
  end
end
