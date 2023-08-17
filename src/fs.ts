// import { fromPromise, ResultAsync } from "neverthrow";
//
// const uv = vim.loop;
//
// type UVRes<D> = ResultAsync<D, UVErr>;
//
// function identity(a: any): UVErr {
//   return a;
// }
//
// export function openFile(path: string): UVRes<Fd> {
//   return fromPromise(
//     new Promise((resolve, reject) => {
//       uv.fs_open(path, "r", 438, function (e, fd) {
//         e ? reject(e) : resolve(fd);
//       });
//     }),
//     identity
//   );
// }
//
// export function fstat(fd: number): UVRes<Stat> {
//   return fromPromise(
//     new Promise<Stat>((resolve, reject) => {
//       uv.fs_fstat(fd, function (e, fd) {
//         e ? reject(e) : resolve(fd);
//       });
//     }),
//     identity
//   );
// }
//
// export function fsClose(fd: number): UVRes<null> {
//   return fromPromise(
//     new Promise((resolve, reject) => {
//       uv.fs_close(fd, function (e) {
//         e ? reject(e) : resolve(null);
//       });
//     }),
//     identity
//   );
// }
//
// export function fsRead(fd: number, size: number): UVRes<string> {
//   return fromPromise(
//     new Promise((resolve, reject) => {
//       uv.fs_read(fd, size, 0, function (e, fd) {
//         e ? reject(e) : resolve(fd);
//       });
//     }),
//     identity
//   );
// }
