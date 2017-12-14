Return-Path: <m-radhakrishnan2@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id EBCF652985
	for <meta-arago@arago-project.org>;
	Thu, 14 Dec 2017 20:01:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id vBEK1jHK016674
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:01:45 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1513281705;
	bh=Dt8i4k7MXjKHzFT+ujEPw0GU6lpW7/osILYAA3xIXis=;
	h=From:To:Subject:Date;
	b=QkZeHhVQAOOWgiL9Bsijnja3AeUU7gL6n6BJH8N/qDAES+lyNZDnNyT4EgqQNGl1K
	zU3nd6Y+sFiy2CkE3/ipFXlRXHtrmQPeqrMZC1Wz41QQBhFl6bLpfwxxFQ7p1uLOja
	lWdyVU0iDGv2jr+2ou7Bun3tk35SN+b+8bChypoA=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEK1jxe032360
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:01:45 -0600
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Thu, 14 Dec 2017 14:01:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Thu, 14 Dec 2017 14:01:45 -0600
Received: from uda0875154a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id vBEK1iAp028188
	for <meta-arago@arago-project.org>; Thu, 14 Dec 2017 14:01:45 -0600
From: Mahesh Radhakrsihnan <m-radhakrishnan2@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 14 Dec 2017 15:01:39 -0500
Message-ID: <1513281699-43877-1-git-send-email-m-radhakrishnan2@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [morty][meta-processor-sdk][PATCH ] ti-ndk: Updating to ndk 2.26.0.8
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
X-List-Received-Date: Thu, 14 Dec 2017 20:01:46 -0000
Content-Type: text/plain

From: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>

Signed-off-by: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>
---
 recipes-ti/ndk/ti-ndk_2.26.00.08.bb | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 recipes-ti/ndk/ti-ndk_2.26.00.08.bb

diff --git a/recipes-ti/ndk/ti-ndk_2.26.00.08.bb b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
new file mode 100644
index 0000000..e587bf9
--- /dev/null
+++ b/recipes-ti/ndk/ti-ndk_2.26.00.08.bb
@@ -0,0 +1,13 @@
+require ti-ndk.inc
+
+PV = "2_26_00_08"
+PR = "r0"
+
+LIC_FILES_CHKSUM = "file://ndk_${PV}_manifest.html;md5=e2a7d40cf1e7207ac3dd6d993d71ee8c"
+
+SRC_URI[ndkzip.md5sum] = "09c7ffaff305f3083d15c0a0db73d781"
+SRC_URI[ndkzip.sha256sum] = "5b22c6b8bfbf3a22c53f52bf880d5cf49daf386716942a4202569521bb30f4a8"
+
+INHIBIT_PACKAGE_STRIP = "1"
+INHIBIT_PACKAGE_DEBUG_SPLIT = "1"
+INHIBIT_SYSROOT_STRIP = "1"
-- 
1.9.1


