export interface ApiError {
  type: ErrorType;
  message: string;
  originalError?: unknown;
}

export enum ErrorType {
  SERVER = 'server',
  CLIENT = 'client'
}
