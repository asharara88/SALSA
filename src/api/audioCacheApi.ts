export const audioCacheApi = {
  async getAudio(_userId: string, _key: string): Promise<Blob | null> {
    return null;
  },
  async storeAudio(_userId: string, _key: string, _blob: Blob, _ttl: number): Promise<void> {
    return;
  }
};
