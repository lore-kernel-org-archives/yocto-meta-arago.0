Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B85ED529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:35:41 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMZY1v086365
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:35:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534890934;
	bh=625y1WZX2Nt+CGBBE9JGPjfG+Yr0HNFvMOEuaqmqioM=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=oTlqrFwWyd1ws1q8cd/91i79aRUXJjSZVbwheXi7jXfH6wTPNhrbQyF9iiYFkYYKw
	bnHyyxyjg7VMoJEAYAuivHRx1Wq+JHAVx0pWYSumIjTIr9pQl2dcI09uZ3ikVjF/ia
	2iMqUPRlAYtLZQc5KZnA5QSkwDKk9BFLu9EAsU5o=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMZYFB008321
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:35:34 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:35:33 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:35:34 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMZWkZ019327;
	Tue, 21 Aug 2018 17:35:33 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 18:23:37 -0400
Message-ID: <1534890218-32621-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534890218-32621-1-git-send-email-j-stiffler@ti.com>
References: <1534890218-32621-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH v3 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 22:35:42 -0000
Content-Type: text/plain

* Add the secondary toolchain to the devkit
  if SECONDARY_TARGET_ARCH is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v3 changes:
* fix "SECONDARY_*TARGET*_ARCH" in commit message

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


