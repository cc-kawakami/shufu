require 'yaml'

RSpec.describe Shufu::Schema do
  describe "#call" do
    it {
      schema = Shufu::Schema.call(YAML.load_file(File.join(__dir__, "../fixtures/schema.yml")))
      is_asserted_by { schema.to_h.is_a?(Hash) }
    }
  end
end
