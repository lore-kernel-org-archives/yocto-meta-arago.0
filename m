Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 1570152999
	for <meta-arago@arago-project.org>;
	Wed, 17 Jul 2019 14:31:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEUXQW071336
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2019 09:30:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1563373833;
	bh=uCi6cC2MxTIdbIeC6pHeu1l6FOb2mEtXes1CuQt+1Ug=;
	h=From:To:CC:Subject:Date;
	b=dRGYinl8UpF4qyYO3W+iX+lCDcsotoRxK7l1DR0fU4VSjjMFp28m+PLDdEj20K89/
	M3Y3PjDG6yMVgUa67vSLkpBhfzTJrB32/t7Nm+/BJEIuqp3C1YqJr2rYrEQYAfNdWg
	PbZ3wnXHIK9VoILn7AJ9JT4WoxdPabvTzDmQAJN8=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEUXVi005545
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 17 Jul 2019 09:30:33 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 17 Jul 2019 09:30:33 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 17 Jul 2019 09:30:33 -0500
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEUXPJ102013;
	Wed, 17 Jul 2019 09:30:33 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 17 Jul 2019 10:13:53 -0400
Message-ID: <1563372833-24288-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/thud][PATCH] ti-sci-fw: update am65xx-hs checksums for 2019.06a
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
X-List-Received-Date: Wed, 17 Jul 2019 14:31:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
index 09784bd..e7aa15f 100644
--- a/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
+++ b/meta-arago-distro/recipes-bsp/ti-sci-fw/ti-sci-fw_2019.06a.bb
@@ -30,10 +30,10 @@ SRC_URI_append_am65xx-hs-evm = " \
 	http://install.source.dir.local/ti-sci-firmware-am65x-hs-enc.bin;name=hs-enc \
 "
 
-SRC_URI[hs-cert.md5sum] = "9c4de5577d92c83a467dad36ef04691b"
-SRC_URI[hs-cert.sha256sum] = "262d4e4edc8eca996caaeefeb3d5daffe11d45d9499c6f71ad1a6a2fcf68aa97"
-SRC_URI[hs-enc.md5sum] = "c851061ec96db61b601ad3685b1ecd23"
-SRC_URI[hs-enc.sha256sum] = "73a17fd6ee2770d12ba328dd64009572b9ab0fbd4989111b34a7d67c5dfd2ca8"
+SRC_URI[hs-cert.md5sum] = "29eeb2ef5088626c2add8a25f8b9a420"
+SRC_URI[hs-cert.sha256sum] = "c7185e4d95f8bd57e985d1c53c814e65bed078669e2270152e406e8d2a04a186"
+SRC_URI[hs-enc.md5sum] = "e465a2328e042dd932b98d78d8f531de"
+SRC_URI[hs-enc.sha256sum] = "6ecc456f2800a8937c6109c91bc4c62432c2aabad73ad6f3486a6457e22b087a"
 
 S = "${WORKDIR}/git"
 
-- 
2.7.4


