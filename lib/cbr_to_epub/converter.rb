require_relative 'file_manager'
require_relative 'input/extractor_factory'
require_relative 'output/content/data'
require_relative 'output/content/metadata'
require_relative 'output/epub_builder'
require_relative 'output/epub_compressor'

module CbrToEpub
  class Converter
    def initialize(input_path, output_path, metadata)
      @input_path = input_path
      @output_path = output_path
      @metadata = metadata
      @file_manager = FileManager.new
    end

    def convert
      file_manager.create
      extractor = Input::ExtractorFactory.new(file_manager).for_file(input_path)
      input_image_files = extractor.extract

      epub_builder = Output::EpubBuilder.new(file_manager, Output::Content::Data.new(metadata, input_image_files))
      epub_builder.generate_metadata
      epub_builder.generate_pages
      epub_builder.generate_images

      epub_compressor = Output::EpubCompressor.new(file_manager)
      epub_compressor.compress
      epub_compressor.copy(output_path)
    ensure
      file_manager.cleanup
    end

    private

    attr_reader :input_path, :output_path, :metadata, :file_manager
  end
end
