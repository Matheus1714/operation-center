<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="index.css">
    <title>README</title>
</head>
<body>

# Space Operations Center (SOC) Using [COSMOS](https://ballaerospace.github.io/cosmos-website/)

![](img/overview.png)

A Space Operations Center (SOC) is a facility such as a Mission Control Center for controlling spaceflight and/or spacelift missions. She is responsible for the communication between the antennas (TT&C) and the Mission Control Center (MCC).

To simulate the communication of these two subsystems present in the Ground System, this work aims to use the knowledge acquired in SIS-20 (Ground System) to END and CAPTURE commands using bit packets in order to enable, in a summarized way using COSMOS , the analysis of this subsystem locally.

## Tools

### Simulate Space Operations Center (SOC)

For the simulation of the operation center, the [COSMOS](https://ballaerospace.github.io/cosmos-website/) tool from [Ball Aerospace](https://ballaerospace.github.io/) was used. It is a free tool with a user interface to perform Commands and Control of Embedded Systems.

To install COSMOS just follow the [Installation Guide COSMOS](https://ballaerospace.github.io/cosmos-website/docs/v5/installation).

### Simulate Satellite and TT&C

The [Core Flight System (cFS)](https://github.com/nasa/cFS) is a generic flight software architecture framework used on flagship spacecraft, human spacecraft, cubesats, and **Raspberry Pi**. 

[COSMOS](https://ballaerospace.github.io/cosmos-website/) has an integration with cFS, in which cFS is used as an external agent that sends and receives COSMOS telecommands. This integration is descript in [COSMOS and NASA cFS](https://ballaerospace.github.io/cosmos-website/docs/v5/cfs).

## Build & Run

### Build & Run COSMOS [Docker](https://www.docker.com/) Container 

For run the COSMOS execute the commands in directory `COSMOS/`:

```sh
sudo ./cosmos-control.sh start
```

With this command, a container will be created in <a href="https://www.docker.com/" target="_blank" >Docker </a> with the application running. After all operations are done, just enter the address: <a href="http://localhost:2900" target="_blank" >http://localhost:2900 </a>.



To stop using the container, just use:

```sh
sudo ./cosmos-control.sh stop
```

For more information, execute:

```sh
sudo ./cosmos-control.sh help
```

### Build & Run cFS

To Build and Run cFS Docker Container execute the command in directory `cFS/` .

```sh
sudo docker build -t cfs .
sudo docker run --cap-add CAP_SYS_RESOURCE --net=cosmos_default --name cfs -p1234:1234 -p1235:1235 cfs
```


</body>
</html>

