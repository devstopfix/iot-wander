# Apache Benchmark

Simple benchmark of the hello world resource.

## Test

Test the service with CURL:

```
curl -v -X POST --header "Content-Type: application/json" \
  -d @reports/req.body.json \
  http://0.0.0.0:4000/hub/01:23:45:67:89:AB

```

## Run

Flags:

* `-c` number of concurrent requests
* `-n` number of requests to send
* `-k` keep connections alive to avoid [running out of ports](http://stackoverflow.com/a/1217100)

Command to generate the report:

    mix run --no-halt
    ab -k -n 10000 -c 16 \
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
Time taken for tests:   1.044 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    9936
Total transferred:      1810455 bytes
Total POSTed:           1742975
HTML transferred:       80088 bytes
Requests per second:    9581.66 [#/sec] (mean)
Time per request:       6.679 [ms] (mean)
Time per request:       0.104 [ms] (mean, across all concurrent requests)
Transfer rate:          1694.06 [Kbytes/sec] received
                        1630.92 kb/s sent
                        3324.98 kb/s total

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       3
Processing:     0    7   2.3      6      21
Waiting:        0    7   2.3      6      21
Total:          0    7   2.4      6      22

Percentage of the requests served within a certain time (ms)
  50%      6
  66%      7
  75%      8
  80%      8
  90%      9
  95%     11
  98%     13
  99%     15
 100%     22 (longest request)
```