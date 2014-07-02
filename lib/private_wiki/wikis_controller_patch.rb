module PrivateWiki
  module WikisControllerPatch
    def self.included(base)
      base.send(:include, InstanceMethods)
      base.class_eval do
        unloadable
        alias_method_chain :edit, :private_wiki
      end
    end

    module InstanceMethods
      def edit_with_private_wiki
        edit_without_private_wiki
        @wiki.pages.update_all(private: params[:wiki][:private])
      end
    end
  end
end
