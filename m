Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id B90BB52A56
	for <meta-arago@arago-project.org>;
	Thu, 26 May 2016 11:35:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u4QBZ98V024811
	for <meta-arago@arago-project.org>; Thu, 26 May 2016 06:35:09 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4QBZ9md024696
	for <meta-arago@arago-project.org>; Thu, 26 May 2016 06:35:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 26 May 2016 06:35:09 -0500
Received: from swubn04.dhcp.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u4QBZ7FL026802;
	Thu, 26 May 2016 06:35:08 -0500
From: Karthik Ramanan <a0393906@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 26 May 2016 17:04:50 +0530
Message-ID: <1464262490-15361-1-git-send-email-a0393906@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] weston-conf: set default backend to drm-backend
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
X-List-Received-Date: Thu, 26 May 2016 11:35:10 -0000
Content-Type: text/plain

Signed-off-by: Karthik Ramanan <a0393906@ti.com>
---
 meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
index 615a604..4178ed3 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-conf/weston.ini
@@ -1,3 +1,6 @@
+[core]
+backend=drm-backend.so
+
 [shell]
 locking=false
 animation=zoom
-- 
1.9.1


