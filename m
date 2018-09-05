Return-Path: <sam.nelson@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id C961B52985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 18:42:10 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85Ig2Mx104130
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:42:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536172922;
	bh=CuqhKtBQ6ZAuZq6koOX7LgAsh7YvAIrc4uf7uFJWrhM=;
	h=From:To:CC:Subject:Date;
	b=noiFyVDQUKb+z3Y3gz3ATIsicdY7lponnryYeMoEeVjXdpXkcj9L115eqHPjAb5J+
	TvaqHxuenHidI2hGqpwjqCBwTGk+u6Zbz4qBif8T6+Lrm2trHa7j3WXbg/Lj7GhdMo
	bLY4w18yXdyOlXtE1dOf9nrLs6MC49+9IJ8kw5UA=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85Ig2oP008274
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 13:42:02 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE110.ent.ti.com
	(157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 13:42:01 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 5 Sep 2018 13:42:02 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85Ig17r022320;
	Wed, 5 Sep 2018 13:42:01 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Sep 2018 14:41:59 -0400
Message-ID: <1536172919-51224-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH v2] packagegroup-arago-tisdk-addons: Add firmware images for k3
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
X-List-Received-Date: Wed, 05 Sep 2018 18:42:11 -0000
Content-Type: text/plain

Provides ipc test images for r5f cores

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Change from previous version of patch
Updated title
Update from am65xx to k3
---
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 5b97d77..bfacbef 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -66,6 +66,7 @@ UTILS_append_omap-a15 = " mmc-utils \
 UTILS_append_k3 = " mmc-utils \
                     parted \
                     pru-icss \
+                    ti-ipc-rtos-fw \
 "
 
 UTILS_append_omapl138 = " ti-ipc-rtos-fw"
-- 
1.9.1


