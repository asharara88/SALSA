export function chunkTextForSpeech(text: string): string[] {
  return [text];
}

export function concatenateAudioBlobs(blobs: Blob[]): Blob {
  return new Blob(blobs);
}
