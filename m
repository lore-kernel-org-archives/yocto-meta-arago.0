Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 651A752978
	for <meta-arago@arago-project.org>;
	Fri, 13 Jul 2018 18:07:52 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6DI7juR087252
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:07:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1531505265;
	bh=vEasBr3urmV2M19r51nn2NbzPcmO93OEOujfTpbF29U=;
	h=From:To:CC:Subject:Date;
	b=KN2LGIFHazLzdtPskKzIZv7ahbIPH7i3QBWthlLjLJUf/Svg+hH9SRry51P58i88V
	CL/FLtWW/ySnjxn9MIwTsLP90QVNTQCkioaIUW+AonC3qyqr6QON3HHptoLYfbBevd
	eoc4Oy7E+n598o+ii27Yyza4shMv1yjWCIjjXQSw=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DI7jfi023469
	for <meta-arago@arago-project.org>; Fri, 13 Jul 2018 13:07:45 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Fri, 13 Jul 2018 13:07:45 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Fri, 13 Jul 2018 13:07:45 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6DI7j7j013061;
	Fri, 13 Jul 2018 13:07:45 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 13 Jul 2018 14:07:43 -0400
Message-ID: <1531505263-19455-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [ti2018.01/rocko/master] [PATCH v2] packagegroup-arago-tisdk-multimedia: add ipumm-fw for am5-hs and dra7-hs
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
X-List-Received-Date: Fri, 13 Jul 2018 18:07:52 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v2 change: add ipumm-fw for dra7-hs also

 .../packagegroups/packagegroup-arago-tisdk-multimedia.bb       | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-multimedia.bb
index 1c1e7d0..0bad258 100644
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
@@ -49,6 +53,10 @@ ACCEL_FW_append_dra7xx-evm = " \
     vis \
 "
 
+ACCEL_FW_append_dra7xx-hs-evm = " \
+    ${@bb.utils.contains('MACHINE_FEATURES', 'mmip', 'ipumm-fw', '', d)} \
+"
+
 RDEPENDS_${PN} = "\
     packagegroup-arago-gst \
     ${MULTIMEDIA} \
-- 
1.9.1


