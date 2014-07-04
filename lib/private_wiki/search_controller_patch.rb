module PrivateWiki
  module SearchControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        alias_method_chain :index, :private_wiki
      end
    end

    module InstanceMethods
      def index_with_private_wiki
        index_without_private_wiki
        @results && @results.delete_if do |result|
          if result.respond_to?(:private) && result.respond_to?(:private_page_visible?)
            result.private and !result.private_page_visible? @project, User.current
          end
        end
      end
    end
  end
end