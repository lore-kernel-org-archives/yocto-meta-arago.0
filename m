Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 1BFFA52A66
	for <meta-arago@arago-project.org>;
	Tue, 11 Sep 2018 15:54:42 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8BFsYHx059966
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 10:54:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536681274;
	bh=s4kcMljXRhO82JpqkyxJ0cGSUKfsdJ1DZEExZLJjKIQ=;
	h=From:To:Subject:Date;
	b=dHZV3ZdCC03Z7BXT7TwVigqEwssWCdn7pL4eXXyB/BBnAkP+EFZKCLVomEbh5E2lQ
	uk9Kz5j+EVY6HQgsXKJ9UXF5n9Y+EeH8WS2YU+0iok99c28DcOpb/4uhGswH3KxkDI
	Le+dLlMRz9YJmFQWU5oPTMeg+zGPtJVIPaYW+ngk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BFsYoX031437
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 10:54:34 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 11 Sep 2018 10:54:34 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 11 Sep 2018 10:54:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8BFsYom020914
	for <meta-arago@arago-project.org>; Tue, 11 Sep 2018 10:54:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 11 Sep 2018 11:54:06 -0400
Message-ID: <1536681246-9165-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-sgx-ddk-um: bump SGX SRCREV to synchronize with meta-ti
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
X-List-Received-Date: Tue, 11 Sep 2018 15:54:44 -0000
Content-Type: text/plain

- bump SGX SRCREV to pick up latest bug fixes on DDK 1.14
- libGLESv2.so.1 link has already been up-streamed.


Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
index a48f670..9ccf343 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
@@ -1,8 +1,4 @@
-PR_append = ".tisdk6"
+PR_append = ".tisdk7"
 
 BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
-SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bbbd5cbb55e4c54d3b02456ae553bea86fd61506','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-
-do_install_append () {
-    ln -sf ./libGLESv2.so.${PV} ${D}${libdir}/libGLESv2.so.1
-}
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-- 
1.9.1


