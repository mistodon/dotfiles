if [ `python --version 2>&1 | cut -c 8` == "2" ]; then
    alias lhost="python -m SimpleHTTPServer 8000"
else
    alias lhost="python -m http.server"
fi