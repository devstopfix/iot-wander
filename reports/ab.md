# Apache Benchmark

Simple benchmark of the hello world resource.

Flags:

* `-c` number of concurrent requests
* `-n` number of requests to send
* `-k` keep connections alive to avoid [running out of ports](http://stackoverflow.com/a/1217100)

Command to generate the report:

    mix run --no-halt
    ab -k -n 100000 -c 64 \
       -p reports/req.body.json \
       http://0.0.0.0:4000/hub/01:23:45:67:89:AB >> reports/ab.md

## Report

```
This is ApacheBench, Version 2.3 <$Revision: 655654 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 0.0.0.0 (be patient)


Server Software:
Server Hostname:        0.0.0.0
Server Port:            4000

Document Path:          /hub/01:23:45:67:89:AB
Document Length:        8 bytes

Concurrency Level:      64
Time taken for tests:   6.246 seconds
Complete requests:      100000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    99030
Total transferred:      18077625 bytes
Total POSTed:           17311937
HTML transferred:       800040 bytes
Requests per second:    16011.30 [#/sec] (mean)
Time per request:       3.997 [ms] (mean)
Time per request:       0.062 [ms] (mean, across all concurrent requests)
Transfer rate:          2826.62 [Kbytes/sec] received
                        2706.90 kb/s sent
                        5533.52 kb/s total

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       3
Processing:     0    4   2.0      4      23
Waiting:        0    4   2.0      4      23
Total:          0    4   2.0      4      23

Percentage of the requests served within a certain time (ms)
  50%      4
  66%      5
  75%      5
  80%      5
  90%      7
  95%      8
  98%      9
  99%     10
 100%     23 (longest request)
```