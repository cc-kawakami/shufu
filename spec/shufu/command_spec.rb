RSpec.describe Shufu::Command do
  def schema
    {
      bundle: {
        gem: {
          name: :param ,
          exec: :flag ,
          test: :equal,
          ci: :space
        }
      }
    }
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
