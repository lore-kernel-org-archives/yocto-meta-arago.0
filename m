Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id BE0B4529E2
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 18:32:17 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71IVNDD112692
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 13:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564684283;
	bh=4FsUKEPtp+fgyVpoYzZYGKqULaaxF/GpGEKSgWe4AMs=;
	h=From:To:CC:Subject:Date;
	b=Bnm2nDY955ZXfgbn+INR+G6PvXk70vWwPggXl6uaQDhNZEOMpkKaUTHyUdBfEACXO
	hcNLgfDFDPEsaQ2/EZV1u38jafL1ye3sd8Mqs9qJ00+n5qc0hAqJGI4Bu+W9JshUxH
	R2A7M5RPCUKUys94goIxtzHj78RpP1qW9NYG1K7k=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71IVN8v045241
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 13:31:23 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 1 Aug 2019 13:31:23 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 1 Aug 2019 13:31:23 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71IVMIa106295;
	Thu, 1 Aug 2019 13:31:23 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Aug 2019 14:14:41 -0400
Message-ID: <1564683281-22803-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH v2] packagegroup-arago-console: add avahi-utils
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
X-List-Received-Date: Thu, 01 Aug 2019 18:32:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
v2 changes:
* add avahi-utils to console packagegroup instead of base packagegroup.

 .../recipes-core/packagegroups/packagegroup-arago-console.bb             | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 92d16f0..9fe17b9 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -53,6 +53,7 @@ ARAGO_UTILS = "\
     i2c-tools \
     strace \
     ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'avahi-utils', '',d)} \
     "
 
 # ARAGO_UTILS - ltrace fails with __cxa_demangle for now
-- 
2.7.4


