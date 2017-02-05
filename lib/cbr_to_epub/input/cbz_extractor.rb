module CbrToEpub
  module Input
    class CbzExtractor
      def initialize(file_manager, input_path)
        @file_manager = file_manager
        @input_path = input_path
      end

      def extract
        system("unzip -j \"#{input_path}\" -d \"#{file_manager.extracted_directory}\"")

        pattern = File.join(file_manager.extracted_directory, '**', '*.{jpg,jpeg,png,JPG,JPEG}')
        Dir.glob(pattern).sort
      end

      private

      attr_reader :file_manager, :input_path
    end
  end
end
