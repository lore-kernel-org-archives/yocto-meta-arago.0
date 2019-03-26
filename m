Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id CF8C7529D3
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:15 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT1uu079689
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639341;
	bh=2h2MZhOFQ23sDZHeMBB1QuyNy7/zf9DXSJgvBXTRVLE=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LYgZF05HMKZb0sLs/BEmqleBfecYUfThA+za/oewoS0AAD8qke7LyUXbhWVc4T2UR
	7QVo2q1lpS1Z7ThsEznh8Ir2ab/+BiI9EJHNQf0oobBGK96H0Lvv45si2x5DYi5KqF
	WMv5gvSoSzXhBcILmvfFheFKuege06OM+rpVmtZI=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT1Pq043347
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:01 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tG116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:00 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:52 -0400
Message-ID: <1553639337-36226-3-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 2/7] emac-lld-rtos: SRCREV bump to 01.00.03.14B
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:17 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend

diff --git a/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
new file mode 100644
index 0000000..9b67337
--- /dev/null
+++ b/recipes-bsp/emac-lld/emac-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.EMAC_LLD.01.00.03.14B"
+EMAC_LLD_SRCREV = "9ad95cde88aae23aaedf95d2146cab4a388e70d3"
+
+PV = "01.00.03.14B"
+PR = "r0"
-- 
1.9.1


