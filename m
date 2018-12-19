Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 9795C529B8
	for <meta-arago@arago-project.org>;
	Wed, 19 Dec 2018 20:40:48 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBJKeaT4028085
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1545252036;
	bh=KVlwXWFKLIkklB/86jARRnzJXHJhVNFwpSYB5zWoKBA=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=QCYAiA1g4O7E9AuKIZWawJtY6dPD0oQYm1Shex8yx+RvJ93wVk4xtA149k2tZ0bz5
	KC7x6Ujd/WWzls4DFYqw6Fycg0GUmqzSOBAlCoUwu4hFON9hy88/5QWZkM7rIXBe1a
	2n24/HsHo7skygpLG6Xt7b1P15ByHjtngEn0bxaU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBJKeacE013622
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 19 Dec 2018 14:40:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 19 Dec 2018 14:40:36 -0600
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBJKeZmW020008
	for <meta-arago@arago-project.org>; Wed, 19 Dec 2018 14:40:36 -0600
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Dec 2018 15:40:32 -0500
Message-ID: <1545252032-64526-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1545252032-64526-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 3/3] mmcsd-lld-rtos: SRCREV update to 01.00.00.14B
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
X-List-Received-Date: Wed, 19 Dec 2018 20:40:49 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
new file mode 100644
index 0000000..044c471
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.14B"
+MMCSD_LLD_SRCREV = "d5a79b543b47dfba764b567e21963426a318ae83"
+
+PV = "01.00.00.14B"
+PR = "r0"
-- 
1.9.1


