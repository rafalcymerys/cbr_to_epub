require_relative 'cbz_extractor'
require_relative 'cbr_extractor'

module CbrToEpub
  module Input
    class ExtractorFactory
      def initialize(file_manager)
        @file_manager = file_manager
      end

      def for_file(file)
        extension = File.extname(file)
        if extension == '.cbz'
          CbzExtractor.new(file_manager, file)
        else
          CbrExtractor.new(file_manager, file)
        end
      end

      private

      attr_reader :file_manager
    end
  end
end
