"use client";

interface BlogContentProps {
  content: string;
}

export function BlogContent({ content }: BlogContentProps) {
  // Simple markdown to HTML converter
  const formatContent = (text: string) => {
    let html = text;
    
    // Headers
    html = html.replace(/^# (.*$)/gim, '<h1 class="text-3xl font-bold mb-4 mt-8">$1</h1>');
    html = html.replace(/^## (.*$)/gim, '<h2 class="text-2xl font-bold mb-4 mt-8">$1</h2>');
    html = html.replace(/^### (.*$)/gim, '<h3 class="text-xl font-bold mb-3 mt-6">$1</h3>');
    
    // Bold
    html = html.replace(/\*\*(.*?)\*\*/gim, '<strong class="font-semibold text-slate-900">$1</strong>');
    
    // Italic
    html = html.replace(/\*(.*?)\*/gim, '<em class="italic">$1</em>');
    
    // Lists
    html = html.replace(/^\- (.*$)/gim, '<li class="ml-6 mb-2">$1</li>');
    html = html.replace(/^\* (.*$)/gim, '<li class="ml-6 mb-2">$1</li>');
    
    // Blockquotes
    html = html.replace(/^> (.*$)/gim, '<blockquote class="border-l-4 border-primary-500 pl-4 italic text-slate-600 my-4">$1</blockquote>');
    
    // Paragraphs
    const lines = html.split('\n');
    const formatted = lines.map(line => {
      if (line.trim() === '') return '<br/>';
      if (line.startsWith('<h') || line.startsWith('<li') || line.startsWith('<blockquote')) return line;
      if (line.trim().length > 0 && !line.startsWith('<')) {
        return `<p class="mb-4 leading-relaxed text-slate-700">${line}</p>`;
      }
      return line;
    }).join('\n');
    
    return formatted;
  };

  return (
    <div 
      className="prose prose-slate max-w-none"
      dangerouslySetInnerHTML={{ __html: formatContent(content) }}
    />
  );
}
