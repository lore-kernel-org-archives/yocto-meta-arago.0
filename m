Return-Path: <vigneshr@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 48AD4529C6
	for <meta-arago@arago-project.org>;
	Thu, 12 Nov 2020 14:42:29 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0ACEdIib081432
	for <meta-arago@arago-project.org>; Thu, 12 Nov 2020 08:39:18 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1605191958;
	bh=MvlhYtw4PEtWPaFKEgEkV2N4k3npLP/PKfWEbLArp9o=;
	h=From:To:CC:Subject:Date;
	b=mVnmEDEQt0cDAvAWMhgG9m2Xq2n0+XBAfHaCUE6q8jfL64NSJQRJk5TP24cSzdjjD
	r5i814DXWbDYIRxAABxXlO7K0Svyg5AaRsUw4PaKwCjSxz/S/R+kcShIR0BHdqRDQh
	dnX7IElBhsjDJuxZjh03tpfWjEiN56GivNfnQy0w=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0ACEdIGM096803
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Nov 2020 08:39:18 -0600
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 12 Nov 2020 08:39:17 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 12 Nov 2020 08:39:18 -0600
Received: from ula0132425.ent.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0ACEdFBI070037;
	Thu, 12 Nov 2020 08:39:16 -0600
From: Vignesh Raghavendra <vigneshr@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 12 Nov 2020 20:09:11 +0530
Message-ID: <20201112143911.8695-1-vigneshr@ti.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH] packagegroup-*-connectivity: include devlink from iproute2
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
X-List-Received-Date: Thu, 12 Nov 2020 14:42:29 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

devlink tool is used for configuration of CPSW switch parameters on AM57xx
and K3 platforms. So, include the same as part of SDK.

Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index 3b848efc..11109432 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -58,6 +58,7 @@ CONNECTIVITY_RDEPENDS = " \
     iptables \
     iproute2 \
     iproute2-tc \
+    iproute2-devlink \
     net-snmp \
     net-snmp-server-snmpd \
 "
-- 
2.29.2


