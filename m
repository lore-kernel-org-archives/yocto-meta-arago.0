Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B57C752A0B
	for <meta-arago@arago-project.org>;
	Wed, 19 Dec 2018 20:40:48 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBJKeamT028081
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545252036;
	bh=FNdBexwoX4VIedmZIUPwWpFxbAO4fFs/7ENzAG91n9g=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=OOccyDYd4LVlnGie4EULfLxmJlcJbjdqpqXvcPSFqqhb63XRIeRDwigL6MvfKz9vA
	WtjbekcxfPUQdPUu8eeBQ4FHJ8KWUyYRD4fEiYHQlLbraTMT9j3sKUFk/hG5VxK22H
	K+VtidtqvycJhNnQ7P0TztjkO/w08DL+NBNeBXzA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBJKeaND041002
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 19 Dec 2018 14:40:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 19 Dec 2018 14:40:36 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBJKeZmV020008
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Dec 2018 15:40:31 -0500
Message-ID: <1545252032-64526-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 2/3] spi-lld-rtos: SRCREV update to 01.00.00.13B
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
X-List-Received-Date: Wed, 19 Dec 2018 20:40:50 -0000
Content-Type: text/plain

---
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
index 4009250..cd27420 100644
--- a/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
+++ b/recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
@@ -1,6 +1,6 @@
 
-# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.13A"
-SPI_LLD_SRCREV = "2c6c4fe250383c8854be8fd58a6b599dbbe3fe8e"
+# Below commit ID corresponds to "DEV.SPI_LLD.01.00.00.13B"
+SPI_LLD_SRCREV = "07fd0f70b1656fb2ddde44d828592ec0358b0c37"
 
-PV = "01.00.00.13A"
+PV = "01.00.00.13B"
 PR = "r0"
-- 
1.9.1


