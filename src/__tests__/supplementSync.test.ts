import { mapSupplements } from '../api/supplementSync';

describe('mapSupplements', () => {
  test('maps supplement stock to web format', () => {
    const stock = [{
      id: '1',
      name: 'Vitamin C',
      category: 'Vitamins',
      dosage: '500',
      unit: 'mg',
      availability: 10,
      tags: ['immune']
    }];
    const mapped = mapSupplements(stock);
    expect(mapped).toEqual([
      {
        id: '1',
        title: 'Vitamin C',
        category: 'Vitamins',
        dose: '500 mg',
        in_stock: true,
        tags: ['science-backed', 'immune']
      }
    ]);
  });
});
