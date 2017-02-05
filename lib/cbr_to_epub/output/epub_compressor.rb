require 'fileutils'

module CbrToEpub
  module Output
    class EpubCompressor
      def initialize(file_manager)
        @file_manager = file_manager
      end

      def compress
        # mimetype needs to be the first file in epub archive
        system("cd \"#{file_manager.epub_directory}\" && zip -0 -rX \"#{zip_path}\" mimetype")
        system("cd \"#{file_manager.epub_directory}\" && zip -0 -rX \"#{zip_path}\" * -x mimetype")
      end

      def copy(path)
        FileUtils.copy(zip_path, path)
      end

      def zip_path
        File.join(file_manager.directory, 'output.epub')
      end

      private

      attr_reader :file_manager
    end
  end
end
