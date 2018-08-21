Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 66CC352AFF
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 19:25:59 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LJPpEs054631
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534879551;
	bh=VA1pKWd3SUVzmbM6G6k7mSRpnLV9BMxoYAzv4hPQYcA=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=GKForLEXopCq/3VPSAUHuZ1dPRBD2DkaZ9XDx0Yixdm7rwvV9IBnBKtYau4BWFBzV
	ZYLTtyhfPovWjPgQ3wrnau5S5q/e5aZOmIv2bimv8A/VZqFKCl0PC4bJVOwPIbJeOi
	frq2lCYw6gH/RFmmjA+pLZyVLBio9bdN+pSd9gp0=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPo0r018300
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 14:25:50 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 14:25:50 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 14:25:50 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LJPn9J026051;
	Tue, 21 Aug 2018 14:25:50 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 21 Aug 2018 15:13:56 -0400
Message-ID: <1534878837-20469-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
References: <1534878837-20469-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [PATCH 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 19:26:01 -0000
Content-Type: text/plain

* Add the secondary toolchain to the devkit
 if SECONDARY_TOOLCHAIN_ARCH is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-cross-canadian.bbappend      | 8 ++++++++
 1 file changed, 8 insertions(+)
 create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
new file mode 100644
index 0000000..f02dfd9
--- /dev/null
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
@@ -0,0 +1,8 @@
+PR_append = ".arago0"
+
+SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
+                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
+
+RDEPENDS_${PN}_append = " \
+    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
+"
-- 
2.7.4


