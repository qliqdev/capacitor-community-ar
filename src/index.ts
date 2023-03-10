import { registerPlugin } from '@capacitor/core';

import type { ARPlugin } from './definitions';

const AR = registerPlugin<ARPlugin>('AR', {
  web: () => import('./web').then(m => new m.ARWeb()),
});

export * from './definitions';
export { AR };
