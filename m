Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 49BD752A14
	for <meta-arago@arago-project.org>;
	Fri,  8 Nov 2019 20:35:07 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXi8B024366
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1573245224;
	bh=TJhcTxgXzP3hZv4hmkuWl94i4KxeXC/65g6wrqWlwxo=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=EpN2pI9k/NcwuLsKeWv/xw5G0vZQgYE/W5N7NSJNplXlylTkcBoRBTLMpKf0r6gGc
	Vp6GnQCbrYvWhGYHRa5n9W9mbtXfyRaegOOe9v5IFqqSJ7zjDHyQKLkAYrVmhAIX9j
	4tfHmg8oNtQXv1TJBk4crkhuDrgEruWBpycQ6H3I=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xA8KXiCt117875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:44 -0600
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 8 Nov 2019 14:33:27 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 8 Nov 2019 14:33:28 -0600
Received: from UDA0850410.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id xA8KXhVP055122
	for <meta-arago@arago-project.org>; Fri, 8 Nov 2019 14:33:43 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Nov 2019 15:33:33 -0500
Message-ID: <20191108203333.31914-3-e-ruei1@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191108203333.31914-1-e-ruei1@ti.com>
References: <20191108203333.31914-1-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud][PATCH 2/2] packagegroup-arago-tisdk-graphics: replace chromium-wayland with chromium-ozone-wayland
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
X-List-Received-Date: Fri, 08 Nov 2019 20:35:08 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-graphics.bb      | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
index 02404bcd..0491307e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install graphics binaries"
 LICENSE = "MIT"
-PR = "r25"
+PR = "r26"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -14,11 +14,11 @@ GRAPHICS_WAYLAND = "\
 "
 
 GRAPHICS_WAYLAND_append_omap-a15 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
 "
 
 GRAPHICS_WAYLAND_append_k3 = "\
-    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-wayland','',d)} \
+    ${@bb.utils.contains('MACHINE_FEATURES','gpu','chromium-ozone-wayland','',d)} \
 "
 
 GRAPHICS_RDEPENDS = "\
-- 
2.17.1


