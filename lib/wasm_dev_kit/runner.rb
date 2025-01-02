require 'net_http_fetch'
require 'uri'
require 'pathname'
require_relative '../tgz_extractor'

module WasmDevKit
  class Runner
    PREBUILD_33_FULL_FILENAME = "ruby-3.3-wasm32-unknown-wasip1-full.tar.gz"
    def initialize(base_dir)
      @base_dir = base_dir
    end

    def create_project
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

      Dir.mkdir('dist') unless File.exist?('dist')
      Dir.mkdir('src') unless File.exist?('src')

      ruby_wasm = Pathname.new("#{PREBUILD_33_FULL_FILENAME.sub(/\.tar\.gz$/, '')}/usr/local/bin/ruby")
      File.open('dist/ruby.wasm', 'wb') do |dist|
        dist.write ruby_wasm.read
      end

      ruby_wasm.delete
    end
  end
end
