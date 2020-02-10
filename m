Return-Path: <angelabaker@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 065A95298B
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2020 16:27:36 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 01AGPfu1045141
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 10:25:41 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581351941;
	bh=ZIQdYHa5AWin1Ke7+HNGXQb+Zf9FB2VNmUyCEa4nBgY=;
	h=From:To:CC:Subject:Date;
	b=QNe1fS8gmfVejbyS7rDTePY3jEhQUqEanoWh47jPTbizvine0XzdMowF4bD5gmafH
	Z3bUqTj8itWtqAy5m2XKatDZzLZ7yp623kJsFqKtab7vxFWrteum4BlTvWsV59QS4l
	fKzkf3YqX2hDt4npTggzGXW4qI4tl3wwAFvV5QUQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 01AGPfln038897
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2020 10:25:41 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Mon, 10 Feb 2020 10:25:40 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Mon, 10 Feb 2020 10:25:40 -0600
Received: from legion.dal.design.ti.com (legion.dal.design.ti.com
	[128.247.22.53])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 01AGPe9Q011112;
	Mon, 10 Feb 2020 10:25:40 -0600
Received: from uda0866189.dhcp.ti.com (uda0866189.dhcp.ti.com [128.247.77.48])
	by legion.dal.design.ti.com (8.11.7p1+Sun/8.11.7) with ESMTP id
	01AGPe321370; Mon, 10 Feb 2020 10:25:40 -0600 (CST)
From: Angela Stegmaier <angelabaker@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Feb 2020 10:25:18 -0600
Message-ID: <1581351918-32354-1-git-send-email-angelabaker@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [zeus/master][PATCH] packagegroup-arago-tisdk-addons: replacing ipc-lld-fw
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
X-List-Received-Date: Mon, 10 Feb 2020 16:27:37 -0000
Content-Type: text/plain

From: Santosh Jha <sjha@ti.com>

Replacing ipc-lld-fw with ipc-lld-examples-rtos to
build from source.

Signed-off-by: Santosh Jha <sjha@ti.com>
Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb     | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index a1b55ee..1612322 100644
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
1.9.1


