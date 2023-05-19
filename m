Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98F27C77B75
	for <webhook@archiver.kernel.org>; Fri, 19 May 2023 05:41:06 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.19368.1684474859902638704
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 22:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XksmGu7y;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: r-ravikumar@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34J5et0h070402;
	Fri, 19 May 2023 00:40:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684474855;
	bh=n2nYl2HSuJ5rboQ4BqKofaa1JeRnSB9vzDPK06cFIF0=;
	h=From:To:CC:Subject:Date;
	b=XksmGu7yREqnQkwxTEVP0mIl2roD07gwLKUTvbt1tenmGI0T6SoUDgYbl8Zt2Pgmw
	 JKTZ/nQTNYIrz5crSU3/nK1GINZLTtVpm5wK+WAYCR91Lt3fB0byn4XwMEcXj+aSmy
	 iJ4icazPIWMejfwMBRLKZPRM7tJ81xo86sc1A5NY=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34J5etbM069418
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 19 May 2023 00:40:55 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 19
 May 2023 00:40:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 19 May 2023 00:40:54 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34J5erHL117479;
	Fri, 19 May 2023 00:40:54 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <denis@denix.org>,
        <r-ravikumar@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH v2] meta-arago-extras: recipes-devtools: statcol: Bump SRCREV to fix rpmsg_char APIs
Date: Fri, 19 May 2023 11:10:51 +0530
Message-ID: <20230519054051.1743-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 19 May 2023 05:41:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14423

There has been some update in ti-rpmsg-char library APIs, New commits aligns
with this update

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---

Notes:
    Requires: https://lists.yoctoproject.org/g/meta-ti/message/16556

    v2:
        Removed PR:append and added PV instead

 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 5cae05d7..f729b91b 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -3,9 +3,10 @@ SUMMARY = "Statistics collector application"
 LICENSE = "TI-TSPA"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
+PV = "1.0.4+git${SRCPV}"
 PROTOCOL = "https"
 BRANCH = "master"
-SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
+SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
 SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
@@ -19,6 +20,4 @@ do_install() {
 	DESTDIR=${D} make install
 }
 
-PR:append = "_3"
-
 INSANE_SKIP:${PN} = "ldflags"
-- 
2.17.1


