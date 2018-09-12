Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B746052A2B
	for <meta-arago@arago-project.org>;
	Wed, 12 Sep 2018 18:23:24 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8CINE7n048063
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 13:23:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536776594;
	bh=Rr/lNctTVZNvVH/dfPUGuE/jsgvUjjk+1lmTEDNm2Po=;
	h=From:To:Subject:Date;
	b=lwH/CS2WlzvySmo3dxXDA8T5sp4hOH1NCEFBuWMiNU9snlopBqOTGvPFX15quhnlt
	Rga7rD4aGPB7sq02PFSJ1QRoJJ8Jx1FvHpXs2Rr5jqlAgVoAHIYiNUMt59PITfiRYm
	Syv24yc5gfgqZU3SCBglbkvVPOAja2Jim2/7WdJ0=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CINExw009177
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 13:23:14 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 12 Sep 2018 13:23:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 12 Sep 2018 13:23:14 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8CINEbb026772
	for <meta-arago@arago-project.org>; Wed, 12 Sep 2018 13:23:14 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Sep 2018 14:22:59 -0400
Message-ID: <1536776579-40448-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2] ti-sgx-ddk-um: bump SGX SRCREV to synchronize with meta-ti
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
X-List-Received-Date: Wed, 12 Sep 2018 18:23:30 -0000
Content-Type: text/plain

- bump SGX SRCREV to pick up latest bug fixes on DDK 1.14
- libGLESv2.so.1 link has already been up-streamed.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
index a48f670..179a56d 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
@@ -1,8 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
-BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
-SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-
-do_install_append () {
-    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
-}
+BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-- 
1.9.1


