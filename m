Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f48.google.com (mail-oa0-f48.google.com
	[209.85.219.48])
	by arago-project.org (Postfix) with ESMTPS id 7959252A91
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:05 +0000 (UTC)
Received: by mail-oa0-f48.google.com with SMTP id j1so4338436oag.7
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FDRnr8ykvHndVZYgUWZNOsWu2X10KU/W2ld6/jT8BXk=;
	b=DhCaK6Gqb8f8fY5v7J48BIiba3v9AhhpmBABJAgocgkiQj1unIdHddLWKh3ci2/2A/
	2MH/Mcw/IBxfVSX7MTtk+cw+wJ/qOF7cACoJFx6S3AqBZTLXGcoqMH7qglJJvXyaCnHw
	HqKliTYUhCwRvOJOPPfooPYeiWCuUNLTXd0HaTYhbUhjZB1TID0vM3WSDGZ8bItc2IqU
	TFDQ/0tWzi2ZbsuhFmCvy13ifY/XMS1Z51/v8bZ5eqDVRMR+wbZSBqgLU9YHHt/Xob/n
	Mik0S8rCZCASsqxIuJpEGfqTTuSpEzejjfEjO3TtbA+ul8is/dbu4py909cEapPx8Y8/
	LP2g==
X-Received: by 10.182.17.70 with SMTP id m6mr9914546obd.39.1361849584960;
	Mon, 25 Feb 2013 19:33:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:03 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:47 -0600
Message-Id: <1361849574-7710-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/10] ti-pru-sw-app-loader: Port ti-pru-sw-app-loader from Arago
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:06 -0000

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


