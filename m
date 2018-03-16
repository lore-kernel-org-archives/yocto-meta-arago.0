Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 48DF952994
	for <meta-arago@arago-project.org>;
	Fri, 16 Mar 2018 15:46:12 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2GFjHcF030348
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521215117;
	bh=nuTiohq3+mdJ7c/f4rRx2gl3jn8utUeolz02RekGLiQ=;
	h=From:To:Subject:Date;
	b=nyDoE1Zl6rwVTBfXbqY8QsbFPuipzz7QrwXmXOceOjv93HqXItRFKAqu54/ffyqHw
	6hD/HM6zlD3kDqgq4soto3wMiwYWowmQm+BqwunU5wBgZCJrLTRQJ0Z4L29qR0izwY
	RyND3mHdHvKhEalgurAxwlHhP40JmOLRVtI7oi6U=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFjHpf022434
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:45:17 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Fri, 16 Mar 2018 10:45:17 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Fri, 16 Mar 2018 10:45:17 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2GFjHNS029457
	for <meta-arago@arago-project.org>; Fri, 16 Mar 2018 10:45:17 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Mar 2018 11:45:16 -0400
Message-ID: <1521215116-26591-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] emac-lld-rtos:Updating to version 01.00.03.10A
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
X-List-Received-Date: Fri, 16 Mar 2018 15:46:12 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
index fa4a70a..6bc480b 100644
--- a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -1,11 +1,6 @@
-# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08A"
-EMAC_LLD_SRCREV = "20a21b3c25fcfebbc0450e88397a4be135ff703b"
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.10A"
+EMAC_LLD_SRCREV = "a2b663fcdfb485806f5a547336b343e73ebbae86"
 
-PV = "01.00.03.08A"
+PV = "01.00.03.10A"
 PR = "r0"
 
-# Build with make instead of XDC
-TI_PDK_XDCMAKE = "0"
-
-export PDK_EMAC_ROOT_PATH ="${WORKDIR}/build"
-export DEST_ROOT="${S}"
-- 
1.9.1


