Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F1EC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 22:15:44 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.3711.1712960140955432854
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 12 Apr 2024 15:15:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wHwZaZ+V;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: rs@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 43CMFdOx019158;
	Fri, 12 Apr 2024 17:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1712960139;
	bh=NoNYG2ORNNM3JDnwMcOr7b9J7OkFoS9kSTu0pPYAiJw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wHwZaZ+Vbetb+6/rbiDxqsvFqlZC5Yobqjgd04rwSTTbNNUobvinAF9wZM9K+ou9F
	 s15DAXxRtvQ+L6rsiKWpX7ypJJ3CAWWnMneiRvyn85F85aEhH4u2JNEau/oPisyK1S
	 pW8zMNb386bOz6x34cgjB/gDcB7UCzrhbR9QmFOk=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 43CMFcnc086420
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 12 Apr 2024 17:15:38 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 12
 Apr 2024 17:15:38 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 12 Apr 2024 17:15:38 -0500
Received: from [128.247.81.144] (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 43CMFcVs019291;
	Fri, 12 Apr 2024 17:15:38 -0500
Message-ID: <30ccfcf2-22d4-4aeb-a3fe-137005ec2843@ti.com>
Date: Fri, 12 Apr 2024 17:15:38 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago] [PATCH] weston-init: remove my qol patches now
To: <reatmon@ti.com>, <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <17C5A80329178E6A.20885@lists.yoctoproject.org>
Content-Language: en-US, en-US-large
From: Randolph Sapp <rs@ti.com>
In-Reply-To: <17C5A80329178E6A.20885@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 12 Apr 2024 22:15:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15271

On 4/12/24 17:12, Randolph Sapp via lists.yoctoproject.org wrote:
> From: Randolph Sapp <rs@ti.com>
> 
> This reverts commit eab6e84b752b0341d1c1627527c99fa68c90bb52.
> 
> The changes introduced in this commit were accepted into oe-core and are
> no longer required here.
> 
> Signed-off-by: Randolph Sapp <rs@ti.com>
> ---
>   .../wayland/weston-init.bbappend              |  8 --
>   .../wayland/weston-init/weston-socket.sh      | 20 -----
>   .../wayland/weston-init/weston.ini            | 73 +------------------
>   3 files changed, 4 insertions(+), 97 deletions(-)
>   delete mode 100755 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> index be6b534b..4d5db58c 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> @@ -5,18 +5,10 @@ PR:append = ".arago12"
>   SRC_URI:append = " \
>       file://weston.ini \
>       file://weston-launch-calibrator.sh \
> -    file://weston-socket.sh \
>   "
>   
>   do_install:append() {
>       install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
> -
> -    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> -        install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
> -    fi
>   }
>   
>   FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
> -
> -GROUPADD_PARAM:${PN} = "-r wayland; -r render"
> -USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> deleted file mode 100755
> index 86389d63..00000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> +++ /dev/null
> @@ -1,20 +0,0 @@
> -#!/bin/sh
> -
> -# set weston variables for use with global weston socket
> -global_socket="/run/wayland-0"
> -if [ -e "$global_socket" ]; then
> -	weston_group=$(stat -c "%G" "$global_socket")
> -	if [ "$(id -u)" = "0" ]; then
> -		export WAYLAND_DISPLAY="$global_socket"
> -	else
> -		case "$(groups "$USER")" in
> -			*"$weston_group"*)
> -				export WAYLAND_DISPLAY="$global_socket"
> -				;;
> -			*)
> -				;;
> -		esac
> -	fi
> -	unset weston_group
> -fi
> -unset global_socket
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> index 8596346a..b9610fa8 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> @@ -1,10 +1,5 @@
> -# configuration file for Weston
> -
>   [core]
>   idle-time=0
> -#modules=xwayland.so,cms-colord.so
> -#shell=desktop-shell.so
> -#gbm-format=xrgb2101010
>   require-input=false
>   
>   [shell]
> @@ -12,74 +7,14 @@ locking=false
>   animation=zoom
>   panel-position=top
>   startup-animation=fade
> -#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> -#background-color=0xff002244
> -#background-type=tile
> -#clock-format=minutes
> -#panel-color=0x90ff0000
> -#locking=true
> -#animation=zoom
> -#startup-animation=fade
> -#binding-modifier=ctrl
> -#num-workspaces=6
> -#cursor-theme=whiteglass
> -#cursor-size=24
> -
> -#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
> -#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
> -#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
> -#animation=fade
> -
> -#[launcher]
> -#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> -#path=/usr/bin/gnome-terminal
> -
> -#[launcher]
> -#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> -#path=/usr/bin/weston-terminal
> -
> -#[launcher]
> -#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> -#path=/usr/bin/google-chrome
> -
> -#[launcher]
> -#icon=/usr/share/icons/gnome/24x24/apps/arts.png
> -#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
> -
> -#[input-method]
> -#path=/usr/libexec/weston-keyboard
> -
> -#[output]
> -#name=LVDS1
> -#mode=1680x1050
> -#transform=90
> -#icc_profile=/usr/share/color/icc/colord/Bluish.icc
> -
> -#[output]
> -#name=VGA1
> -#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> -#transform=flipped
> -
> -#[output]
> -#name=X1
> -#mode=1024x768
> -#transform=flipped-90
>   
>   [libinput]
>   touchscreen_calibrator=true
> -#enable_tap=true
> -
> -#[touchpad]
> -#constant_accel_factor = 50
> -#min_accel_factor = 0.16
> -#max_accel_factor = 1.0
> -
> -[screen-share]
> -command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> -
> -#[xwayland]
> -#path=/usr/bin/Xwayland
>   
>   [autolaunch]
>   # launch the calibrator on startup if a touchscreen is detected
>   path=/usr/bin/weston-launch-calibrator
> +
> +[screensaver]
> +# Uncomment path to disable screensaver
> +#path=@libexecdir@/weston-screensaver

Ignore this version, forgot to add my confirm flag and check tags before 
sending. Sorry

