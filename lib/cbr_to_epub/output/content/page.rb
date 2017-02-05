module CbrToEpub
  module Output
    module Content
      class Page
        attr_reader :number, :input_image_file

        def initialize(number, input_image_file)
          @number = number
          @input_image_file = input_image_file
        end

        def page_file
          "#{number}.xhtml"
        end

        def image_file
          "#{number}.jpg"
        end

        def image_media_type
          'image/jpeg'
        end

        def erb_binding
          binding
        end
      end
    end
  end
end
