Return-Path: <sam.nelson@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id EB8FF52985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 17:35:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85HZH18088356
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 12:35:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536168917;
	bh=IZAP+NhgUbrJ7ERoUjLlpEL+L4JswG6lPQgREYi5vag=;
	h=From:To:CC:Subject:Date;
	b=fdBvwm9J8Ihxop/Z0ONhEM9zSIx+IodEFNXtUcvP0LiCpzT/vejGgdJJyfWqVoAAe
	6aJ6mXrgu5y04EnaVY1PYRvomKmPRR1zQQdhmivyK5vPJdtlWCRyirJpRF80tt91g4
	3jY3sc3yxJZPm/HQUMqlLd/PncRSjgjIAeQvraS4=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85HZH5U027247
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 12:35:17 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 12:35:17 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 5 Sep 2018 12:35:17 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85HZG2U016810;
	Wed, 5 Sep 2018 12:35:17 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>, <s-anna@ti.com>
Date: Wed, 5 Sep 2018 13:35:15 -0400
Message-ID: <1536168915-10192-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] packagegroup-tisdk-addons: Add firmware images for am65xx-evm
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
X-List-Received-Date: Wed, 05 Sep 2018 17:35:27 -0000
Content-Type: text/plain

Provides ipc test images for r5f cores

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb       | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5b97d77..d905402 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -102,6 +102,8 @@ UTILS_append_k2g = " \
     uio-test-pruss \
 "
 
+UTILS_append_am65xx-evm = " ti-ipc-rtos-fw"
+
 EXTRA_LIBS = ""
 EXTRA_LIBS_append_omap-a15 = " \
     cmem \
-- 
1.9.1


