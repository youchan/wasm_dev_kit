require_relative 'commands/new'
require_relative 'commands/build'
require_relative 'commands/run'

module WasmDevKit
  module Commands
    def self.get(command)
      case command
      when 'new'
        return New
      when 'build'
        return Build
      when 'run'
        return Run
      end
    end
  end
end
