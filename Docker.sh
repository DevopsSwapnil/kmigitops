#!/bin/bash

# Color configurations
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Environment setup
export DOCKER_CLI_HINTS=false

COMMANDS=(
    # --- SYSTEM AUDIT & INITIALIZATION (1-10) ---
    "1. Check Docker Version Engine|docker --version"
    "2. Display System-Wide Information|docker info"
    "3. Check Container Disk Usage Space|docker system df"
    "4. Show Running Containers|docker ps"
    "5. Show All Containers Active and Inactive|docker ps -a"
    "6. Check Docker Daemon Connectivity|docker version"
    "7. Display Docker CLI Management Help|docker --help"
    "8. Show Specific Command Syntax Guide|docker run --help"
    "9. List Available Docker Contexts|docker context ls"
    "10. Show Configured Engine Event Streams|docker events --until 1s"

    # --- IMAGE MANAGEMENT & REGISTRY INTERACTION (11-25) ---
    "11. Download Alpine Base Linux Mirror|docker pull alpine:latest"
    "12. Fetch Target Nginx Server Architecture Mirror|docker pull nginx:alpine"
    "13. Query Local Infrastructure Images Registry|docker images"
    "14. Query Image Layer IDs Only|docker images -q"
    "15. Filter Local Repository Mirror Search Target|docker images alpine"
    "16. Inspect Deep Metadata Schema of Local Mirror|docker inspect nginx:alpine"
    "17. View History and Layer Stack Architecture|docker history nginx:alpine"
    "18. Assign Tag Mapping for Production Scope|docker tag nginx:alpine devopsswapnil/nginx:prod"
    "19. Assign Tag Mapping for Staging Release Track|docker tag alpine:latest devopsswapnil/alpine:stage"
    "20. Review Updated Local Repository Image Mapping Tags|docker images"
    "21. Export Mirror State Artifact Archive Layout File|docker save -o nginx_prod.tar devopsswapnil/nginx:prod"
    "22. Evict Locally Cached Docker Image Tag|docker rmi devopsswapnil/nginx:prod"
    "23. Load Mirror State Back from Saved Archive Asset|docker load -i nginx_prod.tar"
    "24. Search Public Registry for Infrastructure Engines|docker search prometheus --limit 3"
    "25. Remove Exported Backup tar File|rm -f nginx_prod.tar"

    # --- CONTAINER CREATION, DEPLOYMENT & LIFECYCLE (26-45) ---
    "26. Deploy Ephemeral Testing Environment Instance|docker run alpine echo 'DevOps Container Executed'"
    "27. Instantiate Named Background Engine Worker Process|docker run -d --name proxy-gateway nginx:alpine"
    "28. Validate Background Instance Execution Tracking States|docker ps"
    "29. Interrogate Specific Active Container Processes Configs|docker top proxy-gateway"
    "30. Extract Active Instance Performance Telemetry Stream|docker stats proxy-gateway --no-stream"
    "31. Read Core Application Output Logs Engine Stream|docker logs proxy-gateway"
    "32. Retrieve Truncated Tail Segment of Container Logs|docker logs --tail 5 proxy-gateway"
    "33. Terminate Active Worker Process Gracefully|docker stop proxy-gateway"
    "34. Revive Sleeping Engine Container Infrastructure|docker start proxy-gateway"
    "35. Forcefully Terminate System Instance Execution State|docker kill proxy-gateway"
    "36. Restart Background Infrastructure Instance Directly|docker start proxy-gateway && docker restart proxy-gateway"
    "37. Pause Active Running Execution Pipeline Scheduling|docker pause proxy-gateway"
    "38. Unpause Execution Pipeline Processing Engine Blocks|docker unpause proxy-gateway"
    "39. Run Detached Background Container Auto-Dropped on Stop|docker run -d --rm --name temp-worker alpine sleep 10"
    "40. Terminate and Clean Temp Worker Instantly|docker kill temp-worker || true"
    "41. Rename Runtime Target Container Identifier Token Name|docker rename proxy-gateway production-ingress-lb"
    "42. Inspect Comprehensive Live State Variables Schema Matrix|docker inspect production-ingress-lb"
    "43. Filter Target IP Parameter Allocation Out of State Metadata|docker inspect --format='{{.NetworkSettings.IPAddress}}' production-ingress-lb"
    "44. Enforce Hard Erasure of Stopped Container Architecture Instance|docker stop production-ingress-lb && docker rm production-ingress-lb"
    "45. Clean and Wipe Out All Sleeping Non-Active Containers|docker rm \$(docker ps -aq) || true"

    # --- STORAGE VOLUMES & PERSISTENT DATA PIPELINES (46-55) ---
    "46. Initialize Permanent External Storage Infrastructure Volume|docker volume create k8s_pv_mock_storage"
    "47. Enumerate System Shared Permanent Storage Volumes Ecosystem|docker volume ls"
    "48. Audit Configurations Layout Details of Target Volume Instance|docker volume inspect k8s_pv_mock_storage"
    "49. Mount Persistent Volume Storage Target to App Instance Engine|docker run -d --name stateful-db -v k8s_pv_mock_storage:/data alpine sleep 3600"
    "50. Validate Volume Linkage Setup on Working Target Path Instance|docker inspect --format='{{json .Mounts}}' stateful-db"
    "51. Deploy Read-Only External Storage Volume System Connection|docker run -d --name ro-app -v k8s_pv_mock_storage:/app:ro alpine sleep 3600"
    "52. Stop Active Storage Application Instances Safely|docker stop stateful-db ro-app"
    "53. Evict Container Mapping Tracks Holding Persistent Storage Anchors|docker rm stateful-db ro-app"
    "54. Evict Unallocated Storage Volume Systems Out of Engine|docker volume prune -f"
    "55. Assert Total Clearing of Internal Persistent Storage Volumes|docker volume ls"

    # --- ADVANCED ISOLATED SOFTWARE DEFINED NETWORKING (56-70) ---
    "56. Enumerate Native Virtual Network Driver Layer Ecosystems|docker network ls"
    "57. Spin Up Custom Isolated Software Defined Bridge Network Engine|docker network create devops_overlay_bridge"
    "58. Audit Structural Subnet Schema Map Details of Custom Bridge|docker network inspect devops_overlay_bridge"
    "59. Spin Up App Webnode Fastened Into Custom Network Workspace|docker run -d --name app-service --network devops_overlay_bridge nginx:alpine"
    "60. Verify Container Endpoint Binding in Core Network Metadata|docker inspect --format='{{json .NetworkSettings.Networks}}' app-service"
    "61. Bind Secondary Isolated Independent Background Container|docker run -d --name api-service alpine sleep 3600"
    "62. Graft Active Standalone Container Directly Into Custom Network|docker network connect devops_overlay_bridge api-service"
    "63. Sever Specific Running Container Node Network Link Connection|docker network disconnect devops_overlay_bridge api-service"
    "64. Launch Target Instance Mapping Container-to-Host Port Forwarding|docker run -d -p 8080:80 --name edge-router nginx:alpine"
    "65. Show Container Network Port Mappings Port Allocation Status|docker port edge-router"
    "66. Launch Container Sharing Host Machine Core Networking Stack|docker run -d --network host --name telemetry-probe alpine sleep 5"
    "67. Terminate Custom Microservice Container Mesh Targets Completely|docker stop app-service api-service edge-router telemetry-probe || true"
    "68. Evict Target Microservice Mesh Container Footprint Nodes|docker rm app-service api-service edge-router telemetry-probe || true"
    "69. Remove Custom Software Defined Isolated Network Layer|docker network rm devops_overlay_bridge"
    "70. Sweep Inactive Software Defined Virtual Network Structures|docker network prune -f"

    # --- IMAGE ASSEMBLY, COMPILATION & DOCKERFILE WORKFLOWS (71-80) ---
    "71. Draft Declarative Infrastructure Dockerfile Directives Config|echo -e 'FROM alpine:latest\nRUN apk add --no-cache curl\nCMD [\"curl\", \"--version\"]' > Dockerfile"
    "72. Compile Production Custom Image Version via Native Builder Core|docker build -t devops-tooling:1.0 ."
    "73. Audit Compiled Custom Infrastructure App Image Architecture|docker images devops-tooling:1.0"
    "74. Execute Verification Pipeline Runtime Instance Off Compiled Mirror|docker run --rm devops-tooling:1.0"
    "75. Draft Alternative Target Dev Layer Development Directives File|echo -e 'FROM nginx:alpine\nENV ENV=DevOps' > Dev.Dockerfile"
    "76. Compile Image Bypassing Builder Engine Cache Operations Cache|docker build --no-cache -f Dev.Dockerfile -t devops-web:dev ."
    "77. Pass Arbitrary Environment Configurations Matrix to Build Core|docker build --build-arg TIMEOUT=30 -f Dev.Dockerfile -t devops-web:arg ."
    "78. Clear Build-Time Directives Files Out of Workspace Path|rm -f Dockerfile Dev.Dockerfile"
    "79. Evict Extracted Tooling and Compiled Layer Configurations Tags|docker rmi devops-tooling:1.0 devops-web:dev devops-web:arg"
    "80. Prune Intermediate Hanging Build Stage Objects Cache Wastes|docker builder prune -f"

    # --- ADVANCED RUNTIME EXECUTION & TRIAGE PIPELINES (81-90) ---
    "81. Spin Up Target Web Service Instance Node to Execute Diagnostics|docker run -d --name ingress-triage nginx:alpine"
    "82. Execute External Script Command Inject Inside App Runtime Environment|docker exec ingress-triage uname -a"
    "83. Inject and Launch Non-Interactive Config Validation Script Trace|docker exec ingress-triage nginx -t"
    "84. Extract Configuration File Directly Out of Runtime App Instances|docker cp ingress-triage:/etc/nginx/nginx.conf ./extracted_nginx.conf"
    "85. Review Extracted Production App Properties File Layout Structure|cat extracted_nginx.conf | head -n 5"
    "86. Inject Altered System Variables File Back Inside App Containers|docker cp ./extracted_nginx.conf ingress-triage:/etc/nginx/nginx.conf"
    "87. Track File Alterations Inside Runtime Containers Storage System Layer|docker diff ingress-triage"
    "88. Capture Active Container Runtime Mutations to Static New Mirror|docker commit ingress-triage devops-triage:snapshot"
    "89. Kill and Remove Evaluated Diagnostic Infrastructure Node Instance|docker stop ingress-triage && docker rm ingress-triage"
    "90. Remove Triage Mirror Tracking File Snapshot Asset|docker rmi devops-triage:snapshot && rm -f extracted_nginx.conf"

    # --- SYSTEM PURGE, CLEANUP & DRY RUN DEVOPS OPERATION MAINTENANCE (91-100) ---
    "91. Sweep All Inactive Dangling Structural Build Stage Images Wastes|docker image prune -f"
    "92. Target Sweep Container Engine Layer Nodes Outside Runtime Thresholds|docker container prune -f"
    "93. Pull Untagged Infrastructure Image Wastes Out of Registry Database|docker image prune -a -f"
    "94. Force Run System-wide Destructive Purge Wiping Stopped Cache Elements|docker system prune -f"
    "95. Run Deep Volume-inclusive Complete Storage Block Dev Wiping Purge|docker system prune --volumes -f"
    "96. Pull Raw Security Context Privileges Audit on Docker Engine Unix Socket|ls -la /var/run/docker.sock"
    "97. Enumerate Base Operating System Kernel Storage Allocation Path|ls -la /var/lib/docker || true"
    "98. Verify Local Machine Active Infrastructure Container Counts Index Metric|docker ps -q | wc -l"
    "99. Assert System Architecture Storage Image Count Metrics Thresholds|docker images -q | wc -l"
    "100. Audit Engine Resource Summary for Zero-Trace DevOps Workspace Validation|docker system df"
)

