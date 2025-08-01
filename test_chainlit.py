import chainlit as cl

@cl.on_message
async def main(message: cl.Message):
    # Simple echo for now - this will be your AI config flow later
    await cl.Message(content=f"You said: {message.content}").send()

# Additional test cases for decorators and async
@cl.on_chat_start
async def start():
    await cl.Message(content="Welcome to the chat!").send()

@cl.on_stop
def stop():
    print("Chat stopped")

# Test other Python features
class ChatBot:
    def __init__(self, name: str):
        self.name = name
    
    async def process_message(self, msg: str) -> str:
        return f"Bot {self.name} says: {msg}"

# Test f-strings and method calls
bot = ChatBot("Assistant")
result = await bot.process_message("Hello")
print(f"Result: {result}")