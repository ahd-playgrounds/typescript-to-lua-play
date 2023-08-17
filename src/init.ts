// import { Result } from "neverthrow";
import * as v from "tstl-validate";
// import { object, string, minLength, parse, type Output } from "valibot";
import { log } from "./utils";
// import { fsClose, fsRead, fstat, openFile } from "./fs";
import { clearInterval, setInterval, wait } from "./timer";

const uv = vim.loop;

v.safeParse(v.array(v.number()), [1, 2, 3]).mapErr((e) => log(e));
v.safeParse(v.array(v.number(), [v.minLength(1)]), {}).mapErr((e) => log(e));
v.safeParse(v.array(v.number(), [v.minLength(1)]), []).mapErr((e) => log(e));

// export async function main(file: string) {
//   vim.print("prog main begun");
//
//   // Create login schema with email and password
//   const LoginSchema = v.object({
//     email: v.string("must have email"),
//     password: v.string("must have pwd", [v.minLength(8, "too short")]),
//   });
//
//   type LogiData = v.Output<typeof LoginSchema>;
//
//   // v.safeParse(v.object({ fo: v.string() }), "hi").mapErr((e) => log(e));
//   v.safeParse(v.object({ fo: v.string() }), 88).mapErr((e) => log(e));
//   // v.safeParse(v.object({ fo: v.string() }), 46).mapErr((e) => log(e));
//
//   // const ES = v.string("must be string", [v.minLength(4, "too short!!")]);
//   // v.safeParse(ES, "foo").mapErr((errs) => {
//   //   log({ errs });
//   // });
//
//   // try {
//   //   v.parse(LoginSchema, { email: "hi", password: "hiddddddddd" });
//   //   vim.print("wel done");
//   // } catch (e: any) {
//   //   vim.print(e.message);
//   // }
//   v.safeParse(LoginSchema, { email: "hello", password: "my wrod" }).match(
//     (d) => log({ d }),
//     (e) => log({ e })
//   );
//
//   try {
//     const s = await openFile(file)
//       .mapErr((e) => log({ e }))
//       .map((fd) => {
//         return fstat(fd)
//           .andThen((stat) => fsRead(fd, stat.size))
//           .andThen((content) => fsClose(fd).map(() => content))
//           .match(
//             (file) => log({ file }),
//             (err) => log({ err })
//           );
//       });
//
//     // log(content);
//     // const s: any = vim.json.decode(content);
//     // log(s);
//     // log(s.compilerOptions.paths);
//
//     await wait(1000);
//     vim.print("prog ok ");
//   } catch (e) {
//     vim.print("prog read error");
//     vim.print(e);
//   }
// }
//
// vim.print("prog start");
//
// const h = main("./tsconfig.json").then(() => {
//   vim.print("done\n");
//
//   uv.stop();
// });
//
// let count = 0;
// const t = setInterval(() => {
//   count++;
//   const alive = vim.loop.loop_alive();
//   log({ alive });
//   if (count > 4) {
//     clearInterval(t);
//   }
//   if (alive) {
//     // uv.run("once");
//   } else {
//     uv.stop();
//   }
// }, 200);
//
// vim.print("prog maine end");
//
// // uv.loop_configure("block_signal", "sigprof");
// log(uv.run());
//
// vim.print("prog run end");
