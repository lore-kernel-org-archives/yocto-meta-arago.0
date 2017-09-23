Return-Path: <h-gou@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 3030A529D3
	for <meta-arago@arago-project.org>;
	Sat, 23 Sep 2017 15:10:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8NFAwB8015985
	for <meta-arago@arago-project.org>; Sat, 23 Sep 2017 10:10:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506179458;
	bh=9TlOWBgvdfz8bAt3/SE++9Iq3YUQUYkT9Qy7f25d+AQ=;
	h=From:To:CC:Subject:Date;
	b=xKJRy7MWDbYH599hl+DRJNEBzPySCBHBzOsZyNJf3OH8lMIv4bC4Hxilw5NA4vndz
	zam0oMaVGZrDoeQg7NBCztDwM/B5jzyT8tIZpNuAxQh/ZnPtrhSr0xLckfcZzqNYtH
	PA+6DWpAcXxaR7o1cmjIND4s4r5JETV0B9CIYiQ8=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8NFAwIR031560
	for <meta-arago@arago-project.org>; Sat, 23 Sep 2017 10:10:58 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Sat, 23 Sep 2017 10:10:57 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Sat, 23 Sep 2017 10:10:57 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8NFAvVg004047;
	Sat, 23 Sep 2017 10:10:57 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Sat, 23 Sep 2017 11:10:52 -0400
Message-ID: <1506179452-13924-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processsor-sdk] [PATCH] tiovx-app-host: add RDEPENDS on tiovx-sys-iface-firmware
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
X-List-Received-Date: Sat, 23 Sep 2017 15:10:58 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-ti/tiovx/tiovx-app-host.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-ti/tiovx/tiovx-app-host.bb b/recipes-ti/tiovx/tiovx-app-host.bb
index 2ab0aa5..097fede 100644
--- a/recipes-ti/tiovx/tiovx-app-host.bb
+++ b/recipes-ti/tiovx/tiovx-app-host.bb
@@ -8,9 +8,9 @@ require recipes-ti/includes/tisdk-paths.inc
 require tiovx-sys.inc
 
 DEPENDS = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
-RDEPENDS_${PN} = " tiovx-sys-iface tiovx-lib-host ti-ipc cmem "
+RDEPENDS_${PN} = " tiovx-sys-iface tiovx-sys-iface-firmware tiovx-lib-host ti-ipc cmem "
 
-PR = "r1"
+PR = "r2"
 
 COMPATIBLE_MACHINE = "dra7xx"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
-- 
1.9.1


