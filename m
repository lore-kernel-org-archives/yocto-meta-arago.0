Return-Path: <anandb@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 07887520E1
	for <meta-arago@arago-project.org>;
	Wed, 19 Jun 2019 15:35:55 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZEJk129131
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560958514;
	bh=3GJiGflgCj0cxOBLZd5BZt6mymyht5GcHSQs7lsbhPQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=JGC/PhuiQcmhqXe8WRrRM4aD88btwDSg+jgK8hmbOUeva8Ik5uDsQElsL3/pJzlKX
	C0E3Mst/3tOkKbqPOmeJyqSwull3PN3zYq7d4PukZ29FjvsYuJCQ6QTtkndR+nJWOI
	wLw3WF0s5LWFZUL2vqhzepLws5iTlHsqxo2K3vG4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5JFZEiX001183
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 19 Jun 2019 10:35:14 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 19 Jun 2019 10:35:14 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 19 Jun 2019 10:35:14 -0500
Received: from swubn03.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5JFZAZI117712; 
	Wed, 19 Jun 2019 10:35:13 -0500
From: Anand Balagopalakrishnan <anandb@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 19 Jun 2019 21:05:06 +0530
Message-ID: <1560958508-141402-3-git-send-email-anandb@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1560958508-141402-1-git-send-email-anandb@ti.com>
References: <1560958508-141402-1-git-send-email-anandb@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [[thud] PATCH] img-pvr-sdk: set right dependencies for J7
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
X-List-Received-Date: Wed, 19 Jun 2019 15:35:56 -0000
Content-Type: text/plain

Signed-off-by: Anand Balagopalakrishnan <anandb@ti.com>
---
 meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
index aa24fa7..9e18909 100644
--- a/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
+++ b/meta-arago-extras/recipes-graphics/img-pvr-sdk/img-pvr-sdk_3.3.2.bb
@@ -9,7 +9,7 @@ BRANCH = "master"
 SRC_URI = "git://git.ti.com/graphics/img-pvr-sdk.git;protocol=git;branch=${BRANCH}"
 SRCREV = "7af5846a0989a1475548ca05f6984c817fb76adc"
 
-PR = "r14"
+PR = "r15"
 
 COMPATIBLE_MACHINE = "omap-a15|ti43x|ti33x|k3"
 
@@ -44,6 +44,7 @@ do_install () {
 }
 
 RDEPENDS_${PN} = "ti-sgx-ddk-um"
+RDEPENDS_${PN}_j7-evm = "ti-img-rogue-umlibs"
 
 INHIBIT_PACKAGE_STRIP = "1"
 
-- 
1.9.1


