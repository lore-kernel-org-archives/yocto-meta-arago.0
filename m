Return-Path: <j-keerthy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 1718D52A09
	for <meta-arago@arago-project.org>;
	Tue, 16 Feb 2021 14:56:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11GEv45W092414
	for <meta-arago@arago-project.org>; Tue, 16 Feb 2021 08:57:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613487424;
	bh=bsj+aAQbW1+E+IAeL9eT5M2g7BfIRb/oRKkA2iR+0qg=;
	h=From:To:CC:Subject:Date;
	b=rB5jewwvpbkuvDJyTLSa4y025/Gia4ion4SDE9u47vZ5Aq/j0VTsQYB25MCQY9RJc
	czWUGaBWkY1E6Tp9828QX9tstfbdy6gH6U1wdGPQEL7NOVJvz+eOhBMBV96/xubrcF
	6hee9LyWt9GqsD5YCX2Dpcw2aeQp8qZ7ejOE/82I=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11GEv3Id109715
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 16 Feb 2021 08:57:04 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Tue, 16 Feb 2021 08:57:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
	(10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Tue, 16 Feb 2021 08:57:04 -0600
Received: from a0393675ula.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11GEv1gW008846;
	Tue, 16 Feb 2021 08:57:02 -0600
From: Keerthy <j-keerthy@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 16 Feb 2021 20:26:52 +0530
Message-ID: <20210216145652.16871-1-j-keerthy@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 18 Feb 2021 16:11:17 +0000
Cc: j-keerthy@ti.com, karthik.ramanan@ti.com, Keerthy <a0393675@ti.com>
Subject: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power monitoring support
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
X-List-Received-Date: Tue, 16 Feb 2021 14:56:55 -0000
Content-Type: text/plain

From: Keerthy <a0393675@ti.com>

Add power monitoring support

Signed-off-by: Keerthy <j-keerthy@ti.com>
---
 meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
index bb841d08..12e10bcf 100644
--- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
+++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
 
 PROTOCOL = "git"
 BRANCH = "master"
-SRCREV = "6420b4e6d98dc2c6825557d7d6f56ffd52fd230c"
+SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
 SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
 
 DEPENDS = "ti-rpmsg-char websocketd"
@@ -18,3 +18,5 @@ EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${TARGET_PREFIX}"
 do_install() {
 	DESTDIR=${D} make install
 }
+
+PR_append = "_3"
-- 
2.17.1


