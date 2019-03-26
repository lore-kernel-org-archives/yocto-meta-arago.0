Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 1FF2C529CA
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT2jK016488
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639342;
	bh=cGblf1c7l2uAGP52XZbxX0/mKHhPw04rRM1eQi0k9o4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=L1likjxLEjGPInL4uSkE/mJWBpW4dg8OFRPmAThru36iShqZ5HUmfA0GMn7EUYW6U
	Pvcd4eCS3MHfKyYyiDx8snVXZe6zHlRbhlMfjBp9DLpvHx+62UDHWR9tw27yONBuzI
	ccY5T5MPxUoOaCy1dYy9D0pbq8M1VKbuWxb92Hu0=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT295032303
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:02 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:02 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tK116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:56 -0400
Message-ID: <1553639337-36226-7-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 6/7] icss-emac-lld: SRCREV bump to 01.00.00.15
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:20 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc  | 5 +++++
 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend | 2 ++
 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend  | 1 +
 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend      | 1 +
 4 files changed, 9 insertions(+)
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend
 create mode 100644 recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend

diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc b/recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc
new file mode 100644
index 0000000..53482df
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-01_00_00_15A.inc
@@ -0,0 +1,5 @@
+# Below commit ID corresponds to "DEV.ICSS_EMAC_LLD.01.00.00.15A"
+ICSS_EMAC_LLD_SRCREV = "94536e4f3087b87e0787f00637b00878ee085d1d"
+
+PV = "01.00.00.15A"
+INC_PR = "r0"
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
new file mode 100644
index 0000000..4d26cdc
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require icss-emac-lld-01_00_00_15A.inc
+
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend
new file mode 100644
index 0000000..626d80f
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld-test_git.bbppend
@@ -0,0 +1 @@
+require icss-emac-lld-01_00_00_15A.inc
diff --git a/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
new file mode 100644
index 0000000..626d80f
--- /dev/null
+++ b/recipes-bsp/icss-emac-lld/icss-emac-lld_git.bbappend
@@ -0,0 +1 @@
+require icss-emac-lld-01_00_00_15A.inc
-- 
1.9.1


