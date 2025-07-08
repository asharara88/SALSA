import { readFileSync, writeFileSync } from 'fs';
import { resolve } from 'path';

interface Supplement {
  name: string;
  target: string;
  dailyDosage: string;
}

const csvPath = resolve(__dirname, '../src/data/supplements.csv');
const outPath = resolve(__dirname, '../src/data/supplements.json');

const data = readFileSync(csvPath, 'utf-8')
  .split('\n')
  .filter(Boolean);

const [headerLine, ...lines] = data;
const headers = headerLine.split(',');

const supplements: Supplement[] = lines.map(line => {
  const parts = line.split(/,(?=(?:[^"]*"[^"]*")*[^"]*$)/);
  const record: any = {};
  headers.forEach((h, i) => {
    const key = h.trim();
    const value = parts[i].replace(/^"|"$/g, '').trim();
    record[key] = value;
  });
  return {
    name: record['Name'],
    target: record['Target'],
    dailyDosage: record['DailyDosage'],
  } as Supplement;
});

writeFileSync(outPath, JSON.stringify(supplements, null, 2));
console.log(`Wrote ${supplements.length} supplements to ${outPath}`);

