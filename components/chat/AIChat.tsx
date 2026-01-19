"use client";

import { useState, useRef, useEffect } from "react";
import { Send, Bot, User, Loader2, Sparkles, RotateCcw, Copy, Check, Trash2, Plus } from "lucide-react";
import { generateAIResponse, getContextualData, ChatMessage } from "@/lib/openrouter";
import { createSupabaseClient } from "@/lib/supabase/client";
import toast from "react-hot-toast";

export function AIChat() {
  const [messages, setMessages] = useState<ChatMessage[]>([
    {
      role: "assistant",
      content:
        "Hello! I'm your AI college counselor. I can help you with:\n\n• Comparing colleges\n• Understanding rankings and placements\n• Analyzing cutoffs\n• Finding the best fit for your rank\n• Answering questions about infrastructure, faculty, and more\n\nWhat would you like to know?",
    },
  ]);
  const [input, setInput] = useState("");
  const [loading, setLoading] = useState(false);
  const [typingMessage, setTypingMessage] = useState("");
  const [isTyping, setIsTyping] = useState(false);
  const [copiedIndex, setCopiedIndex] = useState<number | null>(null);
  const [isDemoMode, setIsDemoMode] = useState(false);
  const messagesEndRef = useRef<HTMLDivElement>(null);

  const suggestedPrompts = [
    "Which college is best for CSE at rank 5000?",
    "Compare IIT Bombay vs IIT Delhi",
    "What are the cutoffs for NIT Trichy?",
    "Best colleges under 10 LPA budget",
    "Tell me about BITS Pilani placements",
  ];

  useEffect(() => {
    // Check if we're in demo mode
    const checkDemoMode = async () => {
      try {
        const response = await fetch('/api/check-ai-status');
        const data = await response.json();
        setIsDemoMode(!data.apiKeyConfigured);
      } catch {
        setIsDemoMode(true);
      }
    };
    checkDemoMode();
  }, []);

  useEffect(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: "smooth" });
  }, [messages]);

  const handleSend = async () => {
    if (!input.trim() || loading) return;

    const userMessage: ChatMessage = {
      role: "user",
      content: input,
    };

    setMessages((prev) => [...prev, userMessage]);
    setInput("");
    setLoading(true);

    try {
      const context = await getContextualData(input);
      const response = await generateAIResponse([...messages, userMessage], context);
      
      // Typing animation
      setIsTyping(true);
      setTypingMessage("");
      
      const words = response.split(" ");
      for (let i = 0; i < words.length; i++) {
        await new Promise((resolve) => setTimeout(resolve, 50));
        setTypingMessage((prev) => prev + (i === 0 ? "" : " ") + words[i]);
      }
      
      setIsTyping(false);
      setTypingMessage("");
      
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content: response,
        },
      ]);

      // Save to chat history
      const supabase = createSupabaseClient();
      const {
        data: { user },
      } = await supabase.auth.getUser();
      
      if (user) {
        await supabase.from("chat_history").insert({
          user_id: user.id,
          session_id: "default",
          message: input,
          response: response,
          context_data: context,
        });
      }
    } catch (error: any) {
      console.error("AI Error:", error);
      const errorMessage = error.message || "Unknown error";
      
      toast.error("Failed to get response. Please try again.");
      setMessages((prev) => [
        ...prev,
        {
          role: "assistant",
          content:
            `I apologize, but I encountered an error: ${errorMessage}\n\nPlease try:\n• Rephrasing your question\n• Using one of the suggested prompts\n• Trying again in a moment\n\nIf you're a developer, check that your OPENROUTER_API_KEY is configured in .env.local`,
        },
      ]);
    } finally {
      setLoading(false);
      setIsTyping(false);
      setTypingMessage("");
    }
  };

  const handleCopy = (content: string, index: number) => {
    navigator.clipboard.writeText(content);
    setCopiedIndex(index);
    setTimeout(() => setCopiedIndex(null), 2000);
    toast.success("Copied to clipboard!");
  };

  const handleRegenerate = async (messageIndex: number) => {
    const previousMessages = messages.slice(0, messageIndex);
    setMessages(previousMessages);
    setLoading(true);

    try {
      const lastUserMessage = previousMessages[previousMessages.length - 1];
      if (lastUserMessage.role === "user") {
        const context = await getContextualData(lastUserMessage.content);
        const response = await generateAIResponse(previousMessages, context);
        
        // Typing animation
        setIsTyping(true);
        setTypingMessage("");
        const words = response.split(" ");
        for (let i = 0; i < words.length; i++) {
          await new Promise((resolve) => setTimeout(resolve, 50));
          setTypingMessage((prev) => prev + (i === 0 ? "" : " ") + words[i]);
        }
        setIsTyping(false);
        setTypingMessage("");
        
        setMessages((prev) => [...prev, { role: "assistant", content: response }]);
      }
    } catch (error) {
      toast.error("Failed to regenerate response");
    } finally {
      setLoading(false);
    }
  };

  const handleClearChat = () => {
    setMessages([
      {
        role: "assistant",
        content: "Hello! I'm your AI college counselor. How can I help you today?",
      },
    ]);
    toast.success("Chat cleared!");
  };

  const handleSuggestedPrompt = (prompt: string) => {
    setInput(prompt);
  };

  return (
    <div className="min-h-screen bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900 flex flex-col relative overflow-hidden">
      {/* Animated Background */}
      <div className="absolute inset-0 overflow-hidden pointer-events-none">
        <div className="absolute top-20 left-10 w-96 h-96 bg-primary-500/10 rounded-full blur-3xl animate-float" style={{ animationDuration: "20s" }}></div>
        <div className="absolute bottom-20 right-10 w-96 h-96 bg-fuchsia-500/10 rounded-full blur-3xl animate-float" style={{ animationDelay: "5s", animationDuration: "25s" }}></div>
      </div>

      <div className="relative z-10 max-w-5xl mx-auto w-full px-4 sm:px-6 lg:px-8 py-8 flex-1 flex flex-col">
        <div className="bg-slate-800/50 backdrop-blur border border-white/10 rounded-2xl shadow-2xl flex-1 flex flex-col">
          {/* Header */}
          <div className="border-b border-white/10 p-6">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-3">
                <div className="w-12 h-12 rounded-xl bg-gradient-to-br from-primary-500 to-fuchsia-500 flex items-center justify-center animate-pulse">
                  <Sparkles className="h-6 w-6 text-white" />
                </div>
                <div>
                  <h1 className="text-2xl font-bold text-white flex items-center gap-2">
                    AI College Counselor
                    <span className="text-xs bg-green-500/20 text-green-400 px-2 py-1 rounded-full border border-green-500/30 flex items-center gap-1">
                      <span className="w-2 h-2 bg-green-400 rounded-full animate-pulse"></span>
                      {isDemoMode ? "Demo Mode" : "Online"}
                    </span>
                  </h1>
                  <p className="text-sm text-slate-400 mt-1">
                    {isDemoMode ? "Interactive Demo • Try sample questions below" : "Powered by Advanced AI • Ask me anything about colleges"}
                  </p>
                </div>
              </div>
              <button
                onClick={handleClearChat}
                className="px-4 py-2 bg-white/5 hover:bg-white/10 border border-white/10 text-white rounded-lg transition-all flex items-center gap-2 hover:scale-105"
              >
                <Plus className="h-4 w-4" />
                New Chat
              </button>
            </div>
            
            {isDemoMode && (
              <div className="mt-4 p-3 bg-blue-500/10 border border-blue-500/30 rounded-lg">
                <p className="text-sm text-blue-300 flex items-center gap-2">
                  <Sparkles className="h-4 w-4" />
                  <span>Demo Mode Active - Try the suggested questions below to see how it works!</span>
                </p>
              </div>
            )}
          </div>

          {/* Messages */}
          <div className="flex-1 overflow-y-auto p-6 space-y-6">
            {messages.length === 1 && (
              <div className="space-y-4 mb-8">
                <h2 className="text-xl font-semibold text-white mb-4">Suggested Questions</h2>
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3">
                  {suggestedPrompts.map((prompt, index) => (
                    <button
                      key={index}
                      onClick={() => handleSuggestedPrompt(prompt)}
                      className="text-left p-4 bg-white/5 hover:bg-white/10 border border-white/10 rounded-xl text-slate-300 hover:text-white transition-all hover:scale-105 hover:border-primary-500/50"
                    >
                      <Sparkles className="h-4 w-4 text-primary-400 mb-2" />
                      {prompt}
                    </button>
                  ))}
                </div>
              </div>
            )}

            {messages.map((message, index) => (
              <div
                key={index}
                className={`flex gap-4 ${
                  message.role === "user" ? "justify-end" : "justify-start"
                } animate-fade-in-up`}
              >
                {message.role === "assistant" && (
                  <div className="flex-shrink-0 w-10 h-10 rounded-xl bg-gradient-to-br from-primary-500 to-fuchsia-500 flex items-center justify-center shadow-lg">
                    <Bot className="h-5 w-5 text-white" />
                  </div>
                )}
                <div className={`flex flex-col ${message.role === "user" ? "items-end" : "items-start"} max-w-[80%]`}>
                  <div
                    className={`rounded-2xl px-5 py-3 ${
                      message.role === "user"
                        ? "bg-gradient-to-r from-primary-600 to-fuchsia-600 text-white shadow-lg"
                        : "bg-slate-700/50 border border-white/10 text-slate-100"
                    }`}
                  >
                    <div className="whitespace-pre-wrap leading-relaxed">{message.content}</div>
                  </div>
                  {message.role === "assistant" && (
                    <div className="flex items-center gap-2 mt-2">
                      <button
                        onClick={() => handleCopy(message.content, index)}
                        className="p-2 hover:bg-white/10 rounded-lg transition-all text-slate-400 hover:text-white"
                        title="Copy"
                      >
                        {copiedIndex === index ? (
                          <Check className="h-4 w-4 text-green-400" />
                        ) : (
                          <Copy className="h-4 w-4" />
                        )}
                      </button>
                      <button
                        onClick={() => handleRegenerate(index)}
                        className="p-2 hover:bg-white/10 rounded-lg transition-all text-slate-400 hover:text-white"
                        title="Regenerate"
                      >
                        <RotateCcw className="h-4 w-4" />
                      </button>
                    </div>
                  )}
                </div>
                {message.role === "user" && (
                  <div className="flex-shrink-0 w-10 h-10 rounded-xl bg-slate-700 flex items-center justify-center shadow-lg">
                    <User className="h-5 w-5 text-slate-300" />
                  </div>
                )}
              </div>
            ))}
            
            {isTyping && typingMessage && (
              <div className="flex gap-4 justify-start animate-fade-in-up">
                <div className="flex-shrink-0 w-10 h-10 rounded-xl bg-gradient-to-br from-primary-500 to-fuchsia-500 flex items-center justify-center shadow-lg">
                  <Bot className="h-5 w-5 text-white" />
                </div>
                <div className="bg-slate-700/50 border border-white/10 rounded-2xl px-5 py-3 max-w-[80%]">
                  <div className="whitespace-pre-wrap leading-relaxed text-slate-100">{typingMessage}<span className="animate-pulse">|</span></div>
                </div>
              </div>
            )}

            {loading && !isTyping && (
              <div className="flex gap-4 justify-start">
                <div className="flex-shrink-0 w-10 h-10 rounded-xl bg-gradient-to-br from-primary-500 to-fuchsia-500 flex items-center justify-center shadow-lg animate-pulse">
                  <Bot className="h-5 w-5 text-white" />
                </div>
                <div className="bg-slate-700/50 border border-white/10 rounded-2xl px-5 py-3">
                  <div className="flex items-center gap-2">
                    <Loader2 className="h-5 w-5 animate-spin text-primary-400" />
                    <span className="text-slate-400">Thinking...</span>
                  </div>
                </div>
              </div>
            )}
            <div ref={messagesEndRef} />
          </div>

          {/* Input */}
          <div className="border-t border-white/10 p-6">
            <div className="flex gap-3">
              <div className="flex-1 relative">
                <textarea
                  value={input}
                  onChange={(e) => setInput(e.target.value)}
                  onKeyPress={(e) => {
                    if (e.key === "Enter" && !e.shiftKey) {
                      e.preventDefault();
                      handleSend();
                    }
                  }}
                  placeholder="Ask me anything about engineering colleges..."
                  rows={1}
                  className="w-full px-5 py-4 bg-slate-700/50 border border-white/10 rounded-xl text-white placeholder-slate-400 focus:ring-2 focus:ring-primary-500 focus:border-transparent resize-none"
                  disabled={loading}
                  style={{ minHeight: '56px', maxHeight: '200px' }}
                />
              </div>
              <button
                onClick={handleSend}
                disabled={loading || !input.trim()}
                className="px-6 bg-gradient-to-r from-primary-600 to-fuchsia-600 text-white rounded-xl hover:from-primary-700 hover:to-fuchsia-700 disabled:opacity-50 disabled:cursor-not-allowed flex items-center justify-center transition-all hover:scale-105 shadow-lg disabled:hover:scale-100"
              >
                <Send className="h-5 w-5" />
              </button>
            </div>
            <div className="mt-3 flex items-center justify-between text-xs">
              <span className="text-slate-500">
                💡 Try: "Compare colleges" or "Best for CSE under rank 10000"
              </span>
              <span className="text-slate-600">Press Enter to send</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
