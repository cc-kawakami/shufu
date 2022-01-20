RSpec.describe Shufu::Line do
  def main
    "bundle gem"
  end

  def schema
    [
        { name: "name", type: "argument" },
        { name: "exec", type: "option", flag: true },
        { name: "test", type: "option", equal: true },
        { name: "ci", type: "option", equal: false },
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
