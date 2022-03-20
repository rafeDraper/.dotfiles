# frozen_string_literal: true

# Module test
module Test
  HELLO_WORLD = 'WHATS UP!'
  def self.hello
    puts 'what the hell is going on'
  end

  def self.another_thing(first, second)
    first - second
  end
end
