module CbrToEpub
  module Output
    module Content
      class Metadata
        DEFAULT_AUTHOR = 'Unknown'.freeze
        DEFAULT_TITLE = 'Comic Book'.freeze

        private_constant :DEFAULT_AUTHOR, :DEFAULT_TITLE

        attr_reader :author, :title, :uuid

        def initialize(author, title)
          @author = author || DEFAULT_AUTHOR
          @title = title || DEFAULT_TITLE
          @uuid = SecureRandom.uuid
        end
      end
    end
  end
end
