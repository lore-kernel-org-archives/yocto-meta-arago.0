Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 6A5605208C
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 22:43:44 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so6214751oag.38
	for <meta-arago@arago-project.org>;
	Mon, 12 Nov 2012 14:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=PhnpH7pKMHVJXQ4Q6HdnVACDtaiaMJok61AVfgPx2Js=;
	b=V6UsgzcXJI++b2Y9P53dbCWPQIME303Za7jbtS30CfI4MNJJWGforHkQ3L+FUbmlV/
	CeVzHkVGepVJhd8QW578JNcO5WpnOHCkTXgt2brCHeK99KZCJ/C6hbvK9hkvXXv/vv4d
	mJcBD4gRJFHehHkIedr1nXQYtA6ggU5LsbG81ZUxfTC+r8gM99dtb69gF9okJ3Zvtz5D
	oCn/Wy+n/aGYpotT5XlnkFiHm4cQ21gFp5GsczuRYuPFdCMKY9MdDsdgqYb8WsOLsHUL
	5lI2yMraikn2Ud6nTP139O4ha/wn2ZLAysnYE7Snecc2HtLJzuK9l0T8kjZYWnBF+xE1
	Yjbw==
Received: by 10.182.240.109 with SMTP id vz13mr12873799obc.81.1352760223781;
	Mon, 12 Nov 2012 14:43:43 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fo6sm8271047obc.20.2012.11.12.14.43.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 12 Nov 2012 14:43:43 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 12 Nov 2012 16:43:38 -0600
Message-Id: <1352760219-6604-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/2] screenshot: Add screenshot application
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
X-List-Received-Date: Mon, 12 Nov 2012 22:43:44 -0000

* Add screenshot application used to take a screenshot of the framebuffer and
  save it to a bmp file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/screenshot/screenshot_1.0.bb  |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb

diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
new file mode 100644
index 0000000..b9439ac
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Screenshot"
+HOMEPAGE = "https://gitorious.org/screenshot"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
+SECTION = "graphics"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "1f11a23be4386c2ee0387cd12c1a9569c703a3bb" 
+
+SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+	export CROSS_COMPILE=${TARGET_PREFIX}
+	export ARCH=${ARMPKGARCH}
+	# build the release version
+	make release
+}
+
+do_install() {
+	export ARCH=${ARMPKGARCH}
+	make DESTDIR=${D} install
+}
-- 
1.7.0.4


