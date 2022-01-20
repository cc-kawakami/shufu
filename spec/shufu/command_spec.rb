RSpec.describe Shufu::Command do
  def command 
    Shufu::Command.new(
      'bundle gem',
      [
        { name: "name", type: "param" },
        { name: "exec", type: "flag" },
        { name: "test", type: "equal" },
        { name: "ci", type: "space" },
      ]
    )
  end

  describe "#line" do
    it_is_asserted_by {
      command.line({ name: "shufu", exec: true, test: "rspec", ci: "github" }) == "bundle gem shufu --exec --test=rspec --ci github"
    }
  end
end
