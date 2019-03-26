Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B04BC52A31
	for <meta-arago@arago-project.org>;
	Tue, 26 Mar 2019 22:29:16 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT2Js109639
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1553639342;
	bh=G40LUr/6/FoItZeGEbwu6CbzWCfFujETngcp+VEMUR4=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=bCG2k9yzRtOSZxIiWiW47C3xgKZmbkCxNKxOk42JT47QGF+S0yIJkoKc9CuWgtGev
	yiuuamr1L+7LR+lRVP6bl1YuZtAH9wdx2W+kGhBb49X6uOfnYh6ORofxDNA9Q+jOd+
	Df+Hz5+ojaT4hlEC7WJQvnNzfy0+IBi8Kq+W61cQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x2QMT29L118045
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:02 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 26 Mar 2019 17:29:01 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 26 Mar 2019 17:29:02 -0500
Received: from uda0875154a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x2QMT0tJ116656
	for <meta-arago@arago-project.org>; Tue, 26 Mar 2019 17:29:01 -0500
From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 26 Mar 2019 18:28:55 -0400
Message-ID: <1553639337-36226-6-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
References: <1553639337-36226-1-git-send-email-m-radhakrishnan2@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master][meta-processor-sdk][PATCH 5/7] ti-pdk-build-rtos: SRCREV bump to version 01.00.00.12A
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
X-List-Received-Date: Tue, 26 Mar 2019 22:29:19 -0000
Content-Type: text/plain

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend | 5 +++++
 1 file changed, 5 insertions(+)
 create mode 100644 recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend

diff --git a/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend
new file mode 100644
index 0000000..23e24eb
--- /dev/null
+++ b/recipes-ti/ti-pdk-build/ti-pdk-build-rtos_git.bbappend
@@ -0,0 +1,5 @@
+# Below Commit ID corresponds to "DEV.PDK_BUILD.01.00.00.12A"
+PDK_BUILD_SRCREV = "a4f962db3b47610a014a895fd95a281b49c2c567"
+
+PV = "01.00.00.12A"
+PR = "r0"
-- 
1.9.1


