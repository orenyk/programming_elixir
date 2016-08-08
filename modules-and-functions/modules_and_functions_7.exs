IO.puts "convert float to string => :io.fwrite(\"~.2f\", [1.203])"
IO.inspect :io.fwrite("~.2f", [1.203])

IO.puts "\nget ENV value => System.get_env(\"PATH\")"
IO.puts System.get_env("PATH")

IO.puts "\nget file extension of file => Path.extname(\"./modules_and_functions_7.exs\")"
IO.puts Path.extname("./modules_and_functions_7.exs")

IO.puts "\nreturn working directory => System.cwd()"
IO.puts System.cwd()

IO.puts "\nexecute command in shell => System.cmd(\"ls\", [\"-al\"])"
IO.puts inspect System.cmd("ls", ["-al"])
