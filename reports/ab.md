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
Time taken for tests:   0.744 seconds
Complete requests:      10000
Failed requests:        0
Write errors:           0
Keep-Alive requests:    9935
Total transferred:      1808983 bytes
Total POSTed:           1741591
HTML transferred:       80024 bytes
Requests per second:    13443.61 [#/sec] (mean)
Time per request:       4.761 [ms] (mean)
Time per request:       0.074 [ms] (mean, across all concurrent requests)
Transfer rate:          2374.93 [Kbytes/sec] received
                        2286.45 kb/s sent
                        4661.38 kb/s total

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.2      0       3
Processing:     0    5   3.0      4      23
Waiting:        0    5   3.0      4      23
Total:          0    5   3.0      4      23

Percentage of the requests served within a certain time (ms)
  50%      4
  66%      5
  75%      6
  80%      6
  90%      8
  95%     10
  98%     14
  99%     16
 100%     23 (longest request)
