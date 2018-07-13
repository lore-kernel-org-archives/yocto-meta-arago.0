Return-Path: <h-gou@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 06B75529B2
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 17:03:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DH2vc4033538
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 12:02:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531501377;
	bh=zqthGVZ8ksmgf1WiXC0SbfSXReThgFmssG+zpZ+YH2M=;
	h=From:To:CC:Subject:Date;
	b=iM62C+m+UvoGSrkevUkrt8VDcY2hPOdfbRdjAeN/GfEUGdeswRezZFQOT5oDTGtqh
	lcui02DSquY/DP+dcdQInlB4R+XHavpinVJwFQHcLOx9dy9e55X87CUEdSCfvyRCnC
	RNxG70pAZyykpshQbv/j8RYSfxYNwlal1yzGJ1qs=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DH2vKk029291
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 12:02:57 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 12:02:57 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 12:02:56 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DH2uah017076;
	Fri, 13 Jul 2018 12:02:57 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jul 2018 13:02:55 -0400
Message-ID: <1531501375-18476-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [ti2018.01/rocko/master] [PATCH] packagegroup-arago-tisdk-multimedia: add ipumm-fw for am5-hs
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
X-List-Received-Date: Fri, 13 Jul 2018 17:03:04 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb            | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 1c1e7d0..45b9b4b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add multimedia related packages"
 LICENSE = "MIT"
-PR = "r21"
+PR = "r22"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -40,6 +40,10 @@ ACCEL_FW_append_am57xx-evm = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
 "
 
+ACCEL_FW_append_am57xx-hs-evm = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
+"
+
 ACCEL_FW_append_omap5-evm = " \
     ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
 "
-- 
1.9.1


