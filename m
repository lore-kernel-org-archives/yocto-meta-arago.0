Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 288ED5299D
	for <meta-arago@arago-project.org>;
	Tue, 19 Dec 2017 18:06:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBJI6kEK019582
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 12:06:46 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513706806;
	bh=7hSwVcuxjCYafqgQy+/vRtPomB12NDcZ5aG276sJZqI=;
	h=From:To:Subject:Date;
	b=gYwro/m3YtrCTq8qWw/bOGmnVAQY8wOu8KWWJMez46V/JbdHPupb+3YItv1IVZXQn
	Nr2VmZNyslNNnvq8QEGlyG/3D22FfjYaMRGgzkp0AqYED+vaOxmGAqm1hjbVzSG8DD
	cN+mkuzyU9h79HEkfxnj56mA/dGHO8OJhiUAYdnk=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJI6kcm010446
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 12:06:46 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Tue, 19 Dec 2017 12:06:46 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Tue, 19 Dec 2017 12:06:46 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBJI6jQe013857
	for <meta-arago@arago-project.org>; Tue, 19 Dec 2017 12:06:46 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 19 Dec 2017 13:06:44 -0500
Message-ID: <1513706804-3543-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] icss-emac-lld: Adding support to include k2g-hs-evm also
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
X-List-Received-Date: Tue, 19 Dec 2017 18:06:47 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
index 37ff6e0..0ec3b2c 100644
--- a/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01.00.00.inc
@@ -1,7 +1,7 @@
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://icss_emacDrv.h;beginline=1;endline=40;md5=88d270788c1d8516511304f11a28586d"
 
-COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g-evm"
+COMPATIBLE_MACHINE = "ti33x|ti43x|am57xx-evm|k2g"
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 ICSS_EMAC_LLD_GIT_URI = "git://git.ti.com/keystone-rtos/icss-emac.git"
-- 
1.9.1


