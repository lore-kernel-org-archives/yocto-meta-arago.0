Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1B1B652973
	for <meta-arago@arago-project.org>;
	Fri, 20 Nov 2015 19:43:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAKJheeR029597
	for <meta-arago@arago-project.org>; Fri, 20 Nov 2015 13:43:40 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAKJheYt028671
	for <meta-arago@arago-project.org>; Fri, 20 Nov 2015 13:43:40 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Nov 2015 13:43:41 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAKJhe24009439;
	Fri, 20 Nov 2015 13:43:40 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1Zzrat-00075g-RG; Fri, 20 Nov 2015 14:43:39 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Nov 2015 14:43:37 -0500
Message-ID: <1448048618-27222-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 1/2] ts-calibrate-init: Clarify that calibration requires human interaction
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
X-List-Received-Date: Fri, 20 Nov 2015 19:43:43 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
index cd59b5b..57aeffa 100644
--- a/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
+++ b/meta-arago-extras/recipes-graphics/tslib/ts-calibrate-init/init
@@ -26,7 +26,10 @@ do
 done
 
 if [ ! -f $TSLIB_CALIBFILE ] ; then
-    echo -n "Calibrating touchscreen (first time only)"
+    echo    "Calibrating touchscreen (first time only)"
+    echo
+    echo    "*** To continue, please complete the touchscreen calibration"
+    echo -n "*** by touching the crosshairs on the LCD screen"
     ts_calibrate
     echo "."
 
-- 
1.9.1


