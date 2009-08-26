module Primitives
  module Syntax
    def init_primitive_syntax
      syntax('define') do |scope, cells|
        first = cells.first
        case first
        when Lisp::List
          names = first.cells.map { |c| c.text_value }
          scope.define(names.first, names[1..-1], cells[1..-1])
        when Lisp::Identifier
          scope[first.text_value] = cells[1].eval(scope)
        end
      end

      syntax('lambda') do |scope, cells|
        names = cells.first.cells.map { |c| c.text_value }
        Function.new(scope, names, cells[1..-1])
      end

      syntax('if') do |scope, cells|
        which = cells.first.eval(scope) ? cells[1] : cells[2]
        which.eval(scope)
      end

      syntax('let') do |scope, cells|
        first = cells.first
        case first
        when Lisp::List
          names = first.cells.map{ |pair| pair.cells.first.text_value}
          values = first.cells.map{ |pair| pair.cells[1] }
          Function.new(scope, names, cells[1..-1]).call(scope, values)
        end
      end

      syntax('callm') do |scope, cells|
        methodname = cells.first.text_value
        obj = cells[1].eval(scope)
        args = cells[2..-1].map{ |c| c.eval(scope) }
        obj.send(methodname.to_sym, *args)
      end

      syntax('list') do |scope, cells|
        Array.new(cells.map{|x| x.eval(scope)})
      end

      syntax('set') do |scope, cells|
        name = cells.first.text_value
        value = cells[1].eval(scope)
        scope[name] = value
      end
    end
  end
end
