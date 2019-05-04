#!/system/bin/sh

# Copyright (c) 2019 Jaymin Suthar. All rights reserved.
#
# This file is part of "Advanced Charging Switch (ACSwitch)".
#
# ACSwitch is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, only version 3 of the License.
#
# ACSwitch is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with ACSwitch.  If not, see <https://www.gnu.org/licenses/>.

readonly CACHE_FILE=/cache/ACSwitch.tempfile

function print {
	echo "- $1"
}

function write {
	echo $1 >$TRIGGER
	sleep 1
}

function isCharging {
	grep -q '=Charging$' $CHECK_UEVENT
}

exec 2>/cache/ACSwitch.logfile

print "Indexing kernel files"

find /sys -type f -name uevent >$CACHE_FILE

print "Finding usable switch"

while read CHECK_UEVENT; do
	if grep -q '^POWER_SUPPLY_NAME=.attery$' $CHECK_UEVENT; then

		while read MAIN_UEVENT; do
			if grep -q '^POWER_SUPPLY_NAME=' $MAIN_UEVENT; then

				for TRIGGER in $(dirname $MAIN_UEVENT)/*; do
					if ls -l $TRIGGER | grep -Eq '^\-[rx\-]+w[rwx\-]* '; then

						case $(cat $TRIGGER) in
							1)        POS_VAL=1        && NEG_VAL=0        ;;
							0)        POS_VAL=0        && NEG_VAL=1        ;;
							on)       POS_VAL=on       && NEG_VAL=off      ;;
							off)      POS_VAL=off      && NEG_VAL=on       ;;
							true)     POS_VAL=true     && NEG_VAL=false    ;;
							false)    POS_VAL=false    && NEG_VAL=true     ;;
							enable)   POS_VAL=enable   && NEG_VAL=disable  ;;
							disable)  POS_VAL=disable  && NEG_VAL=enable   ;;
							enabled)  POS_VAL=enabled  && NEG_VAL=disabled ;;
							disabled) POS_VAL=disabled && NEG_VAL=enabled  ;;
							*) continue ;;
						esac

						write $NEG_VAL

						if isCharging; then
							TEMPVAR=$POS_VAL
							POS_VAL=$NEG_VAL
							NEG_VAL=$TEMPVAR
							write $NEG_VAL
						fi

						if ! isCharging; then
							write $POS_VAL
							if isCharging; then
								echo "Found: <$TRIGGER> <$POS_VAL> <$NEG_VAL>"
							fi
						fi
					fi
				done
			fi
		done <$CACHE_FILE
	fi
done <$CACHE_FILE
