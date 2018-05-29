#!/bin/sh

if [ -d /home/lounge/data ]; then
    # pre 3.0.0 the volume mount point was defined at /home/lounge/data
    >&2 cat <<EOF
!!! ATTENTION !!!
Detected mounted volume at old path: /home/lounge/data.
The new path is: /var/opt/thelounge. Please update your volume bindings!
EOF
    exit 1
fi

# Create user
# Either use the LOCAL_USER_ID if passed in at runtime or fallback to 1000
USER_ID=${LOCAL_USER_ID:-1000}
adduser -D -H -g "" -u $USER_ID thelounge

# Make sure $DATADIR is owned by the thelounge user.
# This effects ownership of the mounted directory on the host machine too.
echo "Setting necessary permissions..."
chown -R thelounge:thelounge "/var/opt/thelounge"

echo "Starting with UID : $USER_ID"
exec sudo -u thelounge thelounge start
