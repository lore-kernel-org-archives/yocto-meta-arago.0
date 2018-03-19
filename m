Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 7A29452970
	for <meta-arago@arago-project.org>;
	Mon, 19 Mar 2018 14:52:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w2JEpLSa017407
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:51:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1521471081;
	bh=6jJUN9lbUMKqihoAWGC8VDjkHm8FmpNEVDr6h5Ha2Z8=;
	h=From:To:Subject:Date;
	b=kovsZcj+Djxy7bAQ6d+/KfYT5htsSzXCoLz0ztJLvJFxOS+Tbk2kM6U3JeK9ov/nm
	M5xa4I2K/FIbjC6XzcpJORayuaM5tOCGb17c2DJGXlHQhI3ztEbSNujkjgRLujwVTU
	cS63LBt+3z2eOlRgx5aQrw7IxTIpZbeRGO841unk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEpL6L002425
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:51:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 19 Mar 2018 09:51:20 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 19 Mar 2018 09:51:20 -0500
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w2JEpK8V002435
	for <meta-arago@arago-project.org>; Mon, 19 Mar 2018 09:51:20 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 19 Mar 2018 10:51:19 -0400
Message-ID: <1521471079-23822-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH] jailhouse-rtos: Update to the latest version
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
X-List-Received-Date: Mon, 19 Mar 2018 14:52:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-support/jailhouse/jailhouse-examples-rtos_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
index 2ffe853..3bcd331 100644
--- a/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
+++ b/recipes-support/jailhouse/jailhouse-examples-rtos_git.bb
@@ -6,10 +6,10 @@ LIC_FILES_CHKSUM = "file://${WORKDIR}/git/baremetal/soc/am572x/rules.mk;endline=
 
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/processor-sdk/jailhouse-inmate.git;branch=${BRANCH}"
-SRCREV = "607f8ab44ae4455a49238b6ee94d5bf5a7b7e24c"
+SRCREV = "8ccdfdf8761d2df8b0e8ae822dfc69128e988d09"
 
 PV = "1.0"
-PR = "r4"
+PR = "r5"
 
 require recipes-ti/includes/tisdk-paths.inc
 
-- 
1.9.1


