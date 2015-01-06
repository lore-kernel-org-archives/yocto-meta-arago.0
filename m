Return-Path: <a0866934local@udb0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id AC3D1529D3
	for <meta-arago@arago-project.org>;
	Tue,  6 Jan 2015 14:39:08 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t06Ed8ZJ032377
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:39:08 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06Ed7Qi031274
	for <meta-arago@arago-project.org>; Tue, 6 Jan 2015 08:39:08 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 6 Jan 2015 08:39:07 -0600
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t06Ed7hN015591;
	Tue, 6 Jan 2015 08:39:07 -0600
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1Y8VHn-0005Ap-DY;
	Tue, 06 Jan 2015 09:39:07 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 6 Jan 2015 09:39:00 -0500
Message-ID: <1420555140-19850-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] udev-cache: Disable by default.
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
X-List-Received-Date: Tue, 06 Jan 2015 14:39:08 -0000
Content-Type: text/plain

* This is to fix issue with rpmsg-rpc devices sharing major numbers and
  obtaining random minor numbers which may not be consistent between booting.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../recipes-core/udev/udev/udev-cache.default      |    5 +++++
 .../recipes-core/udev/udev_182.bbappend            |    2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/udev-cache.default

diff --git a/meta-arago-distro/recipes-core/udev/udev/udev-cache.default b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
new file mode 100644
index 0000000..b1aa63f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/udev-cache.default
@@ -0,0 +1,5 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+#DEVCACHE="/etc/dev.tar"
+PROBE_PLATFORM_BUS="yes"
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
index 838cce8..8da3c3a 100644
--- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -5,4 +5,4 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
-- 
1.7.9.5


