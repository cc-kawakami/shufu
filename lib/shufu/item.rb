module Shufu
  class Item
    def initialize(all_schema, name, value)
      @all_schema = all_schema
      @name = name
      @value = value
    end

    def schema
      @all_schema.find { |s| s[:name] == @name.to_s }
    end
    

    def to_s
      if schema[:type] == "argument"
        @value
      else
        if schema[:flag]
          "--#{@name}"
        else
          if schema[:equal]
            "--#{@name}=#{@value}"
          else
            "--#{@name} #{@value}"
          end
        end
      end
    end
  end
end
