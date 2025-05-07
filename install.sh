#!/usr/bin/bash

echo ""
read -p "Do you want to install podman-destroy? (y/n) " yesno


if [[ "$yesno" == "y" || "$yesno" == "Y" ]]; then
  echo ""
  echo "Installing podman-destroy..."
  echo ""

  if cp ./podman-destroy/podman-destroy.sh ${HOME}/.local/bin/podman-destroy; then
    echo -e "\e[32mSuccessfully installed podman-destroy\e[0m"
  else
    echo -e "\e[31mFailed to install podman-destroy\e[0m"
  fi
fi

echo ""
read -p "Do you want to install gentext? (y/n) " yesno

if [[ "$yesno" == "y" || "$yesno" == "Y" ]]; then
  echo ""
  echo "Installing gentext..."
  echo ""

  if cp ./gentext/gentext.bin ${HOME}/.local/bin/gentext; then
    echo -e "\e[32mSuccessfully installed gentext\e[0m"
  else
    echo -e "\e[31mFailed to install gentext\e[0m"
  fi
fi

echo ""
echo "done"
