module Shufu
  class Line
    def initialize(base, schema, values)
      @base = base
      @schema = schema
      @values = values
    end

    def to_s
      ([@base] + @values.map { |k, v|
        argument = @schema.find { |a| a.name == k.to_s }
        argument = Shufu::Argument.new(name: k) if !argument
        argument.to_s(v)
      }).join(" ")
    end
  end
end
