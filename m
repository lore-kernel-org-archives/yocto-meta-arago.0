Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 3F256529BE
	for <meta-arago@arago-project.org>;
	Tue,  9 Dec 2014 15:54:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id sB9Fs4so018041
	for <meta-arago@arago-project.org>; Tue, 9 Dec 2014 09:54:06 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB9Fs46c031054
	for <meta-arago@arago-project.org>; Tue, 9 Dec 2014 09:54:04 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 9 Dec 2014 09:54:03 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id sB9Fs3UE018284;
	Tue, 9 Dec 2014 09:54:04 -0600
Date: Tue, 9 Dec 2014 10:54:03 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Carlos Hernandez <ceh@ti.com>
Message-ID: <20141209155403.GO5113@edge>
References: <1418091615-28779-1-git-send-email-denis@denix.org>
	<5487197A.8020309@ti.com>
MIME-Version: 1.0
In-Reply-To: <5487197A.8020309@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
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
X-List-Received-Date: Tue, 09 Dec 2014 15:54:07 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 09, 2014 at 10:47:06AM -0500, Carlos Hernandez wrote:
> Acked-by: Carlos Hernandez <ceh@ti.com>

Thanks! You can touch $SD_CALUDEV_FILE mentioned below on your farm's SD 
cards - once I push it shortly, it will be ready to go for the next nightly.


> On 12/08/2014 09:20 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> >  .../recipes-graphics/wayland/weston-init.bbappend  |  2 +-
> >  .../recipes-graphics/wayland/weston-init/init      | 43 +++++++++++++++++-----
> >  2 files changed, 35 insertions(+), 10 deletions(-)
> >
> >diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >index 0d76e3b..7825618 100644
> >--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
> >@@ -1,3 +1,3 @@
> >-PR_append = "-arago2"
> >+PR_append = "-arago3"
> >  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> >index 834de4d..b2a2567 100644
> >--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> >+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
> >@@ -32,7 +32,7 @@ case "$1" in
> >          # This is all a nasty hack
> >          if test -z "$XDG_RUNTIME_DIR"; then
> >-                export XDG_RUNTIME_DIR=/run/user/root
> >+            export XDG_RUNTIME_DIR=/run/user/root
> >          fi
> >          if [ ! -d "$XDG_RUNTIME_DIR" ] ; then
> >@@ -42,23 +42,48 @@ case "$1" in
> >          openvt -s weston
> >-        # Handle touchscreen calibration
> >+        # If there's no touchscreen device available, done
> >          if [ ! -e /dev/input/touchscreen0 ] ; then
> >-                exit 0
> >+            exit 0
> >          fi
> >-        if [ ! -f $WS_CALUDEV_FILE ] ; then
> >+        # If it was already calibrated, done
> >+        if [ -f "$WS_CALUDEV_FILE" ] ; then
> >+            exit 0
> >+        fi
> >+
> >+        # Check if SD card is mounted
> >+        mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
> >+        if [ "$?" = "0" ] ; then
> >+            SD_MOUNTED="1"
> >+        else
> >+            SD_MOUNTED="0"
> >+        fi
> >+
> >+        # Check if SD card has a calibration rules file
> >+        SD_CALUDEV_FILE=/run/media/mmcblk0p1/ws-calibrate.rules
> >+        if [ "$SD_MOUNTED" = "1" -a -f "$SD_CALUDEV_FILE" ] ; then
> >+            # Copy it over to udev location
> >+            cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
> >+        else
> >+            # Run a calibration app and save output to udev rules
> >              echo -n "Calibrating touchscreen (first time only)"
> >              sleep 1
> >              CAL_VALUES=`weston-calibrator|cut -c21-`
> >              echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
> >              echo "."
> >-            udevadm control --reload
> >-            udevadm trigger
> >-            killproc weston
> >-            sleep 1
> >-            openvt -s weston
> >+            # Copy it back to SD
> >+            if [ "$SD_MOUNTED" = "1" ] ; then
> >+                cp "$WS_CALUDEV_FILE" "$SD_CALUDEV_FILE"
> >+            fi
> >          fi
> >+
> >+        # Reload and re-run udev rules and restart weston
> >+        udevadm control --reload
> >+        udevadm trigger
> >+        killproc weston
> >+        sleep 1
> >+        openvt -s weston
> >    ;;
> >    stop)
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

