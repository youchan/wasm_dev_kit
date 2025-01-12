require 'net_http_fetch'
require 'uri'
require 'pathname'
require 'fileutils'
require_relative '../../tgz_extractor'

module WasmDevKit
  module Commands
    class New
      PREBUILD_33_FULL_FILENAME = "ruby-3.3-wasm32-unknown-wasip1-full.tar.gz"

      def initialize(args)
        project_name = args.shift
        @base_dir = File.expand_path(project_name, Dir.pwd)
      end

      def execute
        unless File.exist?(@base_dir)
          Dir.mkdir(@base_dir)
        end
        Dir.chdir(@base_dir)

        File.open(PREBUILD_33_FULL_FILENAME, 'wb') do |file|
          uri = URI.parse(
            "https://github.com/ruby/ruby.wasm/releases/latest/download/#{PREBUILD_33_FULL_FILENAME}"
          )

          res = Net::HTTP.fetch(uri)

          if res.code == "200"
            file.write(res.body)
          else
            raise "ERROR: code: #{res.code}"
          end
        end

        tgz = TgzExtractor.new(PREBUILD_33_FULL_FILENAME)
        tgz.extract_to

        dist = Pathname.new(File.expand_path('../../../template/dist', __dir__))
        FileUtils.cp_r(dist, @base_dir)

        Dir.mkdir('src') unless File.exist?('src')
      end
    end
  end
end
