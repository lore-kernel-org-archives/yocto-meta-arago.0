Return-Path: <fcooper@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 03D8352A20
	for <meta-arago@arago-project.org>;
	Fri, 24 Jan 2014 17:03:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0OH31rf032009
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:03:01 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH31QZ020037
	for <meta-arago@arago-project.org>; Fri, 24 Jan 2014 11:03:01 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 24 Jan 2014 11:03:00 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0OH2vxu026368;
	Fri, 24 Jan 2014 11:02:59 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 24 Jan 2014 12:27:15 -0600
Message-ID: <1390588035-27597-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] ts-calibrate-init: Fix QA warning
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
X-List-Received-Date: Fri, 24 Jan 2014 17:03:02 -0000
Content-Type: text/plain

* RDEPENDS statements should be package specific.
* Set the REDEPENDS to ${PN} to fix the QA warning message.
---
 .../tslib/ts-calibrate-init_1.0.bb                 |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 7148034..98588d3 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -1,12 +1,12 @@
 # This recipe installs an init script that can be used to invoke ts_calibrate
 # on systems that need this done during the boot sequence.
 DESCRIPTION = "TS calibration init script"
-RDEPENDS += "tslib"
+RDEPENDS_${PN} += "tslib"
 
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
 
-PR = "r0"
+PR = "r1"
 
 S = "${WORKDIR}"
 
-- 
1.7.0.4


