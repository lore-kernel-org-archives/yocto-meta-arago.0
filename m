Return-Path: <e-ruei1@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 87842529AF
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 12:30:43 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HCUZXd010304
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:30:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537187435;
	bh=UIoh5fzTqpQEvvBuIwMWCeILCgCgSc3GITkT6XsUNlU=;
	h=From:To:Subject:Date;
	b=hw36c2Ep3pJLPj72cs5pDXcyXb/9sEHbjUOJT6QhmxybfLYzWPDdGnRSzeDtPXr+R
	FbiARVqlyXbZDTWJ/b+n2bVKWazTUS+eDr+w6+5tOL7rnmV7aFGxFhiFTakuWgWemc
	iRdYG111HlzHbxyQBo+QHbOvPY6u8pAKYvf22WgE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HCUZ2d026097
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:30:35 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 07:30:35 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 07:30:35 -0500
Received: from uda0850410.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HCUYOC014875
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 07:30:34 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 08:30:30 -0400
Message-ID: <1537187430-57902-1-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH] packagegroup-arago-tidsk-hmi-sdk-host: add evse demo source for k3 devices
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
X-List-Received-Date: Mon, 17 Sep 2018 12:30:44 -0000
Content-Type: text/plain

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb          | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
index 4921147..dd3407d 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-hmi-sdk-host.bb
@@ -1,6 +1,6 @@
 SUMMARY = "Task to add HMI related sources into the SDK"
 LICENSE = "MIT"
-PR = "r0"
+PR = "r1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -22,6 +22,10 @@ HMI_append_omap-a15 = " \
     evse-hmi-src \
 "
 
+HMI_append_k3 = " \
+    evse-hmi-src \
+"
+
 RDEPENDS_${PN} = "\
     ${HMI} \
 "
-- 
1.9.1


