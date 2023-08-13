import { Result, err, ok } from "./result";

const uv = vim.loop;

export async function openFile(path: string): Promise<Result<number, Error>> {
  return new Promise((resolve) => {
    uv.fs_open(path, "r", 438, function (e, fd) {
      resolve(e ? err(e) : ok(fd));
    });
  });
}

export async function fstat(
  fd: number
): Promise<Result<{ size: number }, Error>> {
  return new Promise((resolve) => {
    uv.fs_fstat(fd, function (e, fd) {
      resolve(e ? err(e) : ok(fd));
    });
  });
}

export async function fsClose(fd: number): Promise<Result<null, Error>> {
  return new Promise((resolve) => {
    uv.fs_close(fd, function (e) {
      resolve(e ? err(e) : ok(null));
    });
  });
}

export async function fsRead(
  fd: number,
  size: number
): Promise<Result<string, Error>> {
  return new Promise((resolve) => {
    uv.fs_read(fd, size, 0, function (e, fd) {
      resolve(e ? err(e) : ok(fd));
    });
  });
}
