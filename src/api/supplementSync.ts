import { logInfo, logError } from '../utils/logger';

export interface SupplementStock {
  id: string;
  name: string;
  category: string;
  dosage: string | number;
  unit: string;
  availability: number;
  tags?: string[];
}

export interface SupplementWeb {
  id: string;
  title: string;
  category: string;
  dose: string;
  in_stock: boolean;
  tags: string[];
}

const BIOWELL_ENDPOINT = process.env.BIOWELL_ENDPOINT || 'https://api.biowell.ai/v1/supplements/all';
const FRONTEND_ENDPOINT = process.env.FRONTEND_ENDPOINT || 'http://biowell.ai/api/frontend/supplements/update';

export async function fetchSupplementStock(apiKey: string): Promise<SupplementStock[]> {
  const response = await fetch(BIOWELL_ENDPOINT, {
    headers: { Authorization: `Bearer ${apiKey}` }
  });
  if (!response.ok) throw new Error(`Failed to fetch supplement data: ${response.status}`);
  return response.json();
}

export function validateSupplementData(items: SupplementStock[]): void {
  const required = ['id', 'name', 'category', 'dosage', 'unit', 'availability'];
  for (const item of items) {
    for (const field of required) {
      if (!(field in item)) {
        throw new Error(`Missing ${field} in ${JSON.stringify(item)}`);
      }
    }
  }
}

export function mapSupplements(items: SupplementStock[]): SupplementWeb[] {
  return items.map((item) => ({
    id: item.id,
    title: item.name,
    category: item.category,
    dose: `${item.dosage} ${item.unit}`,
    in_stock: item.availability > 0,
    tags: ['science-backed', ...(item.tags ?? [])]
  }));
}

export async function pushToFrontend(apiKey: string, data: SupplementWeb[]): Promise<void> {
  const response = await fetch(FRONTEND_ENDPOINT, {
    method: 'POST',
    headers: {
      Authorization: `Bearer ${apiKey}`,
      'Content-Type': 'application/json'
    },
    body: JSON.stringify(data)
  });
  if (!response.ok) throw new Error(`Failed to update frontend: ${response.status}`);
}

export async function updateSupplementStock(): Promise<void> {
  try {
    const biowellKey = process.env.BIOWELL_API_KEY as string;
    const frontendKey = process.env.FRONTEND_API_KEY as string;
    const supplements = await fetchSupplementStock(biowellKey);
    validateSupplementData(supplements);
    const mapped = mapSupplements(supplements);
    await pushToFrontend(frontendKey, mapped);
    logInfo('✅ Supplement stock updated to online frontend successfully.');
  } catch (err) {
    logError('Failed to update supplement stock', err);
    throw err;
  }
}
