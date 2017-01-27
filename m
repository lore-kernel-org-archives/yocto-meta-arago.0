Return-Path: <poojaprajod@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2789352AF5
	for <meta-arago@arago-project.org>;
	Fri, 27 Jan 2017 12:02:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v0RC2C3W003215
	for <meta-arago@arago-project.org>; Fri, 27 Jan 2017 06:02:12 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v0RC2BUR005437
	for <meta-arago@arago-project.org>; Fri, 27 Jan 2017 06:02:12 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 27 Jan 2017 06:02:11 -0600
Received: from uda0132412.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v0RC29fx020872;	Fri, 27 Jan 2017 06:02:11 -0600
From: Pooja Prajod <a0132412@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 27 Jan 2017 17:32:04 +0530
Message-ID: <1485518525-30230-2-git-send-email-a0132412@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1485518525-30230-1-git-send-email-a0132412@ti.com>
References: <1485518525-30230-1-git-send-email-a0132412@ti.com>
MIME-Version: 1.0
Cc: Pooja Prajod <a0132412@ti.com>
Subject: [PATCH 2/3] Revert "branding-core: temporarily disable mmip features due to gst 1.8.3"
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
X-List-Received-Date: Fri, 27 Jan 2017 12:02:12 -0000
Content-Type: text/plain

This reverts commit 3d85967977c55b83437869e054260815a5de3e32.
---
 meta-arago-distro/conf/distro/include/branding-core.inc | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-arago-distro/conf/distro/include/branding-core.inc b/meta-arago-distro/conf/distro/include/branding-core.inc
index 22ad8f4..a506e3c 100644
--- a/meta-arago-distro/conf/distro/include/branding-core.inc
+++ b/meta-arago-distro/conf/distro/include/branding-core.inc
@@ -10,7 +10,3 @@ ALTERNATIVE_PRIORITY_pn-opencl-monitor = "1"
 
 # Raise priority for sample IPC FW images
 ALTERNATIVE_PRIORITY_pn-ti-ipc-rtos = "15"
-
-# Temporarily disable "mmip" machine feature for all SOCs while building
-# latest code base, until gstreamer support is available for 1.8.3
-MACHINE_FEATURES := "${@d.getVar('MACHINE_FEATURES', True).replace('mmip', '')}"
-- 
1.9.1


