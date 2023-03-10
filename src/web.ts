import { WebPlugin } from '@capacitor/core';

import type { ARPlugin } from './definitions';

export class ARWeb extends WebPlugin implements ARPlugin {
  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }
}
