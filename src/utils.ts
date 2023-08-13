export function log(arg: any): void {
  vim.print(vim.inspect(arg, {}));
}
