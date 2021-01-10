#!/bin/bash

DIRECTORY=`dirname "$0"`
cd "$DIRECTORY"

# Rscript -e '{if(system.file("",package="servr")==""){utils::install.packages("servr",repos="https://cloud.r-project.org")};servr::httd(browser=TRUE)}'

# Use Python because linux and mac come with python

py_path=$(which python)

py_version=$($py_path -V 2>&1)

# get free port
PYTHON_CODE=$(cat <<END
import socket
tcp = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
tcp.bind(('', 0))
host, port = tcp.getsockname()
tcp.close()
print(port)
END
)
port=$($py_path -c "$PYTHON_CODE")

echo "-----------------------------------------------------------------------"
if echo $py_version | grep -q '^Python 3\.'; then
  echo "Python 3 detected at $py_path"
  echo "Please open the following address in your browser (Chrome recommended)"
  echo "http://0.0.0.0:$port"
  $py_path -m webbrowser -t "http://0.0.0.0:$port"
  $py_path -m http.server $port
else
  echo "Python 2 detected at $py_path"
  echo "Please open the following address in your browser (Chrome recommended)"
  echo "http://0.0.0.0:$port"
  $py_path -m webbrowser -t "http://0.0.0.0:$port"
  $py_path -m SimpleHTTPServer $port
fi
