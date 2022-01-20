RSpec.describe Shufu::Line do
  def main
    "bundle gem"
  end

  def schema
    [
      Shufu::Argument.new(name: "name", type: "param"),
      Shufu::Argument.new(name: "exec", type: "flag"),
      Shufu::Argument.new(name: "test", type: "equal"),
      Shufu::Argument.new(name: "ci", type: "space"),
    ]
  end

  def values
    {
      name: "shufu",
      exec: true,
      test: "rspec",
      ci: "github"
    }
  end

  def line
    Shufu::Line.new(main, schema, values)
  end

  describe "#to_s" do
    it_is_asserted_by {
      line.to_s == "bundle gem shufu --exec --test=rspec --ci github"
    }
  end
end
