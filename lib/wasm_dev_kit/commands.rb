require_relative 'commands/new'
require_relative 'commands/build'

module WasmDevKit
  module Commands
    def self.get(command)
      case command
      when 'new'
        return New
      when 'build'
        return Build
      end
    end
  end
end
