import argv
import gleam/io
import gleam/list
import gleam/result
import gleam/string.{uppercase}
import glint
import glssh_core.{type SshConfig}

fn connect() -> glint.Command(Nil) {
  use <- glint.command_help("Yet another SSH client written in Gleam")
  use _, args, flags <- glint.command()

  io.print("args: ")
  io.debug(args)

  io.print("flags: ")
  io.debug(flags)

  let hostname = case args {
    [hostname] -> hostname
    _ -> ""
  }

  case hostname {
    "" -> {
      io.println_error("Hostname is required")
    }
    _ -> {
      io.println("Connecting to: " <> hostname)
    }
  }
}

pub fn main() {
  glint.new()
  |> glint.with_name("glssh")
  |> glint.pretty_help(glint.default_pretty_help())
  |> glint.add(at: [], do: connect())
  |> glint.run(argv.load().arguments)
}
