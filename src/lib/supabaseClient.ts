export const supabase = {
  auth: {
    async getUser() {
      return { data: { user: { id: 'test-user' } } } as const;
    }
  }
};
