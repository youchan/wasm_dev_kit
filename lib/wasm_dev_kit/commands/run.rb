require 'pathname'

module WasmDevKit
  module Commands
    class Run
      def initialize(args)
        @path = Pathname.new('/src').join(args.shift)
      end

      def execute
        system(cli_args.join(' '))
      end

      def cli_args
        [
          'wasmtime',
          'dist/app.wasm',
          @path.to_s
        ]
      end
    end
  end
end
