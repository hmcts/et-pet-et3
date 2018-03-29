# rubocop:disable Style/TrivialAccessors
def user=(user)
  @user = user
end

def user
  @user
end
# rubocop:enable Style/TrivialAccessors

def personas
  @personas ||= ::Calculator::Test::PersonasRepository.new
end

def messaging
  @messaging ||= ::Calculator::Test::Messaging.new
end
