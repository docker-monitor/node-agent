# node agent

## Description
    It`s a node agent for docker monitor, it`s help auto register you exporter service to consul by consulgw. For docker monitor has two type exporter by default, you can see expoter part.

## Run

* Build docker images from source
    ```bash
    git clone https://github.com/docker-monitor/node-agent.git ${your_workspace}
    cd ${golang_workspace}/node-agent
    docker build -t node-agent:v1.0.0 .
    ```
* Start
> when you start node-agent, you need make sure your node exporter and consulge has running.

    * copy docker-compose.yaml to your docker server
    * start
        ```bash
        docker-compose up -d
        ```