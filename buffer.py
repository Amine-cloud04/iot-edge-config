#!/usr/bin/env python3

import redis

def main():
    r = redis.Redis(host='localhost', port=6379)
    r.set('status', 'Edge device is running')
    print("Buffer initialized and status set.")

if __name__ == "__main__":
    main()
