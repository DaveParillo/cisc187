#!/usr/bin/expect
set ok  "\033\[1;32mOK\033\[0m"
set fail "\033\[1;31mfail\033\[0m"

if {[llength $argv] == 0} {
  send_user "Usage: check filename\n"
  exit 1
}


proc pass {{msg "test passed"}} {
  global ok
  send_user "$msg: $ok\n"
}

proc fail {{msg "program failed to respond in time allowed."} {expected ""} {actual ""}} {
  global expect_out buffer fail
  send_user "$msg: $fail\n"
  if {$expected ne ""} {
    send_user "\texpected: $expected "
    if {$expected ne ""} {
      send_user "\n\tactual:   $actual"
    } else {
      send_user "\n\tactual:   no output"
    }
  }
  send_user "\n"
}

proc abort {{msg "program failed to respond in time allowed."} {expected ""} {actual ""}} {
  fail $msg $expected $actual;
  exit -1
}


proc test_case {value expected} {
  global prog
  spawn /bin/sh -c "echo $value | ./$prog"
  expect {
    $expected   {pass "program encrypts '$value'";}
    eof     {fail "wrong result for input '$value'" $expected $expect_out(buffer);}
    timeout {abort}
  }
}

