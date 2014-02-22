Return-Path: <fcooper@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CC4AE52AA9
	for <meta-arago@arago-project.org>;
	Sat, 22 Feb 2014 00:18:09 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1M0I9we029064
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 18:18:09 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1M0I9KJ006891
	for <meta-arago@arago-project.org>; Fri, 21 Feb 2014 18:18:09 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Feb 2014 18:18:09 -0600
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1M0I13h010724;
	Fri, 21 Feb 2014 18:18:07 -0600
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Feb 2014 18:17:57 -0600
Message-ID: <1393028277-20051-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1393028277-20051-1-git-send-email-fcooper@ti.com>
References: <1393028277-20051-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] dual-camera-demo: Update dual camera demo with bug fixes
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
X-List-Received-Date: Sat, 22 Feb 2014 00:18:10 -0000
Content-Type: text/plain

* Pull in some bug fixes in the dual camera demo.
* Add frame rate limiter to limit frame rate to ~30 fps which drops CPU load by
  60%.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../dual-camera-demo/dual-camera-demo_1.0.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
index ba3cc57..1f9b941 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo_1.0.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://main.cpp;beginline=1;endline=18;md5=1e0116b09fc3d8f88
 
 require recipes-core/matrix/matrix-gui-paths.inc
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "master"
-SRCREV = "e8412769dfe650afd528dc2eb791ddf96143771e"
+SRCREV = "a877c704eba77fc09aec54211b387b95e62e523b"
 
 SRC_URI = "git://gitorious.org/dual-camera-demo/dual-camera-demo.git;protocol=git;branch=${BRANCH}"
 
-- 
1.7.0.4


