import { Component, OnInit } from '@angular/core';
import { AR } from '@capacitor-community/ar';

@Component({
  selector: 'app-root',
  templateUrl: 'app.component.html',
  styleUrls: ['app.component.scss'],
})
export class AppComponent  implements OnInit{
  constructor() {}

  ngOnInit() {
    this.start().then()
  }

  async start() {
    try {
      const file = await fetch('/assets/scenes/object.scn')
      const fileBlob = await file.blob();
      const base64String = await this.blobToBase64(fileBlob);
      const {started} = await AR.start({sceneData: base64String});
      console.log('AR INITIALIZED', started)
    } catch (e) {
    }
  }

  async blobToBase64(blob: Blob): Promise<string> {
    return new Promise((resolve, reject) => {
      const reader = new FileReader();
      reader.readAsDataURL(blob);
      reader.onload = () => {
        const base64String = reader.result?.toString()?.split(',')[1];
        if (base64String) {
          resolve(base64String);
        } else {
          reject(new Error('Failed to convert Blob to base64'));
        }
      };
      reader.onerror = (error) => {
        reject(error);
      };
    });
  }
}
