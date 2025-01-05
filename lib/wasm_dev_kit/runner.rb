require_relative 'commands'

module WasmDevKit
  class Runner
    def initialize(args)
      @args = args.dup
      @command = @args.shift
    end

    def execute
      command_class = Commands.get(@command)
      cmd = command_class.new(@args)
      cmd.execute
    end
  end
end
