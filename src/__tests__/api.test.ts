import { AVAILABLE_VOICES, VOICE_SETTINGS } from '../api/elevenlabsApi';
import { logger } from '../utils/logger';

describe('ElevenLabs API Configuration', () => {
  test('should have valid voice configuration', () => {
    expect(AVAILABLE_VOICES).toBeDefined();
    expect(AVAILABLE_VOICES.length).toBeGreaterThan(0);
    
    // Check that each voice has required properties
    AVAILABLE_VOICES.forEach(voice => {
      expect(voice).toHaveProperty('id');
      expect(voice).toHaveProperty('name');
      expect(typeof voice.id).toBe('string');
      expect(typeof voice.name).toBe('string');
    });
  });

  test('should have valid voice settings', () => {
    expect(VOICE_SETTINGS).toBeDefined();
    expect(VOICE_SETTINGS.STANDARD).toBeDefined();
    expect(VOICE_SETTINGS.CLEAR).toBeDefined();
    expect(VOICE_SETTINGS.EXPRESSIVE).toBeDefined();

    // Check STANDARD settings structure
    const standard = VOICE_SETTINGS.STANDARD;
    expect(standard).toHaveProperty('stability');
    expect(standard).toHaveProperty('similarity_boost');
    expect(standard).toHaveProperty('style');
    expect(standard).toHaveProperty('use_speaker_boost');
    
    expect(typeof standard.stability).toBe('number');
    expect(typeof standard.similarity_boost).toBe('number');
    expect(typeof standard.style).toBe('number');
    expect(typeof standard.use_speaker_boost).toBe('boolean');
  });
});

describe('Logger Utility', () => {
  test('should have all logging methods', () => {
    expect(logger).toBeDefined();
    expect(typeof logger.error).toBe('function');
    expect(typeof logger.warn).toBe('function');
    expect(typeof logger.info).toBe('function');
    expect(typeof logger.debug).toBe('function');
    expect(typeof logger.http).toBe('function');
  });

  test('should not throw when logging', () => {
    expect(() => {
      logger.info('Test message');
      logger.warn('Test warning', { data: 'test' });
      logger.error('Test error', new Error('Test error'));
    }).not.toThrow();
  });
});