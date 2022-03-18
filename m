Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 523D4C433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Mar 2022 14:37:43 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web09.10532.1647614262380150070
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 18 Mar 2022 07:37:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=lBVEsmx4;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: nm@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbQJ047991;
	Fri, 18 Mar 2022 09:37:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1647614257;
	bh=5XD3EghLx/n2/bfAMua5wfcxi9kkXo/nq8xRXiZrpeY=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=lBVEsmx44WXOhtMEFW9bnxPaVzgP1GLcvSSymeEC/PyQY1fz5azI1g9H641uMcw+m
	 uABgVng+3EDqSDMrmOtedqBU0KtBwF1H6WAipt9OUGA+DfwF7+mC3WOPOXIU5IXACT
	 hdEVZcYKE3bgCflgNOd+d8/qP8SSiucw1Me6ikZ8=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22IEbbKH082458
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 18 Mar 2022 09:37:37 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 18
 Mar 2022 09:37:37 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 18 Mar 2022 09:37:37 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22IEbbtL094328;
	Fri, 18 Mar 2022 09:37:37 -0500
From: Nishanth Menon <nm@ti.com>
To: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>
CC: Dave Gerlach <d-gerlach@ti.com>,
        "Humphreys, Jonathan"
	<j-humphreys@ti.com>,
        praneeth <praneeth@ti.com>, minas <minas@ti.com>,
        "Hilman, Kevin" <khilman@ti.com>, "Patton, Schuyler" <spatton@ti.com>,
        "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
        <meta-arago@lists.yoctoproject.org>, Nishanth Menon <nm@ti.com>
Subject: [dunfell/master PATCH V2 04/12] tisdk-base-image: Reformat
 documentation and clarify usage
Date: Fri, 18 Mar 2022 09:37:27 -0500
Message-ID: <20220318143735.17642-5-nm@ti.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220318143735.17642-1-nm@ti.com>
References: <20220318143735.17642-1-nm@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 18 Mar 2022 14:37:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13647

Reformat the documentation to indicate the first line as summary for
the image and the detailed description follows it with EoL separating
the two.

Signed-off-by: Nishanth Menon <nm@ti.com>
---
Changes since v1:
* New patch

V1: did'nt exist.

 meta-arago-distro/recipes-core/images/tisdk-base-image.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
index 76668831354f..dfb8eaefe7da 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-base-image.bb
@@ -1,5 +1,7 @@
 # Arago TI SDK base image with test tools
-# Suitable for initramfs
+#
+# Arago SDK base image suitable for initramfs containing comprehensive
+# test tools.
 
 require arago-image.inc
 
-- 
2.31.1


