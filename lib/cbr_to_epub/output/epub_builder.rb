require 'fileutils'
require 'erb'

module CbrToEpub
  module Output
    class EpubBuilder
      def initialize(file_manager, data)
        @file_manager = file_manager
        @data = data
      end

      def generate_metadata
        Dir.mkdir(File.join(output_directory, 'META-INF'))
        Dir.mkdir(File.join(output_directory, 'OEBPS'))

        copy_template('mimetype')
        copy_template('META-INF/container.xml')
        copy_template('OEBPS/style.css')
        render_template('OEBPS/content.opf', data)
        render_template('OEBPS/toc.ncx', data)
      end

      def generate_pages
        data.pages.each do |page|
          render_template('OEBPS/page.xhtml', page, output_file_name = File.join('OEBPS', page.page_file))
        end
      end

      def generate_images
        data.pages.each do |page|
          FileUtils.copy(page.input_image_file, File.join(output_directory, 'OEBPS/', page.image_file))
        end
      end

      private

      attr_reader :file_manager, :data

      def copy_template(file_name)
        FileUtils.copy(File.join(template_directory, file_name), File.join(output_directory, file_name))
      end

      def render_template(file_name, bind_object, output_file_name = nil)
        template = File.read(File.join(template_directory, file_name + '.erb'))
        rendered_template = ERB.new(template).result(bind_object.erb_binding)
        File.write(File.join(output_directory, output_file_name || file_name), rendered_template)
      end

      def template_directory
        File.join(__dir__, '../../template/')
      end

      def output_directory
        file_manager.epub_directory
      end
    end
  end
end
