Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 8273752A75
	for <meta-arago@arago-project.org>;
	Tue, 19 Aug 2014 16:45:58 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7JGjv2d006964
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:45:57 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7JGjvY4029785
	for <meta-arago@arago-project.org>; Tue, 19 Aug 2014 11:45:57 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 19 Aug 2014 11:45:57 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7JGjuxb029725;	Tue, 19 Aug 2014 11:45:57 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7JGjsqG017239;	Tue, 19 Aug 2014 22:15:55 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Aug 2014 11:45:45 -0500
Message-ID: <1408466752-4458-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/8] libevdev: Add libdevdev which is a dependency for libinput
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
X-List-Received-Date: Tue, 19 Aug 2014 16:45:58 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/libevdev/libevdev_git.bb      |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 create mode 100644 meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb

diff --git a/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb b/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb
new file mode 100644
index 0000000..508beb3
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/libevdev/libevdev_git.bb
@@ -0,0 +1,16 @@
+DESCRIPTION = "libevdev is a wrapper library for evdev devices"
+HOMEPAGE = "http://www.freedesktop.org/wiki/Software/libevdev/"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://COPYING;md5=75aae0d38feea6fda97ca381cb9132eb"
+
+inherit autotools pkgconfig
+
+PR = "r0"
+
+BRANCH = "master"
+SRCREV = "a5f150ef57a1a5c67e94163f6f5a60687049413f"
+PV = "1.2.99.901"
+SRC_URI = "git://anongit.freedesktop.org/libevdev;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
-- 
1.7.9.5


