#!/system/bin/sh

# Copyright (c) 2019 Jaymin Suthar. All rights reserved.
#
# This file is part of "Input Power Control (IPControl)".
#
# IPControl is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, only version 3 of the License.
#
# IPControl is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with IPControl.  If not, see <https://www.gnu.org/licenses/>.

MODDIR=${0%/*}

IMGDIR=/sbin/.core/img
UPDDIR=/data/adb/modules_update
id=IPControl

if [ -e ${UPDDIR}/${id}/ipc ]; then

    ln -sf ${UPDDIR}/${id}/ipc /sbin/ipc
    HOME=${UPDDIR}/${id}

elif [ -e ${IMGDIR}/${id}/rclone-wrapper.sh ]; then

    ln -sf ${IMGDIR}/${id}/ipc /sbin/ipc
    HOME=${IMGDIR}/${id}

else

    ln -sf ${MODDIR}/ipc /sbin/ipc
    HOME=${MODDIR}

fi


if $HOME/ipc -d launch >> /dev/null 2>&1; then

echo "✓ Daemon started successfully"

else

echo "* Daemon failed to start"

fi
