Return-Path: <fcooper@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 6748A52981
	for <meta-arago@arago-project.org>;
	Wed, 13 Aug 2014 19:46:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7DJkIFO021308
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:18 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7DJkIoH007103
	for <meta-arago@arago-project.org>; Wed, 13 Aug 2014 14:46:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 13 Aug 2014 14:46:18 -0500
Received: from dbdmail01.india.ti.com (dbdmail01.india.ti.com
	[172.24.162.206])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s7DJkHLs007948;	Wed, 13 Aug 2014 14:46:18 -0500
Received: from sdit-build02.dal.design.ti.com (sdit-build02.dal.design.ti.com
	[10.247.66.5])	by dbdmail01.india.ti.com (8.14.3/8.14.3/SuSE Linux
	0.8) with ESMTP id s7DJkFTq012731;	Thu, 14 Aug 2014 01:16:16 +0530
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Aug 2014 14:46:07 -0500
Message-ID: <1407959172-16985-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/6] tslib: Use custom tslib.sh
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
X-List-Received-Date: Wed, 13 Aug 2014 19:46:19 -0000
Content-Type: text/plain

From: "Franklin S. Cooper Jr" <fcooper@ti.com>

* Tslib.sh is copied to /etc/profile.d/ to set default environment variables
  specific to touchscreen.
* However, in Arago additional env variable logic for touchscreen is required
  and is currently located within Matrix's init script.
* Pull the additional logic from Matrix's init script and move it into this file
  so tslib.sh will set the correct environment variable globally.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/tslib/files/tslib.sh          |   17 +++++++++++++++++
 .../tslib/tslib_1.1.bbappend}                      |    2 +-
 2 files changed, 18 insertions(+), 1 deletion(-)
 create mode 100644 meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
 copy meta-arago-distro/{recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend => recipes-graphics/tslib/tslib_1.1.bbappend} (56%)

diff --git a/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh b/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
new file mode 100644
index 0000000..f22ec9c
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/tslib/files/tslib.sh
@@ -0,0 +1,17 @@
+#!/bin/sh
+
+### Touchscreen Environment Variables ###
+
+if [ ! -e /dev/input/touchscreen0 ]; then
+    exit
+fi
+
+export TSLIB_TSDEVICE=/dev/input/touchscreen0
+
+mount | grep /run/media/mmcblk0p1 | grep vfat > /dev/null 2>&1
+if [ "$?" = "0" ]
+then
+    export TSLIB_CALIBFILE=/run/media/mmcblk0p1/pointercal
+else
+    export TSLIB_CALIBFILE=/etc/pointercal
+fi
diff --git a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend b/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
similarity index 56%
copy from meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
copy to meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
index c0ab069..875218d 100644
--- a/meta-arago-distro/recipes-core/init-ifupdown/init-ifupdown_1.0.bbappend
+++ b/meta-arago-distro/recipes-graphics/tslib/tslib_1.1.bbappend
@@ -1,4 +1,4 @@
 # look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+FILESEXTRAPATHS_prepend := "${THISDIR}/files:"
 
 PR_append = "-arago0"
-- 
1.7.9.5


