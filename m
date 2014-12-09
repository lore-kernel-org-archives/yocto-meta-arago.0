Return-Path: <ceh@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E59CD52981
	for <meta-arago@arago-project.org>;
	Tue,  9 Dec 2014 15:47:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB9Fl7Xg007549
	for <meta-arago@arago-project.org>; Tue, 9 Dec 2014 09:47:07 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB9Fl6ZY024888
	for <meta-arago@arago-project.org>; Tue, 9 Dec 2014 09:47:06 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Dec 2014 09:47:06 -0600
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB9Fl6DV010703	for
	<meta-arago@arago-project.org>; Tue, 9 Dec 2014 09:47:06 -0600
Message-ID: <5487197A.8020309@ti.com>
Date: Tue, 9 Dec 2014 10:47:06 -0500
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1418091615-28779-1-git-send-email-denis@denix.org>
In-Reply-To: <1418091615-28779-1-git-send-email-denis@denix.org>
Subject: Re: [PATCH] weston-init: update initscript to store calibration on SD card
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
X-List-Received-Date: Tue, 09 Dec 2014 15:47:08 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Carlos Hernandez <ceh@ti.com>

On 12/08/2014 09:20 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   .../recipes-graphics/wayland/weston-init.bbappend  |  2 +-
>   .../recipes-graphics/wayland/weston-init/init      | 43 +++++++++++++++++-----
>   2 files changed, 35 insertions(+), 10 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> index 0d76e3b..7825618 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = "-arago2"
> +PR_append = "-arago3"
>   
>   FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> index 834de4d..b2a2567 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> @@ -32,7 +32,7 @@ case "$1" in
>   
>           # This is all a nasty hack
>           if test -z "$XDG_RUNTIME_DIR"; then
> -                export XDG_RUNTIME_DIR=/run/user/root
> +            export XDG_RUNTIME_DIR=/run/user/root
>           fi
>   
>           if [ ! -d "$XDG_RUNTIME_DIR" ] ; then
> @@ -42,23 +42,48 @@ case "$1" in
>   
>           openvt -s weston
>   
> -        # Handle touchscreen calibration
> +        # If there's no touchscreen device available, done
>           if [ ! -e /dev/input/touchscreen0 ] ; then
> -                exit 0
> +            exit 0
>           fi
>   
> -        if [ ! -f $WS_CALUDEV_FILE ] ; then
> +        # If it was already calibrated, done
> +        if [ -f "$WS_CALUDEV_FILE" ] ; then
> +            exit 0
> +        fi
> +
> +        # Check if SD card is mounted
> +        mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> +        if [ "$?" = "0" ] ; then
> +            SD_MOUNTED="1"
> +        else
> +            SD_MOUNTED="0"
> +        fi
> +
> +        # Check if SD card has a calibration rules file
> +        SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
> +        if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
> +            # Copy it over to udev location
> +            cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
> +        else
> +            # Run a calibration app and save output to udev rules
>               echo -n "Calibrating touchscreen (first time only)"
>               sleep 1
>               CAL_VALUES=`weston-calibrator|cut -c21-`
>               echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
>               echo "."
> -            udevadm control --reload
> -            udevadm trigger
> -            killproc weston
> -            sleep 1
> -            openvt -s weston
> +            # Copy it back to SD
> +            if [ "$SD_MOUNTED" = "1" ] ; then
> +                cp "$WS_CALUDEV_FILE" "$SD_CALUDEV_FILE"
> +            fi
>           fi
> +
> +        # Reload and re-run udev rules and restart weston
> +        udevadm control --reload
> +        udevadm trigger
> +        killproc weston
> +        sleep 1
> +        openvt -s weston
>     ;;
>   
>     stop)


