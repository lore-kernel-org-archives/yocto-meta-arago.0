Return-Path: <jake@udc0866934>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 89C7952A19
	for <meta-arago@arago-project.org>;
	Tue, 11 Aug 2015 17:14:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7BHE2ot009936
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 12:14:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BHE26x000797
	for <meta-arago@arago-project.org>; Tue, 11 Aug 2015 12:14:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 11 Aug 2015 12:14:02 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7BHE2DY031532;
	Tue, 11 Aug 2015 12:14:02 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZPD7h-0005Ve-KK; Tue, 11 Aug 2015 13:14:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Aug 2015 13:13:59 -0400
Message-ID: <1439313239-9222-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH v2] udev-cache: Disable by default.
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
X-List-Received-Date: Tue, 11 Aug 2015 17:14:03 -0000
Content-Type: text/plain

* This is to fix issue with rpmsg-rpc devices sharing major numbers and
  obtaining random minor numbers which may not be consistent between booting.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* Disable only for dra7xx SOC family as they contain multiple devices
  which support rpmsg-rpc
* Mark as machine-specific since udev-cache.default differs between
  platforms.

 meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default | 5 +++++
 meta-arago-distro/recipes-core/udev/udev_182.bbappend              | 4 +++-
 2 files changed, 8 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default

diff --git a/meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default b/meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default
new file mode 100644
index 0000000..b1aa63f
--- /dev/null
+++ b/meta-arago-distro/recipes-core/udev/udev/dra7xx/udev-cache.default
@@ -0,0 +1,5 @@
+# Default for /etc/init.d/udev
+
+# Comment this out to disable device cache
+#DEVCACHE="/etc/dev.tar"
+PROBE_PLATFORM_BUS="yes"
diff --git a/meta-arago-distro/recipes-core/udev/udev_182.bbappend b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
index 5c5d040..a84bbd8 100644
--- a/meta-arago-distro/recipes-core/udev/udev_182.bbappend
+++ b/meta-arago-distro/recipes-core/udev/udev_182.bbappend
@@ -5,7 +5,9 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
+
+PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 SRC_URI_append = " \
                   file://usb1-rules.sh \
-- 
1.9.1


