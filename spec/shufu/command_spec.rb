RSpec.describe Shufu::Command do
  def schema
    [
      { name: "bundle", type: :command },
      { name: "gem", type: :command },
      { name: "name", type: :param },
      { name: "exec", type: :flag },
      { name: "ci", type: :space },
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

  def command
    Shufu::Command.new(schema)
  end

  describe "#to_s" do
    it_is_asserted_by {
      command.to_s(values) == "bundle gem shufu --exec --test=rspec --ci github"
    }
  end
end
