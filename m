Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 71F8C5298E
	for <meta-arago@arago-project.org>;
	Mon,  4 Aug 2014 05:19:10 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [72.66.25.89])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N9R004IUO3SPOC0@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 04 Aug 2014 00:19:05 -0500 (CDT)
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id A33302016D; Mon,
	04 Aug 2014 01:19:04 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 04 Aug 2014 01:18:57 -0400
Message-id: <1407129540-18312-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.0.4
Subject: [dora][PATCH 1/4] udev: overlay locally init and default files with platform probe fix
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
X-List-Received-Date: Mon, 04 Aug 2014 05:19:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Backported from master/daisy to allow probing of platform bus on
subsequent boots:
http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/52443

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/recipes-core/udev/udev/init      | 138 +++++++++++++++++++++
 .../recipes-core/udev/udev/udev-cache.default      |   5 +
 .../recipes-core/udev/udev_182.bbappend            |   4 +-
 3 files changed, 146 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/init
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/udev-cache.default

diff --git a/meta-arago-distro/recipes-core/udev/udev/init b/meta-arago-distro/recipes-core/udev/udev/init
new file mode 100644
index 0000000..f2c84d5
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/init
@@ -0,0 +1,138 @@
+#!/bin/sh
+
+### BEGIN INIT INFO
+# Provides:          udev
+# Required-Start:    mountvirtfs
+# Required-Stop:     
+# Default-Start:     S
+# Default-Stop:
+# Short-Description: Start udevd, populate /dev and load drivers.
+### END INIT INFO
+
+export TZ=/etc/localtime
+
+[ -d /sys/class ] || exit 1
+[ -r /proc/mounts ] || exit 1
+[ -x @UDEVD@ ] || exit 1
+[ -f /etc/default/udev-cache ] && . /etc/default/udev-cache
+[ -f /etc/udev/udev.conf ] && . /etc/udev/udev.conf
+[ -f /etc/default/rcS ] && . /etc/default/rcS
+
+readfiles () {
+   READDATA=""
+   for filename in $@; do
+	   if [ -r $filename ]; then
+		   while read line; do
+			   READDATA="$READDATA$line"
+		   done < $filename
+	   fi
+   done
+}
+
+kill_udevd () {
+    pid=`pidof -x udevd`
+    [ -n "$pid" ] && kill $pid
+}
+
+case "$1" in
+  start)
+    export ACTION=add
+    # propagate /dev from /sys
+    echo "Starting udev"
+
+    # Check for requireed devtmpfs before trying to start udev and
+    # mount a no-existant fs.
+    if ! grep -q devtmpfs /proc/filesystems
+    then
+        echo "Missing devtmpfs, which is required for udev to run";
+        echo "Halting..."
+        halt
+    fi
+    # mount the devtmpfs on /dev, if not already done
+    LANG=C awk '$2 == "/dev" && ($3 == "devtmpfs") { exit 1 }' /proc/mounts && {
+            mount -n -o mode=0755 -t devtmpfs none "/dev"
+    }
+    [ -e /dev/pts ] || mkdir -m 0755 /dev/pts
+    [ -e /dev/shm ] || mkdir -m 1777 /dev/shm
+    # the automount rule for udev needs /tmp directory available, as /tmp is a symlink
+    # to /var/tmp which in turn is a symlink to /var/volatile/tmp, we need to make sure
+    # /var/volatile/tmp directory to be available.
+    mkdir -p /var/volatile/tmp
+
+    # Cache handling.
+    # A list of files which are used as a criteria to judge whether the udev cache could be reused.
+    CMP_FILE_LIST="/proc/version /proc/cmdline /proc/devices /proc/atags"
+    if [ "$DEVCACHE" != "" ]; then
+            if [ -e $DEVCACHE ]; then
+		    readfiles $CMP_FILE_LIST
+		    NEWDATA="$READDATA"
+		    readfiles /etc/udev/cache.data
+		    OLDDATA="$READDATA"
+		    if [ "$OLDDATA" = "$NEWDATA" ]; then
+                            (cd /; tar xf $DEVCACHE > /dev/null 2>&1)
+                            not_first_boot=1
+                            [ "$VERBOSE" != "no" ] && echo "udev: using cache file $DEVCACHE"
+                            [ -e /dev/shm/udev.cache ] && rm -f /dev/shm/udev.cache
+                    else
+			    # Output detailed reason why the cached /dev is not used
+			    if [ "$VERBOSE" != "no" ]; then
+				    echo "udev: udev cache not used"
+				    echo "udev: we use $CMP_FILE_LIST as criteria to judge whether the cache /dev could be resued"
+				    echo "udev: olddata: $OLDDATA"
+				    echo "udev: newdata: $NEWDATA"
+			    fi
+			    echo "$NEWDATA" > /dev/shm/udev.cache
+                    fi
+	    else
+		    if [ "$ROOTFS_READ_ONLY" != "yes" ]; then
+			    # If rootfs is not read-only, it's possible that a new udev cache would be generated;
+			    # otherwise, we do not bother to read files.
+			    readfiles $CMP_FILE_LIST
+			    echo "$READDATA" > /dev/shm/udev.cache
+		    fi
+            fi
+    fi
+
+    # make_extra_nodes
+    kill_udevd > "/dev/null" 2>&1
+
+    # trigger the sorted events
+    echo -e '\000\000\000\000' > /proc/sys/kernel/hotplug
+    @UDEVD@ -d
+
+    udevadm control --env=STARTUP=1
+    if [ "$not_first_boot" != "" ];then
+            if [ "$PROBE_PLATFORM_BUS" != "yes" ]; then
+                PLATFORM_BUS_NOMATCH="--subsystem-nomatch=platform"
+            else
+                PLATFORM_BUS_NOMATCH=""
+            fi
+            udevadm trigger --action=add --subsystem-nomatch=tty --subsystem-nomatch=mem --subsystem-nomatch=vc --subsystem-nomatch=vtconsole --subsystem-nomatch=misc --subsystem-nomatch=dcon --subsystem-nomatch=pci_bus --subsystem-nomatch=graphics --subsystem-nomatch=backlight --subsystem-nomatch=video4linux $PLATFORM_BUS_NOMATCH
+            (udevadm settle --timeout=3; udevadm control --env=STARTUP=)&
+    else
+            udevadm trigger --action=add
+            udevadm settle
+    fi
+    ;;
+  stop)
+    echo "Stopping udevd"
+    start-stop-daemon --stop --name udevd --quiet
+    ;;
+  restart)
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  status)
+    pid=`pidof -x udevd`
+    if [ -n "$pid" ]; then
+	echo "udevd (pid $pid) is running ..."
+    else
+	echo "udevd is stopped"
+    fi
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|status|restart}"
+    exit 1
+esac
+exit 0
diff --git a/meta-arago-distro/recipes-core/udev/udev/udev-cache.default b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
new file mode 100644
index 0000000..2093336
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
@@ -0,0 +1,5 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+DEVCACHE="/etc/dev.tar"
+PROBE_PLATFORM_BUS="yes"
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
index 838cce8..cbbac46 100644
--- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -5,4 +5,6 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+INITSCRIPT_PARAMS_udev = "start 04 S ."
+
+PR_append = "-arago3"
-- 
2.0.4


