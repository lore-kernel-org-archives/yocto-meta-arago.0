Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E909C282EC
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 18:34:05 +0000 (UTC)
Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
 by mx.groups.io with SMTP id smtpd.web10.2806.1742322841000166042
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 18 Mar 2025 11:34:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=iun5P1/U;
 spf=pass (domain: ti.com, ip: 198.47.23.235, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 52IIXxwB109535
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 18 Mar 2025 13:33:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1742322839;
	bh=9OY96QNm01HlVfV01Grx94io7DYnK8Ybbz54k3Aw4RQ=;
	h=From:To:Subject:Date;
	b=iun5P1/UEdyiEevtXHgCWWE8vd9206qSHzwMl4KXnWuECwEIGJPBMvamXCgS5ySDx
	 xLJT8fWUbdOmTVzxvMKm2qInMouJNp2tCvYPnejDdwBJTV0xoIqB3T/NH6bTLlItaj
	 ZrVZ3MkRf6vrbvOFPufx41V8SN/j+Nfk2drd9Wmg=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IIXxSG027645;
	Tue, 18 Mar 2025 13:33:59 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 18
 Mar 2025 13:33:59 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 18 Mar 2025 13:33:59 -0500
Received: from uda0214219 (uda0214219.dhcp.ti.com [128.247.81.222])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 52IIXxUb126748;
	Tue, 18 Mar 2025 13:33:59 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1tublH-00067s-7M; Tue, 18 Mar 2025 13:33:59 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][scarthgap][PATCH] nw-configurator: Do not inherit autotools
Date: Tue, 18 Mar 2025 13:33:59 -0500
Message-ID: <20250318183359.23509-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 18 Mar 2025 18:34:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16087

This recipe does not use autotools at all and it is now an error to
inherit autotools and not have a configure script. [1]

[1] https://git.openembedded.org/openembedded-core/commit/?id=6d327a39befae44a88a812bdf4acde800dcee57b

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
index 7769334a..abc3fdd9 100644
--- a/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
+++ b/meta-arago-extras/recipes-extended/sysrepo/nw-configurator.bb
@@ -9,7 +9,7 @@ S = "${WORKDIR}"
 
 DEPENDS = "sysrepo"
 
-inherit autotools pkgconfig
+inherit pkgconfig
 
 do_compile() {
 	${CC} ${CFLAGS} ${LDFLAGS} -I=${STAGING_INCDIR}	${WORKDIR}/nw-configurator.c -o nw-configurator -lsysrepo
-- 
2.17.1


