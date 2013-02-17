Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f176.google.com (mail-ye0-f176.google.com
	[209.85.213.176])
	by arago-project.org (Postfix) with ESMTPS id 8D5B952A1D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:23 +0000 (UTC)
Received: by mail-ye0-f176.google.com with SMTP id m1so909724yen.35
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=FDRnr8ykvHndVZYgUWZNOsWu2X10KU/W2ld6/jT8BXk=;
	b=Yc04tQIz6PuHpS5XluTCPakjkZqhkp75MVMj22j7oI3OFr+04qSuowS60rFrrWYbdl
	9keWAAJIjbtzRSCFznS4GJbf03AtwrEJJ/LFGjJ6rPxHH0It4cHdJ4ACHgFht5h+6H1g
	l22sGn0E+d5qLzJpJTHy87oBnoe0xnDN98H7h9uC0taVsW30ZUPtDx52ivE1O8qXKA1f
	5+EP8UmPiforec+0v337iYUVSzxXocnfclyOVaA2VvBen14cptjSKOUNlfN6sx9e0kVS
	1uqYDUWYB7bvkiSOWlJzG5LtD21rbnSrnpJGgMtJQGS0f86p+b2W6wjJc4EsqhiyGzHc
	IIFg==
X-Received: by 10.236.136.5 with SMTP id v5mr16687298yhi.49.1361141603061;
	Sun, 17 Feb 2013 14:53:23 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.20
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:21 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:52:56 -0600
Message-Id: <1361141595-1687-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/20] ti-pru-sw-app-loader: Port ti-pru-sw-app-loader from Arago
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:23 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add PRU sw application loader recipe for the omapl138 machines

* This recipe builds the PRU application loader that is used to load a binary
  to the PRU's memory and manage the code executed in the PRU from the user
  space.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../ti-pru-sw-app-loader_1.00.00.bb                |   25 ++++++++++++++++++++
 1 files changed, 25 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb

diff --git a/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
new file mode 100644
index 0000000..59e7562
--- /dev/null
+++ b/meta-arago-extras/recipes-core/ti-pru-sw-app-loader/ti-pru-sw-app-loader_1.00.00.bb
@@ -0,0 +1,25 @@
+DESCRIPTION = "PRU sw application loader"
+HOMEPAGE = "https://gforge.ti.com/gf/project/pru_sw/"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://interface/prussdrv.c;beginline=1;endline=47;md5=6012fea45c1fbced663277bc90d2163a"
+
+RRECOMMENDS_${PN} = "kernel-module-uio-pru"
+PR = "r0+svnr${SRCPV}"
+
+COMPATIBLE_MACHINE = "omapl138"
+
+SRC_URI = "svn://gforge.ti.com/svn/pru_sw/;module=trunk;protocol=https;user=anonymous;pswd=''"
+
+SRCREV = "33"
+S = "${WORKDIR}/trunk/app_loader"
+
+do_compile () {
+        make -C ${S}/interface CCTOOL_PREFIX=${TOOLCHAIN_PATH}/bin/${TARGET_PREFIX}
+}
+
+do_install () {
+        install -d ${D}${libdir}
+        install -d ${D}${includedir}
+        install -m 0644 ${S}/include/* ${D}${includedir}
+        install -m 0644 ${S}/lib/* ${D}${libdir}
+}
-- 
1.7.0.4


