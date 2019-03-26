Return-Path: <m-radhakrishnan2@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 357D952A17
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT1I2012245
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639341;
	bh=mT/ZXci2H1m42R/z3WJ1tP57ydJ/ICtI6ILoDlitbOc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=MQsgkKfsaR5vl9LkGL3Ub4Xtfz86jbgBsv8/B1TaYi5A0E/VA7oGYN1XPsnFgdeuQ
	FsjGryopPh5+jNZNtCrJ1XmVvQ0H0Shf4Ts/CHaHGEvRYTclTHFkAiMpqx5VYOMLn+
	DO7IJEMQOLlHMrcG8PAc0aUaKHN7ljgjcgIcunYQ=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT1HX118029
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:01 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tH116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:53 -0400
Message-ID: <1553639337-36226-4-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 3/7] mmcsd-lld-rtos: SRCREV bump to 01.00.00.15A
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
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend

diff --git a/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
new file mode 100644
index 0000000..7f3c56f
--- /dev/null
+++ b/recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.MMCSD_LLD.01.00.00.15A"
+MMCSD_LLD_SRCREV = "612a2d6dc91a73cdf290e4060228b0df5e209992"
+
+PV = "01.00.00.15A"
+PR = "r0"
-- 
1.9.1


