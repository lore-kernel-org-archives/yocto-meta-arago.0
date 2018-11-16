Return-Path: <e-ruei1@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id BA90E52092
	for <meta-arago@arago-project.org>;
	Fri, 16 Nov 2018 19:53:31 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id wAGJrLBB129051
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:53:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1542398001;
	bh=vMu8aicXMWgKZT4gZ3Ajo4eQCd80WOGiPmWlzpW17ik=;
	h=From:To:Subject:Date;
	b=aJ0w+Sze4t1EJ+lvMJ5QuQF/N3HwRWokO7gJtozOiC/fNH60f4nxqJV3dVvUB756M
	+XPdSoJODkaUFDICquVLJpH+WCkwbusNUfP4pJfiUwAix7DwpfPx0YhXRHrQoub+kS
	CKDk+64tuNuiwLp04Yds6VT9qRDGWaQIlefGEpO8=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wAGJrL6W119967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:53:21 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 16 Nov 2018 13:53:21 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 16 Nov 2018 13:53:21 -0600
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wAGJrLCE012663
	for <meta-arago@arago-project.org>; Fri, 16 Nov 2018 13:53:21 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 16 Nov 2018 14:53:12 -0500
Message-ID: <1542397992-41880-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH] ti-sgx-ddk-km: bump SRCREV to pickup the latest changes as listed below
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
X-List-Received-Date: Fri, 16 Nov 2018 19:53:32 -0000
Content-Type: text/plain

- um: Validate mutex before lock and unlock
- um: Fix for RefCounting with mutex held
- um: Set the default mutex type to pthread mutex
- um: Fix the install path and scripts

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
index 179a56d..0c2dcac 100644
--- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
+++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk7"
+PR_append = ".tisdk8"
 
 BRANCH = "${@bb.utils.contains('MACHINE_FEATURES','sgx','ti-img-sgx/rocko/${PV}','ti-img-sgx-nohardware/${PV}',d)}"
-SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','9ad48144e89d48c7bf2db2a12795985e7a80e4fa','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
+SRCREV = "${@bb.utils.contains('MACHINE_FEATURES','sgx','bc62c9d0c590dfbc801bf6b10176c3a8b6a39d98','07acdd3981364d5c4afdcb250e30d392bb53f951',d)}"
-- 
1.9.1


