class Chat
  # Initialize the player
  #
  # @param api [MinecraftApi] API to use
  def initialize(api)
    @api = api
  end

  # Send a post in the chat
  #
  # @param message [String] message to post
  def chat_post(message)
    @api.send("chat.post(#{message})")
  end
end
