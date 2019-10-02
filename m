Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id D4C60520DF
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2019 19:18:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x92JH43J077578
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:17:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570043824;
	bh=gDNrqpXFghXsUFlvuywGSKpI4r04+HqzluLt1ok7kjQ=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=HxlV6kyZwFFdwXe5SjJV+SdmqpVGwrbPci0mRrEk8eJjhjVOpwSjiAqJ3YhU7kNwn
	B1H3ZB6qkrhNtD8i1RajdxHZhdVjCOhKIDUEUg3ojsdidRQyc5Ok0G50a4Hrny64a/
	7M0GDRvyU8Z3GZRXQeDg2xLSd5ysH8MF2fdrmDOE=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x92JH4u6117970
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:17:04 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 2 Oct 2019 14:16:53 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 2 Oct 2019 14:17:03 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x92JGwoA016195
	for <meta-arago@arago-project.org>; Wed, 2 Oct 2019 14:17:03 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 2 Oct 2019 15:16:57 -0400
Message-ID: <1570043817-9471-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1570043817-9471-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1570043817-9471-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] big-data-ipc-demo: SRCREV update to 01.03.00.00
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
X-List-Received-Date: Wed, 02 Oct 2019 19:18:16 -0000
Content-Type: text/plain

---
 .../recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc            | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
index 3e6e5fa..50d721b 100644
--- a/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
+++ b/meta-arago-extras/recipes-apps/big-data-ipc-demo/big-data-ipc-demo.inc
@@ -8,14 +8,14 @@ BIG_DATA_IPC_GIT_URI = "git://git.ti.com/processor-sdk/big-data-ipc-examples.git
 BIG_DATA_IPC_GIT_PROTOCOL = "git"
 BIG_DATA_IPC_GIT_BRANCH = "master"
 
-# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.02.00.00"
-BIG_DATA_IPC_SRCREV = "5ef821453c58e997bba0cf47aa9f54e616097861"
+# Below commit ID corresponds to "DEV.BIG_DATA_IPC.01.03.00.00"
+BIG_DATA_IPC_SRCREV = "984edb3c69c8a1f51da02e0abcd2201319650894"
 
 BRANCH = "${BIG_DATA_IPC_GIT_BRANCH}"
 SRC_URI = "${BIG_DATA_IPC_GIT_URI};protocol=${BIG_DATA_IPC_GIT_PROTOCOL};branch=${BRANCH}"
 
 SRCREV = "${BIG_DATA_IPC_SRCREV}"
-PV = "01.02.00.00"
+PV = "01.03.00.00"
 
 S = "${WORKDIR}/git"
 
-- 
1.9.1


