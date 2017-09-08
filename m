Return-Path: <manishalocal@uda0393239>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 6DF66520C0
	for <meta-arago@arago-project.org>;
	Fri,  8 Sep 2017 21:49:54 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v88LnsWO032272
	for <meta-arago@arago-project.org>; Fri, 8 Sep 2017 16:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504907394;
	bh=55X3AfqRYwplU7T5nPWigINv550BqqbJ6a1IsmrlBbs=;
	h=From:To:CC:Subject:Date;
	b=kBFf58vTdTsR0i7OpdOKkPXq7kbGGhzdzDIl4dsIuOshSdPCsvgCep595TKH6MJPI
	kVgrgedPMSvOgAfnB4orT2D3HNC6zYEifnG13l3XCVZp2nzRhPvBaB+Xv16K0ar3mo
	El2GmLyLrDFnrUTxM87EhW7wzq1/sL2o5bhG5Crk=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v88LnsQL016924
	for <meta-arago@arago-project.org>; Fri, 8 Sep 2017 16:49:54 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 8 Sep 2017 16:49:54 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 8 Sep 2017 16:49:54 -0500
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v88LnsQb009748;
	Fri, 8 Sep 2017 16:49:54 -0500
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1dqR9t-0007lU-Tl; Fri, 08 Sep 2017 16:49:53 -0500
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 8 Sep 2017 16:49:51 -0500
Message-ID: <20170908214951.29812-1-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v1] evse-hmi : SRCREV update
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
X-List-Received-Date: Fri, 08 Sep 2017 21:49:54 -0000
Content-Type: text/plain

Application fix for screen index. Set the index to 0 to always render
Welcome screen first.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 recipes-apps/evse-hmi/evse-hmi_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
index 1bb66f5..114ba29 100755
--- a/recipes-apps/evse-hmi/evse-hmi_git.bb
+++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
@@ -10,7 +10,7 @@ PR = "r0"
 BRANCH = "master"
 SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
 
-SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
+SRCREV = "ce093e76faddce78dbaa3e22af6d252f57d5f700"
 
 S = "${WORKDIR}/git"
 
-- 
2.13.0


