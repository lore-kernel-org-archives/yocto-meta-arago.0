Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id B706A529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:15:53 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMFkGq079538
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534889746;
	bh=kd3KNHY004zSCS5MMgJxb41Mu3xsHjBxngQnERhxLsE=;
	h=From:To:CC:Subject:Date;
	b=Htw3AFfIpynV1ffir8+HUwo1cRKvyUvaGu7xbfXbGYY8FrZ9+vZ/2w6omVfp4C7Cl
	mTJPeTzt0Wy+445QAY/c8h7AXgJsTT3TGaTNbttZq7Y98m8Kc/EZ/sZphd3zvPbBeR
	Wvn0tvWlgtHqHaEkqUCCT6EWKqQ+doDbIaGHJhqc=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMFkYA032428
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:15:46 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:15:45 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:15:45 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMFjim016317;
	Tue, 21 Aug 2018 17:15:45 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 18:03:46 -0400
Message-ID: <1534889027-32133-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v2 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 22:15:54 -0000
Content-Type: text/plain

* Add the secondary toolchain to the devkit
  if SECONDARY_TOOLCHAIN_ARCH is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* initialize SECONDARY_TOOLCHAIN_ARCH

 .../packagegroups/packagegroup-arago-cross-canadian.bbappend   | 10 ++++++++++
 1 file changed, 10 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
new file mode 100644
index 0000000..b05e493
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
@@ -0,0 +1,10 @@
+PR_append = ".arago0"
+
+SECONDARY_TARGET_ARCH ?= ""
+
+SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
+                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
+
+RDEPENDS_${PN}_append = " \
+    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
+"
-- 
2.7.4


