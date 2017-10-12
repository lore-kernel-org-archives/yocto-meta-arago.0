Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 7ED24529AC
	for <meta-arago@arago-project.org>;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 85C6820B03;
	Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id vWIZb4HJhf-s; Thu, 12 Oct 2017 21:28:17 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 606B720B04;
	Thu, 12 Oct 2017 21:28:16 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E9B8D1626F0;
	Thu, 12 Oct 2017 17:28:15 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 12 Oct 2017 17:28:09 -0400
Message-Id: <1507843693-2615-5-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1507843693-2615-1-git-send-email-denis@denix.org>
References: <1507843693-2615-1-git-send-email-denis@denix.org>
Subject: [master][PATCH 5/9] dual-camera-demo: no need for #!/bin/bash, use #!/bin/sh
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
X-List-Received-Date: Thu, 12 Oct 2017 21:28:18 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh               | 3 +--
 .../dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh               | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
index 7a3e497..6d9675d 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt4.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 /etc/init.d/matrix-gui-2.0 stop
 
@@ -8,4 +8,3 @@ export QWS_MOUSE_PROTO=Tslib:/dev/input/touchscreen0
 dual_camera -qws
 
 /etc/init.d/matrix-gui-2.0 start
-
diff --git a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
index 4802337..f01bea3 100644
--- a/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
+++ b/meta-arago-extras/recipes-multimedia/dual-camera-demo/dual-camera-demo/dual_camera_qt5.sh
@@ -1,4 +1,4 @@
-#!/bin/bash
+#!/bin/sh
 
 /etc/init.d/weston stop
 sleep 1
-- 
2.7.4


