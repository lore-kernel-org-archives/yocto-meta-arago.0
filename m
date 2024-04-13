Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62419C4345F
	for <webhook@archiver.kernel.org>; Sat, 13 Apr 2024 16:09:59 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.14857.1713024588761265313
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 13 Apr 2024 09:09:49 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B79EE40CB8;
	Sat, 13 Apr 2024 16:09:47 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id q6bjVNmP3NJu; Sat, 13 Apr 2024 16:09:47 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-87-159.washdc.fios.verizon.net [100.15.87.159])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 1C50B40C2A;
	Sat, 13 Apr 2024 16:09:45 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2A03E163F07; Sat, 13 Apr 2024 12:09:44 -0400 (EDT)
Date: Sat, 13 Apr 2024 12:09:44 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Ryan Eatmon <reatmon@ti.com>
Cc: Randolph Sapp <rs@ti.com>, meta-arago@lists.yoctoproject.org
Subject: Re: [PATCH] weston-init: remove my qol patches now
Message-ID: <20240413160944.GC28791@denix.org>
References: <20240412221240.254965-1-rs@ti.com>
 <20240412222040.GB28791@denix.org>
 <D0IML3E3KHGA.2FKN91Q2W4JY9@ti.com>
 <ce72206f-b210-41ba-808c-6b44f5ac71e1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ce72206f-b210-41ba-808c-6b44f5ac71e1@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 13 Apr 2024 16:09:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15275

On Fri, Apr 12, 2024 at 09:16:51PM -0500, Ryan Eatmon wrote:
> 
> 
> On 4/12/2024 9:05 PM, Randolph Sapp wrote:
> >On Fri Apr 12, 2024 at 5:20 PM CDT, Denys Dmytriyenko wrote:
> >>On Fri, Apr 12, 2024 at 05:12:40PM -0500, rs@ti.com wrote:
> >>>From: Randolph Sapp <rs@ti.com>
> >>>
> >>>This reverts commit eab6e84b752b0341d1c1627527c99fa68c90bb52.
> >>>
> >>>The changes introduced in this commit were accepted into oe-core and are
> >>>no longer required here.
> >>
> >>Which branch?
> >
> >
> >Sorry, I sent a follow-up to this saying to ignore this version because it
> >wasn't tagged properly. Sorry again about that. The offending commit is on the
> >master and scarthgap branches. Here's a link to the proper copy:
> >
> >https://lists.yoctoproject.org/g/meta-arago/message/15270
> >
> >It sounds like you may be hinting at some syntax I'm missing about indicating
> >branch name in the revert message, though...
> >
> >There's not anything I'm forgetting is there?
> 
> I believe he was referring to the subject line that has niether
> [meta-arago] nor [scarthgap/master].

[meta-arago] is added automatically by the mailing list.
The branch tag is manually added.
But I was just asking whether this got into scarthgap and/or got backported to 
kirkstone, or master-only.


