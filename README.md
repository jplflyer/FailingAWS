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

    cd aws-sdk-cpp
    mkdir build
    cd build
    cmake .. -DCMAKE_BUILD_TYPE=Release -DBUILD_ONLY="ecr"
    make
    make install
