#!/bin/sh
set -e

./nuget pack libharu.nuspec -OutputDirectory .. -Verbosity detailed
unzip -l ../Libharu.2.3.0.nupkg
