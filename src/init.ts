import foo from "@@/foo";
import { log } from "./utils";
import { openFile, fstat, fsRead, fsClose } from "./fs";
import { clearInterval, setInterval, wait } from "./timer";

const uv = vim.loop;

async function main(file: string) {
  vim.print("prog main begun");

  try {
    const fileDesc = (await openFile(file)).unwrap();
    const stat = (await fstat(fileDesc)).unwrap();
    const content = (await fsRead(fileDesc, stat.size)).unwrap();
    (await fsClose(fileDesc)).unwrap();
    log(content);

    await wait(1000);
  } catch (e) {
    vim.print("prog read error");
    vim.print(e);
  }
}

vim.print("prog start");

const h = main("./tsconfig.json").then(() => {
  vim.print("done\n");

  // uv.stop();
});

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
//     // uv.stop();
//   }
// }, 200);

vim.print("prog maine end");

// uv.loop_configure("block_signal", "sigprof");
// log(uv.run());

vim.print("prog run end");
