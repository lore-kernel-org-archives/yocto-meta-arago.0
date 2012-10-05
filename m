Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id A4A6F529A1
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:21:49 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1321159oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:21:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=6qW4vAALIJ77fVa88Q0VqCrKyRbOwBKFZ6kO8Q1dPEI=;
	b=ssxtJnfcbNCfaok1cO+3KuAkUmBSR9ljv+MxiBQyYkk680qXNudK/w0zVyXZ+AROqo
	6TeXvl92PTbho+nqz9Xw8WAS0iGjRB7PDaLyBU93VCIbQgahkmaYyfRowuMFkGyz+XAM
	KTm8uH13jF6XBKQljQ5ZkrtBVnLMTZiiYjaYyB0Ukz/rJdUkPngPKnCd/Xy9I+18jWzb
	ZSlslxqCQ5rO1vT7ShJF87uOsTzYq+QwjBNU/ENnGiNuSAGOtody27XViARACmAm/31t
	zeXhqeRzJlSSq7b94ZFIZfhADNXFZYS6MwDTwqXRCpaVF2bG5cp90SPwXscO4DG39/nY
	HGFA==
Received: by 10.60.28.167 with SMTP id c7mr1962583oeh.44.1349418109069;
	Thu, 04 Oct 2012 23:21:49 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id n7sm954472obd.16.2012.10.04.23.21.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:21:48 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:50:08 -0500
Message-Id: <1349419808-21687-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] iperf: Update to version 2.0.5
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
X-List-Received-Date: Fri, 05 Oct 2012 06:21:49 -0000

* Upgrading to newer version of iperf.
* Newer versions of iperf reduced CPU load thus increasing performance in
  wl12xx tests.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-benchmark/iperf/iperf_2.0.5.bb         |   34 ++++++++++++++++++++
 1 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb

diff --git a/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
new file mode 100644
index 0000000..aff06b2
--- /dev/null
+++ b/meta-arago-extras/recipes-benchmark/iperf/iperf_2.0.5.bb
@@ -0,0 +1,34 @@
+DESCRIPTION = "Iperf is a tool to measure maximum TCP bandwidth, allowing the tuning of various parameters and UDP characteristics"
+HOMEPAGE = "http://dast.nlanr.net/Projects/Iperf/"
+SECTION = "console/network"
+LICENSE = "NewBSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e8478eae9f479e39bc34975193360298"
+
+SRC_URI = " ${SOURCEFORGE_MIRROR}/iperf/iperf-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "44b5536b67719f4250faed632a3cd016"
+SRC_URI[sha256sum] = "636b4eff0431cea80667ea85a67ce4c68698760a9837e1e9d13096d20362265b"
+
+PR = "r0"
+
+inherit autotools
+
+S="${WORKDIR}/iperf-${PV}"
+
+EXTRA_OECONF = "--exec-prefix=${STAGING_DIR_HOST}${layout_exec_prefix}"
+
+do_configure() {
+	export ac_cv_func_malloc_0_nonnull=yes
+	gnu-configize
+	oe_runconf
+}
+
+do_compile() {
+	cd ${WORKDIR}/iperf-${PV}
+	oe_runmake
+}
+
+do_install() {
+	cd ${WORKDIR}/iperf-${PV}/src
+	oe_runmake DESTDIR=${D} install
+}
-- 
1.7.0.4


