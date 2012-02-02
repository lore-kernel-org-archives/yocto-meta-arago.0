Return-Path: <chase.maupin@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id DBF6B52A40
	for <meta-arago@arago-project.org>;
	Thu,  2 Feb 2012 21:01:41 +0000 (UTC)
Received: from dbdp20.itg.ti.com ([172.24.170.38])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q12L1dSI006838
	for <meta-arago@arago-project.org>; Thu, 2 Feb 2012 15:01:40 -0600
Received: from DBDE71.ent.ti.com (localhost [127.0.0.1])
	by dbdp20.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1dbg000421
	for <meta-arago@arago-project.org>; Fri, 3 Feb 2012 02:31:39 +0530 (IST)
Received: from dbdp31.itg.ti.com (172.24.170.98) by DBDE71.ent.ti.com
	(172.24.170.149) with Microsoft SMTP Server id 14.1.323.3;
	Fri, 3 Feb 2012 02:31:39 +0530
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dbdp31.itg.ti.com (8.13.8/8.13.8) with ESMTP id q12L1Yt1001215;
	Fri, 3 Feb 2012 02:31:38 +0530 (IST)
From: Chase Maupin <Chase.Maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 2 Feb 2012 15:01:29 -0600
Message-ID: <1328216492-7294-2-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
References: <1328216492-7294-1-git-send-email-Chase.Maupin@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/5] task-arago-console: port from old arago
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
X-List-Received-Date: Thu, 02 Feb 2012 21:01:44 -0000
Content-Type: text/plain

* Ported from old arago overlay with modifications for oe-core
  including license checksum and package name changes as well
  as removing un-needed packages.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 .../recipes-core/tasks/task-arago-console.bb       |   79 ++++++++++++++++++++
 1 files changed, 79 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-console.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-console.bb b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
new file mode 100644
index 0000000..db424c1
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-console.bb
@@ -0,0 +1,79 @@
+DESCRIPTION = "Extended task to get more basic and console apps"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+# alsa-utils-alsamixer depends on ncurses
+ARAGO_ALSA_EXTRA = "\
+    alsa-conf \
+    alsa-conf-base \
+    alsa-server \
+    alsa-utils \
+    alsa-utils-aconnect \
+    alsa-utils-alsaconf \
+    alsa-utils-alsactl \
+    alsa-utils-alsamixer \
+    alsa-utils-amixer \
+    alsa-utils-iecset \
+    alsa-utils-midi \
+    alsa-utils-speakertest \
+    alsa-state \
+    "
+
+ARAGO_TSLIB = "\
+    tslib-conf \
+    tslib-calibrate \
+    tslib-tests \
+    "
+
+ARAGO_NCURSES = "\
+    ncurses \
+    ncurses-terminfo \
+    ncurses-tools \
+    "
+
+ARAGO_FSTOOLS = "\
+    e2fsprogs \
+    e2fsprogs-e2fsck \
+    e2fsprogs-mke2fs \
+    dosfstools \
+    util-linux-fdisk \
+    "
+
+ARAGO_UTILS = "\
+    fbset \
+    usbutils \
+    i2c-tools \
+    iproute2 \
+    strace \
+    ltrace \
+    "
+
+ARAGO_SDK_PREREQ = "\
+    zlib \
+    libpng12 \
+    jpeg \
+    jpeg-tools \
+    freetype \
+    lighttpd \
+    lighttpd-module-cgi \
+    "
+
+ARAGO_CONSOLE = "\
+    ${ARAGO_ALSA_EXTRA} \
+    ${ARAGO_TSLIB} \
+    ${ARAGO_NCURSES} \
+    ${ARAGO_FSTOOLS} \
+    ${ARAGO_UTILS} \
+    ${ARAGO_SDK_PREREQ} \
+    "
+
+RDEPENDS_${PN} = "\
+    ${ARAGO_CONSOLE} \
+    "
+
+RRECOMMENDS_${PN} = "\
+    kernel-modules \
+    "
-- 
1.7.0.4