> >>>Signed-off-by: Randolph Sapp <rs@ti.com>
> >>>---
> >>>  .../wayland/weston-init.bbappend              |  8 --
> >>>  .../wayland/weston-init/weston-socket.sh      | 20 -----
> >>>  .../wayland/weston-init/weston.ini            | 73 +------------------
> >>>  3 files changed, 4 insertions(+), 97 deletions(-)
> >>>  delete mode 100755 meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> >>>
> >>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >>>index be6b534b..4d5db58c 100644
> >>>--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >>>+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >>>@@ -5,18 +5,10 @@ PR:append = ".arago12"
> >>>  SRC_URI:append = " \
> >>>      file://weston.ini \
> >>>      file://weston-launch-calibrator.sh \
> >>>-    file://weston-socket.sh \
> >>>  "
> >>>  do_install:append() {
> >>>      install -Dm755 weston-launch-calibrator.sh ${D}/${bindir}/weston-launch-calibrator
> >>>-
> >>>-    if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
> >>>-        install -D -p -m0644 ${WORKDIR}/weston-socket.sh ${D}${sysconfdir}/profile.d/weston-socket.sh
> >>>-    fi
> >>>  }
> >>>  FILES:${PN}:append = "${bindir}/weston-launch-calibrator"
> >>>-
> >>>-GROUPADD_PARAM:${PN} = "-r wayland; -r render"
> >>>-USERADD_PARAM:${PN} = "--home /home/weston --shell /bin/sh --user-group -G video,input,render weston"
> >>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> >>>deleted file mode 100755
> >>>index 86389d63..00000000
> >>>--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston-socket.sh
> >>>+++ /dev/null
> >>>@@ -1,20 +0,0 @@
> >>>-#!/bin/sh
> >>>-
> >>>-# set weston variables for use with global weston socket
> >>>-global_socket="/run/wayland-0"
> >>>-if [ -e "$global_socket" ]; then
> >>>-	weston_group=$(stat -c "%G" "$global_socket")
> >>>-	if [ "$(id -u)" = "0" ]; then
> >>>-		export WAYLAND_DISPLAY="$global_socket"
> >>>-	else
> >>>-		case "$(groups "$USER")" in
> >>>-			*"$weston_group"*)
> >>>-				export WAYLAND_DISPLAY="$global_socket"
> >>>-				;;
> >>>-			*)
> >>>-				;;
> >>>-		esac
> >>>-	fi
> >>>-	unset weston_group
> >>>-fi
> >>>-unset global_socket
> >>>diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> >>>index 8596346a..b9610fa8 100644
> >>>--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> >>>+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/weston.ini
> >>>@@ -1,10 +1,5 @@
> >>>-# configuration file for Weston
> >>>-
> >>>  [core]
> >>>  idle-time=0
> >>>-#modules=xwayland.so,cms-colord.so
> >>>-#shell=desktop-shell.so
> >>>-#gbm-format=xrgb2101010
> >>>  require-input=false
> >>>  [shell]
> >>>@@ -12,74 +7,14 @@ locking=false
> >>>  animation=zoom
> >>>  panel-position=top
> >>>  startup-animation=fade
> >>>-#background-image=/usr/share/backgrounds/gnome/Aqua.jpg
> >>>-#background-color=0xff002244
> >>>-#background-type=tile
> >>>-#clock-format=minutes
> >>>-#panel-color=0x90ff0000
> >>>-#locking=true
> >>>-#animation=zoom
> >>>-#startup-animation=fade
> >>>-#binding-modifier=ctrl
> >>>-#num-workspaces=6
> >>>-#cursor-theme=whiteglass
> >>>-#cursor-size=24
> >>>-
> >>>-#lockscreen-icon=/usr/share/icons/gnome/256x256/actions/lock.png
> >>>-#lockscreen=/usr/share/backgrounds/gnome/Garden.jpg
> >>>-#homescreen=/usr/share/backgrounds/gnome/Blinds.jpg
> >>>-#animation=fade
> >>>-
> >>>-#[launcher]
> >>>-#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> >>>-#path=/usr/bin/gnome-terminal
> >>>-
> >>>-#[launcher]
> >>>-#icon=/usr/share/icons/gnome/24x24/apps/utilities-terminal.png
> >>>-#path=/usr/bin/weston-terminal
> >>>-
> >>>-#[launcher]
> >>>-#icon=/usr/share/icons/hicolor/24x24/apps/google-chrome.png
> >>>-#path=/usr/bin/google-chrome
> >>>-
> >>>-#[launcher]
> >>>-#icon=/usr/share/icons/gnome/24x24/apps/arts.png
> >>>-#path=/build/weston-0lEgCh/weston-1.11.0/weston-flower
> >>>-
> >>>-#[input-method]
> >>>-#path=/usr/libexec/weston-keyboard
> >>>-
> >>>-#[output]
> >>>-#name=LVDS1
> >>>-#mode=1680x1050
> >>>-#transform=90
> >>>-#icc_profile=/usr/share/color/icc/colord/Bluish.icc
> >>>-
> >>>-#[output]
> >>>-#name=VGA1
> >>>-#mode=173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
> >>>-#transform=flipped
> >>>-
> >>>-#[output]
> >>>-#name=X1
> >>>-#mode=1024x768
> >>>-#transform=flipped-90
> >>>  [libinput]
> >>>  touchscreen_calibrator=true
> >>>-#enable_tap=true
> >>>-
> >>>-#[touchpad]
> >>>-#constant_accel_factor = 50
> >>>-#min_accel_factor = 0.16
> >>>-#max_accel_factor = 1.0
> >>>-
> >>>-[screen-share]
> >>>-command=/usr/bin/weston --backend=rdp-backend.so --shell=fullscreen-shell.so --no-clients-resize
> >>>-
> >>>-#[xwayland]
> >>>-#path=/usr/bin/Xwayland
> >>>  [autolaunch]
> >>>  # launch the calibrator on startup if a touchscreen is detected
> >>>  path=/usr/bin/weston-launch-calibrator
> >>>+
> >>>+[screensaver]
> >>>+# Uncomment path to disable screensaver
> >>>+#path=@libexecdir@/weston-screensaver
> >>>-- 
> >>>2.44.0
> >

