* Known limitations
    * Only the *.local location is detected automatically. To use the domain, you need to first manually connect to the server using the command `open THE_CONNECTION_STRING` on your Mac
    * There is currently no granular control for disallowing connections from hosts (i.e anyone with the username, password and domain can connect to the Time Machine Volume)
        * Control is now more granular: access is limited to yunohost users.
    * By default TimeMachine uses all disk space available to it. This can be controlled by a commented setting in `/etc/smb/smb.d/timemachine.conf`.
        * Recommended is using 2-4x the too be backed up dataset, depending on how frequently the dataset changes. (More changes -> greater ratio)
* Connecting manually:
    * The connection string format is also sent via e-mail `smb://user:password@IP_OR_DOMAIN/timemachine`
    * In Finder, use `Command+K` and enter the connection string. If `timemachine` is greyed out, you might need to unmount the volume using the command `sudo umount /Volumes/timemachine` first

* Disallowing connections from outside network:
    * Edit either `/etc/samba/smb.conf` or `/etc/smb/smb.d/timemachine.conf` (An option might be added in the future)