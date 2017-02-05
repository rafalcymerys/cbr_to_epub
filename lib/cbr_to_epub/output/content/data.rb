require 'securerandom'
require_relative 'page'

module CbrToEpub
  module Output
    module Content
      class Data
        attr_reader :metadata, :pages

        def initialize(metadata, input_image_files)
          @metadata = metadata
          @pages = input_image_files.each_with_index.map { |image_file, index| Page.new(index, image_file)}
        end

        def erb_binding
          binding
        end
      end
    end
  end
end
