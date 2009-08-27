module Primitives
  module Functions
    def init_primitive_functions
      define('ruby-require') { |name| require(name) }

      define('+') { |arg1, arg2| arg1 + arg2 }
      define('-') { |arg1, arg2| arg1 - arg2 }
      define('*') { |arg1, arg2| arg1 * arg2 }
      define('/') { |arg1, arg2| arg1 / arg2 }
      define('=') { |arg1, arg2| arg1 == arg2 }
      define('<=') { |arg1, arg2| arg1 <= arg2 }
      define('>=') { |arg1, arg2| arg1 >= arg2 }
      define('and') { |arg1, arg2| arg1 && arg2 }
      define('or'){ |arg1, arg2| arg1 || arg2 }
      define('not'){ |arg1| not arg1 }

      define('print') { |x| puts x }
      define('print-'){ |x| print x }

      #define('callm') { |methodname, object, *args| object.send(methodname.to_sym, *args) }

      define('car'){ |list| list.first }
      define('cdr'){ |list| list[1..-1] }
      define('empty?'){ |list| list.empty? }
      define('null?'){ |obj| obj.nil? }
      define('nil?'){ |obj| obj.nil? }
      define('map'){ |func, list| list.map{ |e| func.call(self, [e]) } }

      define('[]<<'){ |list| Array.new(list) }
    end
  end
end
