module Primitives
  module Functions
    def init_primitive_functions
      define('+') { |arg1, arg2| arg1 + arg2 }
      define('-') { |arg1, arg2| arg1 - arg2 }
      define('*') { |arg1, arg2| arg1 * arg2 }
      define('/') { |arg1, arg2| arg1 / arg2 }
      define('=') { |arg1, arg2| arg1 == arg2 }
      define('<=') { |arg1, arg2| arg1 <= arg2 }
      define('>=') { |arg1, arg2| arg1 >= arg2 }
      define('and') { |arg1, arg2| arg1 && arg2 }
      define('or'){ |arg1, arg2| arg1 || arg2 }

      define('print') { |x| puts x }

      #define('callm') { |methodname, object, *args| object.send(methodname.to_sym, *args) }

      define('car'){ |list| list.first }
      define('cdr'){ |list| list[1..-1] }
      define('empty?'){ |list| list.empty? }
      define('null?'){ |obj| obj.nil? }
      define('nil?'){ |obj| obj.nil? }
      define('map'){ |func, list| list.map{ |e| func.call(self, [e]) } }

      define('<array>'){ [] }
      define('array<<'){ |list| Array.new(list) }
    end
  end
end
