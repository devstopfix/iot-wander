# Apache Benchmark

Simple benchmark of the hello world resource.

Flags:

* `-c` number of concurrent requests
* `-n` number of requests to send
* `-k` keep connections alive to avoid [running out of ports](http://stackoverflow.com/a/1217100)

The command:

    ab -k -n 100000 -c 64 http://0.0.0.0:8080/hello

## Report

```
ab -k -n 100000 -c 64 http://0.0.0.0:8080/hello
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 0.0.0.0 (be patient)
Completed 10000 requests
Completed 20000 requests
Completed 30000 requests
Completed 40000 requests
Completed 50000 requests
Completed 60000 requests
Completed 70000 requests
Completed 80000 requests
Completed 90000 requests
Completed 100000 requests
Finished 100000 requests


Server Software:
Server Hostname:        0.0.0.0
Server Port:            8080

Document Path:          /hello
Document Length:        7 bytes

Concurrency Level:      64
Time taken for tests:   5.561 seconds
Complete requests:      100000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    99035
Total transferred:      17379450 bytes
HTML transferred:       700105 bytes
Requests per second:    17981.64 [#/sec] (mean)
Time per request:       3.559 [ms] (mean)
Time per request:       0.056 [ms] (mean, across all concurrent requests)
Transfer rate:          3051.86 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       3
Processing:     0    4   3.2      3      84
Waiting:        0    4   3.2      3      84
Total:          0    4   3.2      3      84

Percentage of the requests served within a certain time (ms)
  50%      3
  66%      4
  75%      5
  80%      5
  90%      6
  95%      8
  98%     11
  99%     16
 100%     84 (longest request)
 ```
