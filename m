Return-Path: <karthik.ramanan@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BA7C43217
	for <webhook@archiver.kernel.org>; Fri, 22 Apr 2022 16:52:02 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.11210.1650646066270143546
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 22 Apr 2022 09:47:46 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=Owhs13nb;
 spf=pass (domain: ti.com, ip: 198.47.19.141,
 mailfrom: karthik.ramanan@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23MGljl2007753
	for <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 11:47:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650646065;
	bh=bZH84ltLNs23wkZQhPr2LaVqOEIUe/m3n3i7B0Lx/dQ=;
	h=From:To:CC:Subject:Date;
	b=Owhs13nbrsY/QYvleiT0DhD+f2VYGz3/Ea/zjXzUwsqeG/fSOaOD25184gmXzaOE5
	 Yk2nalRP95e5os6rz4+z0aWRGY4YWHQeePeGO5A/97OQr5WaSxHuiFxc0bGEdnKCvV
	 vWgajHi5t5SpEt10Cu2XmDuYRpZykNhCkhjtu2xw=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23MGljNs087628
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 11:47:45 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 22
 Apr 2022 11:47:45 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 22 Apr 2022 11:47:45 -0500
Received: from swubn05.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23MGlhXW047633;
	Fri, 22 Apr 2022 11:47:44 -0500
From: Karthik Ramanan <karthik.ramanan@ti.com>
To: <meta-arago@lists.yoctoproject.org>
CC: Karthik Ramanan <karthik.ramanan@ti.com>
Subject: [meta-arago][dunfell][PATCH] statcol: Update to latest for VTM driver
 scripts
Date: Fri, 22 Apr 2022 22:17:42 +0530
Message-ID: <20220422164742.20194-1-karthik.ramanan@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 22 Apr 2022 16:52:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13781

Signed-off-by: Karthik Ramanan <karthik.ramanan@ti.com>
---
 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index ee2b12d2..bda532eb 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
+SRCREV = "2dac74a233dd489d9bb48a50153c4a1360361b62"
 SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
@@ -19,6 +19,6 @@ do_install() {
 	DESTDIR=${D} make install
 }
 
-PR:append = "_3"
+PR:append = "_4"
 
 INSANE_SKIP:${PN} = "ldflags"
-- 
2.17.1


