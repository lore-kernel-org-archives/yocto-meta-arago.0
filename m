Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 86AC152093
	for <meta-arago@arago-project.org>;
	Wed, 13 Dec 2017 20:42:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBDKgJgC015906
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:42:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513197739;
	bh=CU1oN56iTFD47GGaYmEl5OWNRg3NX3EoYASkzjpo4z4=;
	h=From:To:Subject:Date;
	b=ckFnV1h1JkS7nwt3jwqUp/nN0+llIBfHzSuuc+dSzen3TKzdV+sNa9ZS5Q2f7zY9W
	GaVOqCQX2teq99ZHhFTh5OEyYSdRcWeN45lVOHFmYeEQl+iLu5FIuGvr7ijtmOOlh3
	Pgi468HG6zTntGi9GTfaKQn4z8oWqqG9+OwiQBJk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKgJ9X002836
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:42:19 -0600
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 13 Dec 2017 14:42:19 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 13 Dec 2017 14:42:19 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBDKgJRi031864
	for <meta-arago@arago-project.org>; Wed, 13 Dec 2017 14:42:19 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 13 Dec 2017 15:42:16 -0500
Message-ID: <1513197736-17430-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] emac-lld-rtos: Update to version 1.0.3.8
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
X-List-Received-Date: Wed, 13 Dec 2017 20:42:21 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
new file mode 100644
index 0000000..70d5225
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -0,0 +1,12 @@
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.08"
+EMAC_LLD_SRCREV = "20b30c9dd37ae1f899e93b560dce41f804e43317"
+
+PV = "01.00.03.08"
+PR = "r0"
+
+# Build with make instead of XDC
+TI_PDK_XDCMAKE = "0"
+
+export PDK_EMAC_ROOT_PATH ="${WORKDIR}/build"
+export DEST_ROOT="${S}"
+
-- 
1.9.1


