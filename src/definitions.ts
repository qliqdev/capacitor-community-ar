export interface ARPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
}
