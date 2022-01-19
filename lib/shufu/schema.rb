require 'dry-schema'

module Shufu
  Schema = Dry::Schema.Params do
    required(:schema).filled(:array).each do
      hash do
        required(:name).filled(:string)
        required(:type).filled(:string)
        optional(:position).maybe(:integer)
        optional(:flag).maybe(:bool)
        optional(:equal).maybe(:bool)
      end
    end
  end
end
