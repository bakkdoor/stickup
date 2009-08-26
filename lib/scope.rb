class Scope
  def initialize(parent = nil)
    @parent = parent || {}
    @symbols = {}
  end

  def [](name)
    @symbols[name] || @parent[name]
  end

  def []=(name, value)
    @symbols[name] = value
  end

  def define(name, *args, &block)
    self[name] = Function.new(self, *args, &block)
  end

  def syntax(name, &block)
    self[name] = Syntax.new(self, &block)
  end
end

class TopLevel < Scope
  def initialize(*args)
    super

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

    define('+') { |arg1, arg2| arg1 + arg2 }
    define('-') { |arg1, arg2| arg1 - arg2 }
    define('*') { |arg1, arg2| arg1 * arg2 }
    define('/') { |arg1, arg2| arg1 / arg2 }
    define('=') { |arg1, arg2| arg1 == arg2 }
    define('and') { |arg1, arg2| arg1 && arg2 }
    define('or'){ |arg1, arg2| arg1 || arg2 }

    define('print') { |x| puts x }
    
    #define('callm') { |methodname, object, *args| object.send(methodname.to_sym, *args) }
    
    define('car'){ |list| list.first }
    define('cdr'){ |list| list[1..-1] }    
    define('empty?'){ |list| list.empty? }
    define('cons'){ |element, list| list << element }
    define('map'){ |func, list| list.map{ |e| func.call(self, [e]) } }
  end
end

