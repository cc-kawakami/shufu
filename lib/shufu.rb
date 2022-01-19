# frozen_string_literal: true

Dir.glob(File.join(__dir__, "shufu/**/*.rb")).each { |f| require_relative f }

module Shufu
end
