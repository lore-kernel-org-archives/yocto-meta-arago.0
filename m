Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 88FDE5298A
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2018 16:05:23 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wATG5CUF098565
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 10:05:12 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543507512;
	bh=FIZRrQ2/PQtQMOOsNrKRaXA6aQ4SfnFLmOwV3L5RQk0=;
	h=From:To:Subject:Date;
	b=Hdt+ucJjZ3xjgkLXmd53b0EHbnXGwEE1fgWaC2sqjjoW2x70R8aCy+CqFJ/wwKt5K
	aJ9TotC5DsVvISWclWcIeOdjAA7eiawUyM0Yfzs6vNMOB2MkVS0hUApHwP9k31X2Ds
	cyUAqC6JXS34ni1N5Z3x7TOUQ0wQXnGPqZagvCkA=
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wATG5C2e018728
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 10:05:12 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Thu, 29 Nov 2018 10:05:12 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Thu, 29 Nov 2018 10:05:12 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wATG5CnI013760
	for <meta-arago@arago-project.org>; Thu, 29 Nov 2018 10:05:12 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 29 Nov 2018 11:05:05 -0500
Message-ID: <1543507505-40833-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] Revert "weston-init: add warning messages for requirement of input devices"
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
X-List-Received-Date: Thu, 29 Nov 2018 16:05:24 -0000
Content-Type: text/plain

This reverts commit e594e0697269c1b60fbd49aab9d76797e25a3e10.
This patch is no longer needed with the weston-conf patch to
allow Weston to start even when no input devices are found.
---
 .../recipes-graphics/wayland/weston-init/runWeston            | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
index 8bb968b..aed5d5f 100644
--- a/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
+++ b/meta-arago-distro/recipes-graphics/wayland/weston-init/runWeston
@@ -18,7 +18,11 @@ cat << EOF
 
 
 
-        Please wait... Weston is loading
+                                        Please wait...
+
+
+
+
 
 
 
@@ -26,11 +30,6 @@ cat << EOF
 
 
 
-Note: If you see that the display is stuck on this message
-for more than 5 seconds, Weston probably failed to run.
-Weston will not run without input devices such as
-touchscreen or a mouse. Please check your setup and
-attach an input device, and reboot.
 
 
 
-- 
1.9.1


