import matlab.net.*
import matlab.net.http.*
r = RequestMessage;
uri = URI('http://192.168.0.19');
resp = send(r,uri)
status = resp.StatusCode