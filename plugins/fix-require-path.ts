import ts from "typescript";
import * as tstl from "typescript-to-lua";

const LUA_PREFIX = "learn";

const plugin: tstl.Plugin = {
  moduleResolution(
    moduleIdentifier: string,
    requiringFile: string,
    options: tstl.CompilerOptions,
    emitHost: tstl.EmitHost
  ) {
    console.log({ moduleIdentifier, options });
  },
  beforeEmit(
    _program: ts.Program,
    _options: tstl.CompilerOptions,
    _emitHost: tstl.EmitHost,
    result: tstl.EmitFile[]
  ) {
    for (const file of result) {
      // console.log(file);
      // const REQUIRE_PATH_REGEX = /require\("(src.+)"\)/g;
      const REQUIRE_PATH_REGEX = /require\("(.+)"\)/g;
      file.code = file.code.replaceAll(
        REQUIRE_PATH_REGEX,
        (match, path: unknown) => {
          if (typeof path !== "string") {
            return match;
          }

          return `require("${LUA_PREFIX}.${path}")`;
        }
      );
    }
  },
};

export default plugin;
