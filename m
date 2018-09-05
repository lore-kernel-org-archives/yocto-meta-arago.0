Return-Path: <sam.nelson@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id D6DA252985
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2018 20:59:18 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w85KxABE004176
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 15:59:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536181150;
	bh=IVOKxicjmNQvo2cxoZDCacnYNfGw4e15o8y3DHU2T8U=;
	h=From:To:CC:Subject:Date;
	b=fgnQzvCImtxuKrq34g0dJrca1KfHildEwRnTzyO2Edz1lFgH2nACPf+pEuNoPBYmO
	1Kz17KC557fHJ3KOo7xaQTjU1YFZ4c+NFmQPEzIAvC7+ysER5S57ijN+YFrntLVNq8
	N51ZPm09/fNzip5QNExoxXzljtuTkm/w9NUO2w+w=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85KxAkO032257
	for <meta-arago@arago-project.org>; Wed, 5 Sep 2018 15:59:10 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 5 Sep 2018 15:59:10 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 5 Sep 2018 15:59:10 -0500
Received: from uda0862859a.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w85KxAMs002291;
	Wed, 5 Sep 2018 15:59:10 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 5 Sep 2018 16:59:09 -0400
Message-ID: <1536181149-49730-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [rocko][PATCH] packagegroup-arago-tisdk-addons: Add ti-ipc-examples-linux
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
X-List-Received-Date: Wed, 05 Sep 2018 20:59:19 -0000
Content-Type: text/plain

Provides ipc example binaries

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index bfacbef..289136b 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -151,6 +151,7 @@ EXTRA_PACKAGES_append_omap-a15 = " voxelsdk \
 EXTRA_PACKAGES_append_omap-a15 = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_keystone = " ti-ipc-examples-linux"
 EXTRA_PACKAGES_append_omapl138 = " ti-ipc-examples-linux"
+EXTRA_PACKAGES_append_k3 = " ti-ipc-examples-linux"
 
 EXTRA_PACKAGES_append_am335x-evm = " pruss-lld-apps"
 EXTRA_PACKAGES_append_am437x-evm = " pruss-lld-apps"
-- 
1.9.1


