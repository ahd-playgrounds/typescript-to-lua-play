import { Result } from "neverthrow";
import { log } from "./utils";
import { fsClose, fsRead, fstat, openFile } from "./fs";
import { clearInterval, setInterval, wait } from "./timer";

const uv = vim.loop;

export async function main(file: string) {
  vim.print("prog main begun");

  try {
    const s = await openFile(file)
      .mapErr((e) => log({ e }))
      .map((fd) => {
        return fstat(fd)
          .andThen((stat) => fsRead(fd, stat.size))
          .andThen((content) => fsClose(fd).map(() => content))
          .match(
            (file) => log({ file }),
            (err) => log({ err })
          );
      });

    // log(content);
    // const s: any = vim.json.decode(content);
    // log(s);
    // log(s.compilerOptions.paths);

    await wait(1000);
    vim.print("prog ok ");
  } catch (e) {
    vim.print("prog read error");
    vim.print(e);
  }
}

vim.print("prog start");

const h = main("./tsconfig.json").then(() => {
  vim.print("done\n");

  uv.stop();
});

let count = 0;
const t = setInterval(() => {
  count++;
  const alive = vim.loop.loop_alive();
  log({ alive });
  if (count > 4) {
    clearInterval(t);
  }
  if (alive) {
    // uv.run("once");
  } else {
    uv.stop();
  }
}, 200);

vim.print("prog maine end");

// uv.loop_configure("block_signal", "sigprof");
log(uv.run());

vim.print("prog run end");
