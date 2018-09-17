Return-Path: <e-ruei1@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 59296529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 22:38:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HMclcC020910
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 17:38:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537223927;
	bh=dGbe3RuB0e7knK0hlH/JDx6GGQVw4guDCz1LrbcW90Y=;
	h=From:To:Subject:Date;
	b=r+8Si5QsyAYAoCEzOU5m+J6wyrVFy1U9wQfW75bY4QSaf46ER1hLVyT01Xjy+Kb1i
	kr/RJ7tz4AL1fveq5ii8kvbYKi+cvKP62ELg4dpDQdHiEAeaNiSN74KQ+rFaj2FdJc
	PB9puCztu8dCB8+f4pdhnXDHs3iHpFn6Puvdhbeg=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HMckF1020873
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 17:38:46 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 17:38:46 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 17:38:46 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HMcju0017685
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 17:38:45 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 18:38:39 -0400
Message-ID: <1537223919-14381-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] weston-init: add warning messages for requirement of input devices
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
X-List-Received-Date: Mon, 17 Sep 2018 22:38:56 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../recipes-graphics/wayland/weston-init.bbappend             |  2 +-
 .../recipes-graphics/wayland/weston-init/runWeston            | 11 ++++++-----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
index 041e5ab..4ed6a62 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".arago7"
+PR_append = ".arago8"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
index aed5d5f..8bb968b 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -18,11 +18,7 @@ cat << EOF
 
 
 
-                                        Please wait...
-
-
-
-
+        Please wait... Weston is loading
 
 
 
@@ -30,6 +26,11 @@ cat << EOF
 
 
 
+Note: If you see that the display is stuck on this message
+for more than 5 seconds, Weston probably failed to run.
+Weston will not run without input devices such as
+touchscreen or a mouse. Please check your setup and
+attach an input device, and reboot.
 
 
 
-- 
1.9.1


