require 'ruby_wasm'
require 'ruby_wasm/cli'

module WasmDevKit
  module Commands
    class Build
      def initialize(args)
      end

      def execute
        RubyWasm::CLI.new(stdout: $stdout, stderr: $stderr).run(cli_args)
      end

      def cli_args
        [
          'pack',
          './dist/ruby.wasm',
          '--dir', './src::/src',
          '--dir', './ruby-3.3-wasm32-unknown-wasip1-full/usr::/usr',
          '--dir', './src::/src',
          '-o', './dist/app.wasm'
        ]
      end
    end
  end
end
