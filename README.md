# WAL segment size benchmark

A benchmark measuring the impact of increasing the size of WAL
segment on performance. The tests were performed on 4 different
hardware configurations, each testing combinations of those
parameters:

* WAL segment size (1, 2, 4, 8, 16, 32, 64, 128, 256, 512MB, 1GB)
* pgbench scale (50 (750MB), 300 (4.5GB), 2000 (30GB))
* pgbench type (tpc-b-like and simple-update)
* flushing enabled/disabled

This amounts to 132 combinations. For each combination a single
4-hour pgbench run was performed, which means about 22 days of
runtime not counting initialization and other overhead.

For each run, a wide range of database and system metrics (sar
data, WAL statistics, ...) was collected for additional analysis.


## flushing

I was interested in impact of flushing added in PostgreSQL 9.6,
so I ran all tests with and without flushing. With flushing, those
paremeter values were used

* bgwriter_flush_after = 512kB
* checkpoint_flush_after = 256kB
* wal_writer_flush_after = 1MB

while in the 'noflush' configuration, all those values were 0.


## full data

This repository contains only a summary of results, mostly in the
form of simple datafiles and eps/png charts.

The full dataset collected during those benchmarks is ~16GB for
each configuration (about 2GB compressed), so 75GB (8GB) total.
That is not very practical to share through a git repository, but
if needed let me know and we can share it in some other way.


## hw configurations

### i5-2500k-ssd-raid

* CPU: Intel i5-2500k (4 cores, released 2011)
* RAM: 8GB
* storage: 6 x Intel S3700 100GB SSD (RAID0, swraid)
* kernel: 4.10

### xeon-e5-2620v4-nvme

* CPU: 2x Intel Xeon e5-2620 v4 (8/16 cores, released 2016)
* RAM: 32GB
* storage: Intel 750 SSD (NVMe, 400GB)
* kernel: 4.10

### xeon-e5-2620v4-sata-raid

* CPU: 2x Intel Xeon e5-2620 v4 (8/16 cores, released 2016)
* RAM: 32GB
* storage: 3 x 7.2k SATA drives
* kernel: 4.10

### xeon-e5450-sas-raid

* CPU: 2x Intel Xeon E5450 (4 cores, released 2006)
* RAM: 16GB
* storage: 6x 10k 146GB SAS (RAID 10, HP P400 with 512MB BBWC)
* kernel: 4.10

