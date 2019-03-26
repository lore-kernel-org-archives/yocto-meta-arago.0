Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id DA06B529D8
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:15 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT1mM016463
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639341;
	bh=XisMgYTNidsZ73pmlzqJGypvGvyQnVL3px+pSOXI7aM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=v8Pv5caLWflQ1hAQfG8gVb/Qk6IaxqMHlVbvLFdpwwfXkSZyfcunznJO04cdMre9B
	YsVnbph/Jl4LsQyhRf7K7GDaWNtS/KXYNy3x+zNJF7fcHeyC/hOuhLrfgI7R4y31Op
	Gso5l2gwyPe/DpaX/RTROGzpoU02eSYykL6WRm1g=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT1WU117990
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:00 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:00 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tF116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:00 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:51 -0400
Message-ID: <1553639337-36226-2-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 1/7] common-csl-ip: SRCREV bump to 03.03.00.14C
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
 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc  | 5 +++++
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend | 2 ++
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      | 1 +
 3 files changed, 8 insertions(+)
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 create mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend

diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc
new file mode 100644
index 0000000..c2f85a2
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-03_03_00_14C.inc
@@ -0,0 +1,5 @@
+PV = "03.03.00.14C"
+INC_PR = "r0"
+# Below commit ID corresponding to "DEV.CSL_PROCESSOR-SDK.03.03.00.14C"
+CSL_SRCREV = "e0e88283f3c9c5afd5b1fd93986f2a67186f5b13"
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
new file mode 100644
index 0000000..dcba4fe
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
@@ -0,0 +1,2 @@
+require common-csl-ip-03_03_00_14C.inc
+
diff --git a/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
new file mode 100644
index 0000000..d010f03
--- /dev/null
+++ b/recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
@@ -0,0 +1 @@
+require common-csl-ip-03_03_00_14C.inc
-- 
1.9.1


