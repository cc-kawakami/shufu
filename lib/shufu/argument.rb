require "dry-initializer"

module Shufu
  class Argument
    extend Dry::Initializer

    option :name, proc(&:to_s)
    option :type, proc(&:to_sym), default: proc { :param }

    def to_s(value)
      case type
      when :param
        value
      when :flag
        value ? "--#{name}" : ""
      when :equal
        "--#{name}=#{value}"
      when :space
        "--#{name} #{value}"
      end
    end
  end
end
