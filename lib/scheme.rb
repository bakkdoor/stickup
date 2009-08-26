require 'rubygems'
require 'treetop'

Treetop.load File.dirname(__FILE__) + '/lisp.treetop'
["primitives/syntax",
 "primitives/functions",
 "lisp",
 "scope",
 "function"].each do |path|
  require File.dirname(__FILE__) + '/' + path
end

module Scheme
  def self.run(path, debug_on = false)
    scope = TopLevel.new

    Dir["core/*.scm"].each do |file|
      parse_eval_file(file, scope)
    end

    # finally, parse & eval main file
    parse_eval_file(path, scope, debug_on)
  end

  def self.parse(string)
    @parser ||= LispParser.new
    @parser.parse(string)
  end

  def self.parse_eval_file(filename, scope, debug_on = false)
    ast = parse File.read(filename)
    puts ast.inspect if debug_on
    if ast
      ast.eval(scope)
    else
      parse_error(filename)
    end
  end

  def self.parse_error(filename)
    # if parsing failed -> output error message with reason
    puts "ParseError in #{filename} (line #{@parser.failure_line} / #{@parser.failure_column}):"
    puts "#{@parser.failure_reason}"
    exit
  end
end

