Return-Path: <chase.maupin@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id D6A0E52998
	for <meta-arago@arago-project.org>;
	Thu, 30 Jan 2014 19:45:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0UJjIK5003535
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 13:45:18 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0UJjIQW026296
	for <meta-arago@arago-project.org>; Thu, 30 Jan 2014 13:45:18 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 30 Jan 2014 13:45:17 -0600
Received: from sdit-build04.dal.design.ti.com (dbdp20.itg.ti.com
	[172.24.170.38])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	s0UJjE7p018370;	Thu, 30 Jan 2014 13:45:16 -0600
From: Chase Maupin <chase.maupin@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 30 Jan 2014 13:45:12 -0600
Message-ID: <1391111112-18039-1-git-send-email-chase.maupin@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] ts-calibrate-init: export TSLIB_TSDEVICE
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
X-List-Received-Date: Thu, 30 Jan 2014 19:45:19 -0000
Content-Type: text/plain

* This is normally exported as part of the /etc/profile.d/tslib.sh
  script but when we run this as an init script we need to export
  this environment variable in order for tslib to properly configure
  the touchscreen.

Signed-off-by: Chase Maupin <chase.maupin@ti.com>
---
 .../recipes-graphics/tslib/ts-calibrate-init/init  |    3 ++-
 .../tslib/ts-calibrate-init_1.0.bb                 |    2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
index 26ea581..5d5c0aa 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -11,10 +11,11 @@
 # GNU General Public License for more details.
 
 tsfile=/etc/pointercal
+export TSLIB_TSDEVICE=/dev/input/touchscreen0
 
 # First let's check if we even see a touchscreen device node.  If not
 # then bail out.
-if [ ! -e /dev/input/touchscreen0 ]
+if [ ! -e $TSLIB_TSDEVICE ]
 then
     exit
 fi
diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
index 98588d3..dde5c42 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init_1.0.bb
@@ -6,7 +6,7 @@ RDEPENDS_${PN} += "tslib"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://init;beginline=2;endline=11;md5=4b2e3b15f01cf63d2cb7988afdcc6c60"
 
-PR = "r1"
+PR = "r2"
 
 S = "${WORKDIR}"
 
-- 
1.7.9.5


