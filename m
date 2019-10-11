Return-Path: <sjha@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 8F1E052986
	for <meta-arago@arago-project.org>;
	Fri, 11 Oct 2019 18:51:03 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9BInnjS111190
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2019 13:49:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570819789;
	bh=jJkAkzJqryTpZSCTCwPgB1i/XFYtSSvIrdr08JNdjFY=;
	h=From:To:CC:Subject:Date;
	b=R/yMthnoYQ2FKRgeJdl2XtYHHvxIwngYdCTpOMOJt9FfqOZ9GzPYWf40sW/EIJLue
	/K3ssBpAIhOKC+bBTNWxNfR9r1byyegZ66AGnHxK2X5wtAesmrClcUevCXf2qq7Ap4
	jMwsKbv90AzBCih+2zuLSlT3x07A70hoSqBZbyY0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9BInnLA008385
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 11 Oct 2019 13:49:49 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 11 Oct 2019 13:49:44 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 11 Oct 2019 13:49:48 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9BInmW5082767;
	Fri, 11 Oct 2019 13:49:48 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 11 Oct 2019 13:49:56 -0500
Message-ID: <20191011184956.9150-1-sjha@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Fri, 11 Oct 2019 18:51:05 -0000
Content-Type: text/plain

Replacing ipc-lld-fw with ipc-lld-examples-rtos to
build from source.

Signed-off-by: Santosh Jha <sjha@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Signed-off-by: Santosh Jha <sjha@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 14b2370c..af8d6bbf 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -77,8 +77,8 @@ UTILS_append_k3 = " mmc-utils \
                     jailhouse \
 "
 
-UTILS_append_am65xx = " ipc-lld-fw ti-ipc-rtos-fw pru-icss pru-pwm-fw"
-UTILS_append_j7-evm = " ipc-lld-fw pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
+UTILS_append_am65xx = " ipc-lld-examples-rtos ti-ipc-rtos-fw pru-icss pru-pwm-fw"
+UTILS_append_j7-evm = " ipc-lld-examples-rtos pru-icss ti-display-sharing-fw cpsw9g-eth-fw"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.17.1


