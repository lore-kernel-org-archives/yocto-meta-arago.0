Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 1B8AA5298F
	for <meta-arago@arago-project.org>;
	Fri, 31 Jan 2014 02:01:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0V21ad2025238
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 20:01:36 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0V21akR021880
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 20:01:36 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 20:01:36 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0V21aKB023798	for
	<meta-arago@arago-project.org>; Thu, 30 Jan 2014 20:01:36 -0600
Date: Thu, 30 Jan 2014 21:01:35 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140131020135.GI6814@edge>
References: <1391128108-3856-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1391128108-3856-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 1/2] udev-extraconf: overlay mount.sh as is from oe-core/dylan
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Fri, 31 Jan 2014 02:01:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

There's a bug here, I'm test v2 now... :)

On Thu, Jan 30, 2014 at 07:28:27PM -0500, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> This will be modified to fix SD mounting issues.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>  .../recipes-core/udev/udev-extraconf/mount.sh      | 76 ++++++++++++++++++++++
>  .../recipes-core/udev/udev-extraconf_1.0.bb        |  4 ++
>  2 files changed, 80 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
>  create mode 100644 meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bb
> 
> diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
> new file mode 100644
> index 0000000..d1419ed
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev-extraconf/mount.sh
> @@ -0,0 +1,76 @@
> +#!/bin/sh
> +#
> +# Called from udev
> +#
> +# Attempt to mount any added block devices and umount any removed devices
> +
> +
> +MOUNT="/bin/mount"
> +PMOUNT="/usr/bin/pmount"
> +UMOUNT="/bin/umount"
> +for line in `grep -v ^# /etc/udev/mount.blacklist`
> +do
> +	if [ ` expr match "$DEVNAME" "$line" ` -gt 0 ];
> +	then
> +		logger "udev/mount.sh" "[$DEVNAME] is blacklisted, ignoring"
> +		exit 0
> +	fi
> +done
> +
> +automount() {	
> +	name="`basename "$DEVNAME"`"
> +
> +	! test -d "/media/$name" && mkdir -p "/media/$name"
> +	# Silent util-linux's version of mounting auto
> +	if [ "x`readlink $MOUNT`" = "x/bin/mount.util-linux" ] ;
> +	then
> +		MOUNT="$MOUNT -o silent"
> +	fi
> +	
> +	if ! $MOUNT -t auto $DEVNAME "/media/$name"
> +	then
> +		#logger "mount.sh/automount" "$MOUNT -t auto $DEVNAME \"/media/$name\" failed!"
> +		rm_dir "/media/$name"
> +	else
> +		logger "mount.sh/automount" "Auto-mount of [/media/$name] successful"
> +		touch "/tmp/.automount-$name"
> +	fi
> +}
> +	
> +rm_dir() {
> +	# We do not want to rm -r populated directories
> +	if test "`find "$1" | wc -l | tr -d " "`" -lt 2 -a -d "$1"
> +	then
> +		! test -z "$1" && rm -r "$1"
> +	else
> +		logger "mount.sh/automount" "Not removing non-empty directory [$1]"
> +	fi
> +}
> +
> +if [ "$ACTION" = "add" ] && [ -n "$DEVNAME" ] && [ -n "$ID_FS_TYPE" ]; then
> +	if [ -x "$PMOUNT" ]; then
> +		$PMOUNT $DEVNAME 2> /dev/null
> +	elif [ -x $MOUNT ]; then
> +    		$MOUNT $DEVNAME 2> /dev/null
> +	fi
> +	
> +	# If the device isn't mounted at this point, it isn't
> +	# configured in fstab (note the root filesystem can show up as
> +	# /dev/root in /proc/mounts, so check the device number too)
> +	if expr $MAJOR "*" 256 + $MINOR != `stat -c %d /`; then
> +		grep -q "^$DEVNAME " /proc/mounts || automount
> +	fi
> +fi
> +
> +
> +
> +if [ "$ACTION" = "remove" ] && [ -x "$UMOUNT" ] && [ -n "$DEVNAME" ]; then
> +	for mnt in `cat /proc/mounts | grep "$DEVNAME" | cut -f 2 -d " " `
> +	do
> +		$UMOUNT $mnt
> +	done
> +	
> +	# Remove empty directories from auto-mounter
> +	name="`basename "$DEVNAME"`"
> +	test -e "/tmp/.automount-$name" && rm_dir "/media/$name"
> +fi
> diff --git a/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bb b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bb
> new file mode 100644
> index 0000000..c0ab069
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/udev/udev-extraconf_1.0.bb
> @@ -0,0 +1,4 @@
> +# look for files in this layer first
> +FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> +
> +PR_append = "-arago0"
> -- 
> 1.8.3.2
> 

