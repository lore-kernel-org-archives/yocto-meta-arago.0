Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29AC5C0015E
	for <webhook@archiver.kernel.org>; Sat, 12 Aug 2023 13:17:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web11.64777.1691846216494104695
 for <meta-arago@lists.yoctoproject.org>;
 Sat, 12 Aug 2023 06:16:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=xcY0LqIP;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37CDGt8q006768;
	Sat, 12 Aug 2023 08:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1691846215;
	bh=XJS2VfaEWPbU+vYootp18X50AyNHiT2jg6yO2q5b1J8=;
	h=From:To:Subject:Date;
	b=xcY0LqIPOp1BMHr26fLtJWElpKPged0hP7oRhFjm66+fnbBRUzQVclfITeTglkICN
	 z9NnIgCA7fEG+PMf23wNGZTgcD5SfE/Jmq+dnaZR9mh7LkPJduacnZeeWBNN82IMru
	 OY+cz8Z8lmYScWnp2RKwMtzFIfHg/al5eNO96ngM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37CDGtRA005800
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 12 Aug 2023 08:16:55 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 12
 Aug 2023 08:16:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 12 Aug 2023 08:16:54 -0500
Received: from uda0214219 (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37CDGsxg076765;
	Sat, 12 Aug 2023 08:16:54 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1qUoUA-0006hK-Ni; Sat, 12 Aug 2023 08:16:54 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][master/kirkstone][PATCH] mstpd: Add FILES variable
Date: Sat, 12 Aug 2023 08:16:54 -0500
Message-ID: <20230812131654.25185-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Sat, 12 Aug 2023 13:17:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14836

Bring this recipe into compliance with the latest standards.  Add
missing FILES and update hardcoded /sbin path to $base_sbindir.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
index a410f584..be75b1c5 100644
--- a/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
+++ b/meta-arago-extras/recipes-support/mstpctl/mstpd_git.bb
@@ -17,7 +17,15 @@ RDEPENDS:${PN} = "python3-core"
 
 inherit autotools
 
-EXTRA_OECONF = "--sbindir=/sbin"
+EXTRA_OECONF = "--sbindir=${base_sbindir}"
+
+FILES:${PN} += " \
+    ${base_sbindir}/mstp* \
+    ${base_sbindir}/bridge-stp \
+    ${libexecdir}/mstpctl-utils/* \
+    ${sysconfdir}/bridge-stp.conf \
+    ${sysconfdir}/bash_completion.d/mstpctl \
+"
 
 do_configure:prepend() {
 	 sed -i -e "s,#!.*python.*,#!${USRBINPATH}/env python3," ${S}/utils/ifquery
-- 
2.17.1


