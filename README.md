# FailingAWS
This is a semi-minimal Docker build that helps to isolate a problem building the AWS API in C++.

You must have docker installed and in your path. I use gnu make, but you can run the Docker commands directly if you want.

# To Duplicate:
    make image
    make up
    make attach

This makes the docker image, starts it, then attaches to it. You'll be logged in. The checked-out AWS SDK for C++ is in your directory, waiting for you.

If you need it, the user has a very clever password of "asdf". It's ultra-secure :-)

# To Build:
Once logged in, you can do this:

    cd aws-sdk-cpp
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="ecr;s3"
    make

It will fail during the build.

# Works With Bionic
If you want to see nearly the same thing, but it works, edit the Dockerfile and change the FROM line to use the bionic build instead of focal. Bionic is Ubuntu 18.04 LTS and focal is 20.04 LTS. This probably means that focal (newer) has a newer version of gcc / g++.

In other words: it builds under bionic and fails under the newer focal version of Ubuntu.
