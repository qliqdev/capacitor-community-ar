export interface SceneOptions {
  /**
   * The base64 string of scene.
   *
   * This is only supported on iOS.
   *
   * @since 0.0.1
   */
  sceneData?: string;
}

export interface ARPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  start(options: SceneOptions): Promise<{ started: boolean }>;
}
