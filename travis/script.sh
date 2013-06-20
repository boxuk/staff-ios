#!/bin/sh
set -e

xctool -workspace staff -scheme staff build test
