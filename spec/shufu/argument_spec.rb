RSpec.describe Shufu::Argument do
  describe ".new" do
    context "param" do
      it {
        argument = Shufu::Argument.new(name: "name", type: "param")
        is_asserted_by { argument.to_s("value") == "value" }
      }
    end

    context "flag" do
      it {
        argument = Shufu::Argument.new(name: "name", type: "flag")
        is_asserted_by { argument.to_s(true) == "--name" }
      }
    end

    context "equal" do
      it {
        argument = Shufu::Argument.new(name: "name", type: "equal")
        is_asserted_by { argument.to_s("value") == "--name=value" }
      }
    end

    context "space" do
      it {
        argument = Shufu::Argument.new(name: "name", type: "space")
        is_asserted_by { argument.to_s("value") == "--name value" }
      }
    end
  end
end
