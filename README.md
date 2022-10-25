<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="index.css">
    </head>
    <body>

<h1>Space Operations Center (SOC) Using <a href="https://ballaerospace.github.io/cosmos-website/" target="_blank">COSMOS  </a></h1>

<img src="img/overview.png">

<p>A Space Operations Center (SOC) is a facility such as a Mission Control Center for controlling spaceflight and/or spacelift missions. She is responsible for the communication between the antennas (TT&C) and the Mission Control Center (MCC).
</p>

<p>To simulate the communication of these two subsystems present in the Ground System, this work aims to use the knowledge acquired in SIS-20 (Ground System) to END and CAPTURE commands using bit packets in order to enable, in a summarized way using COSMOS , the analysis of this subsystem locally.</p>

<h2>Tools</h2>

<h3>Simulate Space Operations Center (SOC)</h3>

<p>For the simulation of the operation center, the <a href="https://ballaerospace.github.io/cosmos-website/" target="_blank">COSMOS </a> tool from <a href="https://ballaerospace.github.io/" target="_blank">Ball Aerospace </a> was used. It is a free tool with a user interface to perform Commands and Control of Embedded Systems.</p>

<p>To install COSMOS just follow the <a href="https://ballaerospace.github.io/cosmos-website/docs/v5/installation" target="_blank">Installation Guide COSMOS </a>.</p>

<h3>Simulate Satellite and TT&C</h3>

The <a href="https://github.com/nasa/cFS" target="_blank">Core Flight System (cFS) </a> is a generic flight software architecture framework used on flagship spacecraft, human spacecraft, cubesats, and <strong>Raspberry Pi</strong>. 

<a href="https://ballaerospace.github.io/cosmos-website/" target="_blank">COSMOS </a> has an integration with cFS, in which cFS is used as an external agent that sends and receives COSMOS telecommands. This integration is descript in <a href="https://ballaerospace.github.io/cosmos-website/docs/v5/cfs" target="_blank">COSMOS and NASA cFS </a>.

<h2>Build & Run</h2>

<h3>Build & Run COSMOS <a href="https://www.docker.com/" target="_blank">Docker </a> Container </h3>

<p>For run the COSMOS execute the commands in directory `COSMOS/`:</p>

    sudo ./cosmos-control.sh start

<p>With this command, a container will be created in <a href="https://www.docker.com/" target="_blank" >Docker  </a> with the application running. After all operations are done, just enter the address: <a href="http://localhost:2900" target="_blank" >http://localhost:2900  </a>.</p>

<p>To stop using the container, just use:</p>


    sudo ./cosmos-control.sh stop


<p>For more information, execute:</p>        


    sudo ./cosmos-control.sh help


<h3>Build & Run cFS</h3>

<p>To Build and Run cFS Docker Container execute the command in directory `cFS/`.</p>


    sudo docker build -t cfs .
    sudo docker run --cap-add CAP_SYS_RESOURCE --net=cosmos_default --name cfs -p1234:1234 -p1235:1235 cfs

</body>
</html>

