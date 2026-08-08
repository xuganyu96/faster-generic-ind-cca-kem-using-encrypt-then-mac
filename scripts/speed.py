#!/usr/bin/env python3
"""Turn speed_kem CSV output into a compact statistical report."""

import argparse
import csv
import statistics
import sys
from collections import defaultdict


def read_rows(stream):
    rows = csv.DictReader(stream)
    required = {"routine", "epoch", "rounds", "duration", "unit"}
    if not required.issubset(rows.fieldnames or ()):
        raise ValueError("input must contain routine, epoch, rounds, duration, unit columns")
    for row in rows:
        rounds = int(row["rounds"])
        if rounds <= 0:
            raise ValueError("rounds must be positive")
        yield row["routine"], row["unit"], float(row["duration"]) / rounds


def main():
    parser = argparse.ArgumentParser(description="Report speed_kem measurements")
    parser.add_argument("input", nargs="?", type=argparse.FileType("r"),
                        default=sys.stdin, help="speed_kem CSV file (default: stdin)")
    args = parser.parse_args()

    grouped = defaultdict(list)
    try:
        for routine, unit, duration in read_rows(args.input):
            grouped[(routine, unit)].append(duration)
    except (ValueError, KeyError) as error:
        parser.error(str(error))

    if not grouped:
        parser.error("no measurements found")

    print("routine                 unit          samples   median       mean       stddev       min       max")
    for (routine, unit), values in grouped.items():
        deviation = statistics.stdev(values) if len(values) > 1 else 0.0
        print(f"{routine:<23} {unit:<12} {len(values):>7} "
              f"{statistics.median(values):>10.2f} {statistics.mean(values):>10.2f} "
              f"{deviation:>10.2f} {min(values):>10.2f} {max(values):>10.2f}")


if __name__ == "__main__":
    main()
