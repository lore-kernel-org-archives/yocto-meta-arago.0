Return-Path: <r-ravikumar@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39EE8C77B7D
	for <webhook@archiver.kernel.org>; Thu, 18 May 2023 13:20:57 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.17151.1684416048660027835
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 18 May 2023 06:20:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=MtopYvqE;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: r-ravikumar@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34IDKlTr014680
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 08:20:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1684416047;
	bh=hMU4XCvzzZHr4VjkLwe7C3bBkkUFZTotw1sid/UNiSE=;
	h=From:To:CC:Subject:Date;
	b=MtopYvqEExdIxxM3HVgtv3z1cmKzcGALDPERgIp3jE7mga+kNXLx6Xt1Ne5clHllb
	 DkpW/uTIs3PD6BeFryrTZ10ozStDpQ9Y9bWP/C316zSmYJxPZZQzq+t6xyIm2r7/YX
	 6r8aNNqpSb5Mo7zXMhmyIITC17l9vlWJ0rw9qxow=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34IDKl02055520
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 08:20:47 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 18
 May 2023 08:20:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 18 May 2023 08:20:47 -0500
Received: from localhost (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34IDKkFk001385;
	Thu, 18 May 2023 08:20:47 -0500
From: Rahul T R <r-ravikumar@ti.com>
To: <meta-arago@lists.yoctoproject.org>, Ryan Eatmon <reatmon@ti.com>
CC: <vigneshr@ti.com>, <praneeth@ti.com>, <r-ravikumar@ti.com>
Subject: [meta-arago][master/kirkstone][PATCH] meta-arago-extras: recipes-devtools: statcol: Bump SRCREV to fix rpmsg_char APIs
Date: Thu, 18 May 2023 18:50:44 +0530
Message-ID: <20230518132044.17273-1-r-ravikumar@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 18 May 2023 13:20:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14417

There has been some update in ti-rpmsg-char library APIs, New commits aligns
with this update

Signed-off-by: Rahul T R <r-ravikumar@ti.com>
---
 Requires: https://lists.yoctoproject.org/g/meta-ti/message/16556

 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index 5cae05d7..2968ac83 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
 PROTOCOL = "https"
 BRANCH = "master"
-SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
+SRCREV = "279bf455bc3dec69f374d46a8225687935f4323a"
 SRC_URI = "git://git.ti.com/git/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
@@ -19,6 +19,6 @@ do_install() {
 	DESTDIR=${D} make install
 }
 
-PR:append = "_3"
+PR:append = "_4"
 
 INSANE_SKIP:${PN} = "ldflags"
-- 
2.17.1


