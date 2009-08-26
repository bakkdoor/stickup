require 'rubygems'
require 'treetop'

Treetop.load File.dirname(__FILE__) + '/lisp.treetop'
%w[lisp scope function].each { |path| require File.dirname(__FILE__) + '/' + path }

module Scheme
  def self.run(path, debug_on = false)
    tree = parse(File.read path)
    puts tree.inspect if debug_on

    if tree
      scope = TopLevel.new
      tree.eval(scope)
      else
      # if parsig failed -> output error message with reason
      puts "ParseError in #{path} (line #{@parser.failure_line} / #{@parser.failure_column}):"
      puts "#{@parser.failure_reason}"
      exit
    end
  end
  
  def self.parse(string)
    @parser ||= LispParser.new
    @parser.parse(string)
  end
end

