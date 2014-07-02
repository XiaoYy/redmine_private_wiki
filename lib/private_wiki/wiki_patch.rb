module PrivateWiki
  module WikiPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        safe_attributes "start_page", "private"
        #named_scope :nonprivate_only, :conditions => {:private => false}
      end
    end

    module InstanceMethods

    end
  end
end