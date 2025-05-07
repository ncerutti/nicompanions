#!/usr/bin/bash

function instructions () {
	echo ""
	echo "This is a utility script to help you delete all podman containers at once."
	echo "If you feel wrathful, you can delete images,volumes and networks too."
	echo ""
	echo "The options generously offered to you are:"
	echo ""
	echo "-a | --all				will delete images, volumes, and networks"
	echo "-i | --images				will delete all images"
	echo "-v | --volumes				will delete all volumes"
	echo "-n | --networks				will delete all networks"
	echo "-h | --help				will show this message. But you knew that already, didn't you?"
	echo ""
	exit 1
}

while [ "$1" != "" ]; do
  case $1 in
    -a|--all)
      remove_images=TRUE
      remove_volumes=TRUE
      remove_networks=TRUE
      shift
      ;;

    -i|--images)
      remove_images=TRUE
      shift
      ;;

    -v|--volumes)
      remove_volumes=TRUE
      shift
      ;;

    -n|--networks)
      remove_networks=TRUE
      shift
      ;;

    -h|--help)
      instructions
      exit 0
      ;;

    *)
      echo "Invalid option: $1"
      instructions
      ;;

  esac
done

echo ""
echo "Removing containers..."
echo ""

podman ps -a
podman stop -a
podman rm -a

echo -e "\e[32mContainers stopped and removed!\e[0m"
echo ""
echo "Removing pods..."
echo ""

podman pod stop -a
podman pod kill -a
podman pod rm -a -f
podman pod prune -f

echo -e "\e[32mPods stopped and removed!\e[0m"
echo ""

if [ "$remove_images" ]
  then
    echo "Removing images..."
    echo ""
    podman rmi -a -f
    podman images --all  
    echo ""
    echo -e "\e[32mImages removed!\e[0m"
    echo ""
fi

if [ "$remove_networks" ]
  then
	echo "Removing networks..."
	echo ""
    podman network prune
    podman network ls
    echo ""
    echo -e "\e[32mNetworks removed!\e[0m"
    echo "If you see some network beside podman, we have a problem - that means some container is still running!"
    echo ""
fi

if [ "$remove_volumes" ]
  then
    echo "Removing volumes..."
    echo ""
    podman volume rm --all -f
    podman volume ls
    echo ""
    echo -e "\e[32mVolumes removed!\e[0m"
    echo "If you see some volume remaining, we have a problem"
fi
echo ""
echo -e "\e[32mDone!\e[0m I hope you enjoyed this script, like and subscribe!"
echo ""
exit 0
