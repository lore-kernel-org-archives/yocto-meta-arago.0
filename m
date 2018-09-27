Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 4A20252A17
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2018 15:36:22 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8RFaD9W112578
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1538062573;
	bh=8QyBRB0XrvL+VT3hU5ek6Z5UnVouyxcKbavnCaVIsUM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QOPDuaemTTQVjaT43/H96clWIo2ZsfPzLhxr7mC29Mj0yKX0fdEhAJ/l2YmOUzW4x
	OvP5+gTchqjYsnrVO4AaGXCmXfjEAkNrDlAAqI5M+hLULKA7Ekdf23RafKNbKRBh0H
	mN59IKXcW+klj3bUlRB9XCaqSxugxN08uqt1Aong=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaDLb010322
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 27 Sep 2018 10:36:13 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 27 Sep 2018 10:36:13 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8RFaCvp031719
	for <meta-arago@arago-project.org>; Thu, 27 Sep 2018 10:36:13 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 27 Sep 2018 11:36:10 -0400
Message-ID: <1538062570-55253-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1538062570-55253-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH 2/2] big-data-ipc-demo: Update to version 01.02.00.00
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
X-List-Received-Date: Thu, 27 Sep 2018 15:36:23 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
index 307e5e9..3e6e5fa 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -8,14 +8,14 @@ BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git
 BIG_DATA_IPC_GIT_PROTOCOL = "git"
 BIG_DATA_IPC_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.01.00.00"
-BIG_DATA_IPC_SRCREV = "5907bff5a29fe2ba8719ae8c3c5d62b20b7b6bc9"
+# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.02.00.00"
+BIG_DATA_IPC_SRCREV = "5ef821453c58e997bba0cf47aa9f54e616097861"
 
 BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
 SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BIG_DATA_IPC_SRCREV}"
-PV = "01.01.00.00"
+PV = "01.02.00.00"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


