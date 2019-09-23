Return-Path: <sjha@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 6B3D9520E4
	for <meta-arago@arago-project.org>;
	Mon, 23 Sep 2019 18:16:36 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8NIFR5W006825
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 13:15:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569262527;
	bh=hPF2i16zU0RymsXm9gIkwDebEBMagQZhO+UPcOevdJ4=;
	h=From:To:CC:Subject:Date;
	b=vdupgH49eGu9eLiYkHWYDH/zLEe6Rb6TzkjtscN4+9oUzljmeWuuVI8HruWLKQ1ii
	sb0Bfpj8VGdqxH5xIEivxN9PDSJS/hCQN+r8lHGpYQyaLiS19Lwp+FwB12J0XYnLM6
	3whV4/DbgzwlplDPn467AsaT/OySVHk3JzUM1MK0=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NIFRc5045537
	for <meta-arago@arago-project.org>; Mon, 23 Sep 2019 13:15:27 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Mon, 23 Sep 2019 13:15:21 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Mon, 23 Sep 2019 13:15:20 -0500
Received: from uda0132919.dal.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8NIFQQN061803;
	Mon, 23 Sep 2019 13:15:26 -0500
From: Santosh Jha <sjha@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 23 Sep 2019 13:15:00 -0500
Message-ID: <20190923181500.15715-1-sjha@ti.com>
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
X-List-Received-Date: Mon, 23 Sep 2019 18:16:37 -0000
Content-Type: text/plain

Replacing ipc-lld-fw with ipc-lld-examples-rtos to
build from source.

Signed-off-by: Santosh Jha <sjha@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 21aa7244..ef617793 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -75,8 +75,8 @@ UTILS_append_k3 = " mmc-utils \
                     irqbalance \
 "
 
-UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss"
-UTILS_append_j7-evm = " ipc-lld-fw ti-display-sharing-fw jailhouse"
+UTILS_append_am65xx = " ti-ipc-rtos-fw pru-icss ipc-lld-examples-rtos"
+UTILS_append_j7-evm = " ipc-lld-examples-rtos ti-display-sharing-fw jailhouse"
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
 
-- 
2.17.1


