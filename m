Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B8E2C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 20:02:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.2290.1651003375224493424
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 13:02:55 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=cIKvf9TG;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2saE007869;
	Tue, 26 Apr 2022 15:02:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651003374;
	bh=krBCIARbSRAgBHKvg/5RFpwWdYGRA37CILIGJ46M23o=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=cIKvf9TGkcDCRYw6sndB92Z2dHxqk2ANd4eSSqd8YTSVvLklOqvsnk/PWvJxssaBd
	 zl8L1Bf/HqUNFMaBDDSIa7ylxgxUcUZpAaRUTF+ZbzyvIQ8WhDtxeZVpFHItlXwnTX
	 0VUyCtZyOquzd2dL+rZUKGqAwUmyN7DEy6QRYpnI=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QK2sqf048172
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 15:02:54 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 15:02:53 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 15:02:53 -0500
Received: from ula0226330.dal.design.ti.com (ileax41-snat.itg.ti.com
 [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QK2pgb099348;
	Tue, 26 Apr 2022 15:02:53 -0500
From: Andrew Davis <afd@ti.com>
To: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
CC: Andrew Davis <afd@ti.com>
Subject: [meta-arago][oe-layersetup PATCH 5/6] Build Poky in a directory named
 poky-tmp vs arago-tmp
Date: Tue, 26 Apr 2022 15:02:50 -0500
Message-ID: <20220426200251.19417-5-afd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220426200251.19417-1-afd@ti.com>
References: <20220426200251.19417-1-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 20:02:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13795

This also allows us to keep version of both should we need.

Signed-off-by: Andrew Davis <afd@ti.com>
---
 sample-files/local-poky-v2.conf.sample | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sample-files/local-poky-v2.conf.sample b/sample-files/local-poky-v2.conf.sample
index a958055..4bd0563 100644
--- a/sample-files/local-poky-v2.conf.sample
+++ b/sample-files/local-poky-v2.conf.sample
@@ -48,7 +48,7 @@ SSTATE_DIR = "${OEBASE}/build/sstate-cache"
 # where BitBake should place its temporary files and output. Keep in mind that
 # this includes the extraction and compilation of many applications and the toolchain
 # which can use Gigabytes of hard disk space.
-TMPDIR = "${OEBASE}/build/arago-tmp"
+TMPDIR = "${OEBASE}/build/poky-tmp"
 
 #
 # Machine Selection
-- 
2.17.1


