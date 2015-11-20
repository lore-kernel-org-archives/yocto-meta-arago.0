Return-Path: <jake@udc0866934>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 19F315208B
	for <meta-arago@arago-project.org>;
	Fri, 20 Nov 2015 19:43:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAKJhfDP025366
	for <meta-arago@arago-project.org>; Fri, 20 Nov 2015 13:43:41 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAKJhfOC002289
	for <meta-arago@arago-project.org>; Fri, 20 Nov 2015 13:43:41 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 20 Nov 2015 13:43:41 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAKJheGT022225;
	Fri, 20 Nov 2015 13:43:40 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1Zzrau-00075l-FX; Fri, 20 Nov 2015 14:43:40 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Nov 2015 14:43:38 -0500
Message-ID: <1448048618-27222-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448048618-27222-1-git-send-email-j-stiffler@ti.com>
References: <1448048618-27222-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] weston-init: Clarify that calibration requires human interaction
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
 meta-arago-distro/recipes-graphics/wayland/weston-init/init | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/init b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
index b2648f9..2e2ae36 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/init
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/init
@@ -67,7 +67,10 @@ case "$1" in
             cp "$SD_CALUDEV_FILE" "$WS_CALUDEV_FILE"
         else
             # Run a calibration app and save output to udev rules
-            echo -n "Calibrating touchscreen (first time only)"
+            echo    "Calibrating touchscreen (first time only)"
+            echo
+            echo    "*** To continue, please complete the touchscreen calibration"
+            echo -n "*** by touching the crosshairs on the LCD screen"
             sleep 1
             CAL_VALUES=`weston-calibrator|cut -c21-`
             echo 'SUBSYSTEM=="input", ENV{WL_CALIBRATION}="'$CAL_VALUES'"' > $WS_CALUDEV_FILE
-- 
1.9.1


