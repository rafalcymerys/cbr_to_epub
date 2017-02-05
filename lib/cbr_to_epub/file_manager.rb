require 'fileutils'
require 'tmpdir'

module CbrToEpub
  class FileManager
    attr_reader :directory

    def create
      @directory = Dir.mktmpdir
      Dir.mkdir(extracted_directory)
      Dir.mkdir(epub_directory)
    end

    def extracted_directory
      File.join(directory, 'extracted')
    end

    def epub_directory
      File.join(directory, 'epub')
    end

    def cleanup
      FileUtils.rm_rf(directory)
    end
  end
end
