import { updateSupplementStock } from '../api/supplementSync';
import { logError } from '../utils/logger';

(async () => {
  try {
    await updateSupplementStock();
  } catch (err) {
    logError('Failed to update supplement stock via CLI', err);
    process.exit(1);
  }
})();
