class ChatbotJob < ApplicationJob
  queue_as :default

  def perform(question)
    @question = question
    chatgpt_response = client.chat(
      parameters: {
        model: "gpt-4o-mini",
        messages: questions_formatted_for_openai # to code as private method
      }
    )
    new_content = chatgpt_response["choices"][0]["message"]["content"]

    question.update(ai_answer: new_content)
    Turbo::StreamsChannel.broadcast_update_to(
      "question_#{@question.id}",
      target: "question_#{@question.id}",
      partial: "questions/question", locals: { question: question })
  end

  private

  def client
    @client ||= OpenAI::Client.new
  end

private

def questions_formatted_for_openai
  questions = @question.user.questions
  results = []
  results << { role: "system", content: "You are an assistant for a cooking platform focused on teaching people how to cook better. Only answer questions related to cooking, and format your responses without any special symbols or characters (such as hashtags, asterisk, ampersand), plain text only." }
  questions.each do |question|
    results << { role: "user", content: question.user_question }
    results << { role: "assistant", content: question.ai_answer || "" }
  end
  return results
end
end
