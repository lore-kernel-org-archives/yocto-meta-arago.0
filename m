Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 637515298F
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 22:46:07 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UMk6Bj019438
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:46:06 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMk6KD024471
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 16:46:06 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 16:46:06 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UMk3qu010677;
	Thu, 30 Jan 2014 16:46:05 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 18:12:37 -0600
Message-ID: <1391127157-6874-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ts-calibrate: Always export TSLIB_CALIBFILE env variable
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
X-List-Received-Date: Thu, 30 Jan 2014 22:46:07 -0000
Content-Type: text/plain

* Previously TSLIB_CALIBFILE env variable was only being exported if the mmc
  partition was mounted.
* Move the export statement outside of the if statement to insure that this
  important variable is always exported.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/tslib/ts-calibrate-init/init  |    3 ++-
 .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
index 5d5c0aa..ab19da3 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -31,9 +31,10 @@ mount | grep /media/mmcblk0p1 | grep vfat > /dev/null 2>&1
 if [ "$?" = "0" ]
 then
     tsfile=/media/mmcblk0p1/pointercal
-    export TSLIB_CALIBFILE=$tsfile
 fi
 
+export TSLIB_CALIBFILE=$tsfile
+
 if [ ! -f $tsfile ] ; then
     echo -n "Calibrating touchscreen (first time only)"
     ts_calibrate
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index dde5c42..0915941 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} += "tslib"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
 
-PR = "r2"
+PR = "r3"
 
 S = "${WORKDIR}"
 
-- 
1.7.0.4


