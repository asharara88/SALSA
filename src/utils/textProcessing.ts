export function prepareTextForSpeech(text: string): string {
  return text;
}

export function truncateForSpeech(text: string, length = 1000): string {
  return text.slice(0, length);
}