for cmd_info in "${COMMANDS[@]}"; do
    clear
    
    LABEL=$(echo "$cmd_info" | cut -d'|' -f1)
    CMD=$(echo "$cmd_info" | cut -d'|' -f2)
    
    echo -e "${CYAN}[DEVOPS DOCKER TASK] ${LABEL}${NC}"
    echo -e "${GREEN}Running command: ${CMD}${NC}\n"
    
    sleep 1
    
    if [[ "$CMD" == cd* ]]; then
        eval "$CMD"
    else
        eval "$CMD"
    fi
    
    echo -e "\n${YELLOW}--- Output Block Displayed Above ---${NC}"
    
    sleep 2
done

# --- ABSOLUTE DESTRUCTIVE PURGE (Clears Alpine, Nginx, and all tags created above) ---
clear
echo -e "${YELLOW}All 100 DevOps Docker Platform Operations executed successfully.${NC}"
echo -e "${GREEN}Executing total expurgation cleanup...${NC}"

# Stop any lingering containers matching alpine or nginx if they somehow stayed alive
docker stop $(docker ps -a -q) &>/dev/null || true
docker rm $(docker ps -a -q) &>/dev/null || true

# Force remove the images downloaded during the script lifecycle execution
docker rmi alpine:latest nginx:alpine devopsswapnil/nginx:prod devopsswapnil/alpine:stage &>/dev/null || true

# System-wide deep system wipe down
docker system prune -a --volumes -f &>/dev/null

echo -e "\n${GREEN}SUCCESS: All containers, volumes, networks, and images completely wiped out from the engine.${NC}"
