Return-Path: <a0850405@a0850405-t7500>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4634052AB2
	for <meta-arago@arago-project.org>;
	Fri, 29 Jul 2016 23:35:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u6TNW1G6015215
	for <meta-arago@arago-project.org>; Fri, 29 Jul 2016 18:32:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6TNZZQN032740
	for <meta-arago@arago-project.org>; Fri, 29 Jul 2016 18:35:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 29 Jul 2016 18:35:35 -0500
Received: from a0850405-T7500 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u6TNZZ78018476;
	Fri, 29 Jul 2016 18:35:35 -0500
Received: from a0850405 by a0850405-T7500 with local (Exim 4.82)
	(envelope-from <a0850405@a0850405-t7500>)	id 1bTHJW-000EmP-TG;
	Fri, 29 Jul 2016 19:35:34 -0400
From: Carlos Hernandez <ceh@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Jul 2016 19:35:27 -0400
Message-ID: <1469835327-56779-1-git-send-email-ceh@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] busybox: rtcwake: Allow poweroff with rtcwake
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
X-List-Received-Date: Fri, 29 Jul 2016 23:35:37 -0000
Content-Type: text/plain

Useful to test rtcwake from poweroff.

Signed-off-by: Carlos Hernandez <ceh@ti.com>
---
 ...cwake-Allow-poweroff-with-rtcwake-command.patch | 56 ++++++++++++++++++++++
 .../recipes-core/busybox/busybox_%.bbappend        |  2 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
new file mode 100644
index 000000000000..da47888ef8fd
--- /dev/null
+++ b/meta-arago-distro/recipes-core/busybox/busybox/0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch
@@ -0,0 +1,56 @@
+From 81e46127ec781dec6789457e918582a5a4eae50a Mon Sep 17 00:00:00 2001
+From: Dave Gerlach <d-gerlach@ti.com>
+Date: Tue, 9 Jun 2015 10:54:19 -0500
+Subject: [PATCH] rtcwake: Allow poweroff with rtcwake command
+
+rtcwake will support poweroff as an option for -m with this
+patch by calling poweroff from the command line and also not disabling
+the rtc alarm1 interrupt at exit.
+
+Signed-off-by: Dave Gerlach <d-gerlach@ti.com>
+---
+ util-linux/rtcwake.c | 15 +++++++++++----
+ 1 file changed, 11 insertions(+), 4 deletions(-)
+
+diff --git a/util-linux/rtcwake.c b/util-linux/rtcwake.c
+index 8aee0cfcbd56..a0edee5d8647 100644
+--- a/util-linux/rtcwake.c
++++ b/util-linux/rtcwake.c
+@@ -133,6 +133,7 @@ int rtcwake_main(int argc UNUSED_PARAM, char **argv)
+	unsigned seconds = seconds; /* for compiler */
+	int utc = -1;
+	int fd;
++        int poweroff = 0;
+
+ #if ENABLE_LONG_OPTS
+	static const char rtcwake_longopts[] ALIGN1 =
+@@ -211,9 +212,14 @@ int rtcwake_main(int argc UNUSED_PARAM, char **argv)
+	fflush_all();
+	usleep(10 * 1000);
+
+-	if (strcmp(suspend, "on") != 0)
+-		xopen_xwrite_close(SYS_POWER_PATH, suspend);
+-	else {
++	if (strcmp(suspend, "on")) {
++		if (!strcmp(suspend, "poweroff")) {
++			system("poweroff");
++			poweroff = 1;
++		} else {
++			xopen_xwrite_close(SYS_POWER_PATH, suspend);
++		}
++	} else {
+		/* "fake" suspend ... we'll do the delay ourselves */
+		unsigned long data;
+
+@@ -226,7 +232,8 @@ int rtcwake_main(int argc UNUSED_PARAM, char **argv)
+		} while (!(data & RTC_AF));
+	}
+
+-	xioctl(fd, RTC_AIE_OFF, 0);
++	if (!poweroff)
++		xioctl(fd, RTC_AIE_OFF, 0);
+
+	if (ENABLE_FEATURE_CLEAN_UP)
+		close(fd);
+--
+1.9.1
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
index 709ebdaaf8c1..d3c258c9bfd6 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_%.bbappend
@@ -1,4 +1,6 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
+SRC_URI_append = " file://0001-rtcwake-Allow-poweroff-with-rtcwake-command.patch "
+
 PR_append = ".arago20"
-- 
1.9.1


