module Heist
  class Runtime
    
    class Identifier
      extend Forwardable
      def_delegators(:@metadata, :[], :[]=)
      def_delegators(:@name, :to_s)
      alias :inspect :to_s
      
      def initialize(name)
        @name = name.to_s
        @metadata = {}
      end
      
      def eval(scope)
        scope.runtime.stack << Frame.new(self, scope)
      end
    end
    
  end
end

