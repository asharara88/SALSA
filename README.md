# SALSA - Speech and Language Synthesis Application

A TypeScript application that provides text-to-speech functionality using the ElevenLabs API.

## Features

- **ElevenLabs Integration**: High-quality text-to-speech conversion
- **Voice Selection**: Multiple voice options (Rachel, Domi, Bella, Antoni)
- **Audio Caching**: Efficient caching system to reduce API calls
- **Voice Settings**: Configurable voice parameters (stability, similarity boost, style)
- **Logging**: Comprehensive logging system for debugging and monitoring

## Project Structure

```
src/
├── api/
│   └── elevenlabsApi.ts    # ElevenLabs API integration
└── utils/
    └── logger.ts           # Logging utilities
```

## Environment Variables

- `VITE_ELEVEN_LABS_API_KEY`: Your ElevenLabs API key

## Voice Settings

The application supports three predefined voice quality settings:

- **STANDARD**: Balanced settings for general use
- **CLEAR**: Enhanced clarity for better comprehension
- **EXPRESSIVE**: More emotional and varied speech patterns

## Development

This project is built with TypeScript and uses modern ES modules.

## License

This project is licensed under the MIT License.