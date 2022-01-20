RSpec.describe Shufu::Command do
  def command 
    Shufu::Command.new(
      'bundle gem',
      [
        { name: "name", type: "argument" },
        { name: "exec", type: "option", flag: true },
        { name: "test", type: "option", equal: true },
        { name: "ci", type: "option", equal: false },
      ]
    )
  end

  describe "#line" do
    it_is_asserted_by {
      command.line({ name: "shufu", exec: true, test: "rspec", ci: "github" }) == "bundle gem shufu --exec --test=rspec --ci github"
    }
  end
end
