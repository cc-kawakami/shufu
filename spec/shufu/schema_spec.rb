require 'yaml'

RSpec.describe Shufu::Schema do
  describe "#call" do
    it {
      schema = Shufu::Schema.call([{ name: 'ci', type: 'option', equal: true }])
      is_asserted_by { schema.to_h.is_a?(Hash) }
    }
  end
end
