import gleam/io
import glssh_core

pub fn main() {
  let a = glssh_core.hello()
  io.print("Hello, world!")
  io.debug(a)
}
