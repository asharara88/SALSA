# SALSA - Speech and Language Synthesis Application

A TypeScript application that provides text-to-speech functionality using the ElevenLabs API. The project now includes additional resources focused on metabolic support and gender-specific health optimization.

## Features

- **ElevenLabs Integration**: High-quality text-to-speech conversion
- **Voice Selection**: Multiple voice options (Rachel, Domi, Bella, Antoni)
- **Audio Caching**: Efficient caching system to reduce API calls
- **Voice Settings**: Configurable voice parameters (stability, similarity boost, style)
- **Logging**: Comprehensive logging system for debugging and monitoring
- **Metabolic Support Protocols**: Guidance on nutrition and lifestyle habits to improve metabolic health
- **Gender-Specific Health Stacks**: Separate male and female optimization plans for better overall wellness

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

## Metabolic Support

The repository includes sample scripts and example messaging that outline practical steps to boost metabolic function. Users can customize these scripts to provide supportive audio instructions focused on movement, diet, and rest.

### Male Health Optimization Stack

The male protocol highlights strength training, cardiovascular exercise, and nutritional guidelines aimed at sustainable energy levels.

### Female Health Optimization Stack

The female protocol emphasizes hormone balance, joint-friendly exercise routines, and nutrient timing for overall vitality.

## Supplement Reference

Supplement data can be found in `src/data/supplements.csv` and is automatically converted to `src/data/supplements.json` for programmatic use. Each entry provides a supplement name, target benefits, and suggested daily dosage.

### Updating Supplement Stock

Run `npm run sync:supplements` to fetch the latest inventory from the Biowell API and push it to the frontend store. A scheduled GitHub Action also executes daily to keep the storefront current.

## Development

This project is built with TypeScript and uses modern ES modules.

## License
This project is licensed under the MIT License.
