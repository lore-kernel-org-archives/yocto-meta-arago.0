Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id E7FDF5209B
	for <meta-arago@arago-project.org>;
	Fri,  6 Oct 2017 15:53:57 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v96FrvYg016109
	for <meta-arago@arago-project.org>; Fri, 6 Oct 2017 10:53:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507305237;
	bh=7nwplSs/7g7PjieIB8QVUJdc8zy/qp9JgFkb+aHT7wU=;
	h=From:To:Subject:Date;
	b=idHKQ/BBsqlDW1kfGZETiI2U5NQUVeBKU9ZRKGC4YlFgFLsagFYbODDqdHsd2NagO
	lJjwD/DIlkl4EOdOJrB4XrCeAhnQnek0gUzN6ZyQcjErbU3airoti+O+6KJkXFNKOi
	zproPLOkqDPWPUy6o2LXBkBPu812a/2FNgm2ASTs=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v96Frv4l011245
	for <meta-arago@arago-project.org>; Fri, 6 Oct 2017 10:53:57 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 6 Oct 2017 10:53:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 6 Oct 2017 10:53:57 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v96Frvdb028905
	for <meta-arago@arago-project.org>; Fri, 6 Oct 2017 10:53:57 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Oct 2017 11:53:53 -0400
Message-ID: <1507305233-4503-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-xsgx-ddk-um: add shell file xorg to start/stop Xorg
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
X-List-Received-Date: Fri, 06 Oct 2017 15:53:58 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-xsgx-ddk-um/xorg       | 40 ++++++++++++++++++++++
 .../libgles/ti-xsgx-ddk-um_1.15.4564147.bb         |  5 ++-
 2 files changed, 44 insertions(+), 1 deletion(-)
 create mode 100644 recipes-graphics/libgles/ti-xsgx-ddk-um/xorg

diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg b/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg
new file mode 100644
index 0000000..9c036d4
--- /dev/null
+++ b/recipes-graphics/libgles/ti-xsgx-ddk-um/xorg
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+x_start()
+{
+
+	# Start the X Server. 
+	#
+	/usr/local/XSGX/bin/X -config /usr/local/XSGX/etc/xorg.conf > /dev/null 2>&1 &
+
+	echo "Starting Xorg"
+	return 0;
+}
+
+x_stop()
+{
+
+
+	# Stop the X Server.
+	#
+	[ -f /tmp/.X0-lock ] && read XPID < /tmp/.X0-lock && [ -n "$XPID" ] && kill $XPID && while [ -e /proc/$XPID ] ; do sleep 1; done
+
+	echo "Stopping Xorg"
+	return 0;
+}
+
+
+# Deal with the type of invocation we get.
+#
+case "$1" in
+start)
+	x_start
+	;;
+stop)
+    x_stop
+	;;
+*)
+	echo "$0: unknown argument $1." >&2;
+	;;
+esac
+
diff --git a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
index c959e14..6434869 100644
--- a/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
+++ b/recipes-graphics/libgles/ti-xsgx-ddk-um_1.15.4564147.bb
@@ -10,6 +10,8 @@ BRANCH = "ti-img-sgx/${PV}"
 SRC_URI = "git://git.ti.com/processor-sdk/omap5-sgx-ddk-um-linux-x11-experimental.git;protocol=git;branch=${BRANCH}"
 SRCREV = "c00eb002f624cddac4956c901314c07d83a13260"
 
+SRC_URI += " file://xorg"
+
 # There's only hardfp version available
 python __anonymous() {
     tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
@@ -31,7 +33,7 @@ INITSCRIPT_PARAMS = "defaults 8"
 
 inherit update-rc.d
 
-PR = "r0"
+PR = "r1"
 PROVIDES += "virtual/egl virtual/libgles1 virtual/libgles2 omap5-xsgx-ddk-um-linux"
 
 DEPENDS += "udev"
@@ -54,6 +56,7 @@ S = "${WORKDIR}/git"
 
 do_install () {
     oe_runmake install DESTDIR=${D} TARGET_PRODUCT=${TARGET_PRODUCT}
+    install -m 0644 ${WORKDIR}/xorg ${D}${sysconfdir}/init.d/
 }
 
 SYSROOT_DIRS_append = "/usr/local"
-- 
1.9.1


