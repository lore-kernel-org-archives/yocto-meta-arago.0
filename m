Return-Path: <xuj@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E65BC5298C
	for <meta-arago@arago-project.org>;
	Fri,  9 Aug 2019 19:41:49 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x79JerEf053603
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2019 14:40:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1565379653;
	bh=ih2YlQiz6ewW09g2e/oxJUqChfnpmliO3CPqhzcuyuU=;
	h=From:To:CC:Subject:Date;
	b=mXbRPB+4oQyyT3HvZWldw1B/0VRNSe4eZ7OCq8AwAwUOicu29n3tooo8fczl833NH
	IKzNUNaRfDFUnzYIH/xZJlyEsmCoO6LEWtIYH/HhwhgGJXUD0yFIYW/Iozh1jq13/g
	8lIXXBfpHd/88QoeuHz6ueuGtdf5wDCCCsok8Iro=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x79JerF6007376
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 9 Aug 2019 14:40:53 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE113.ent.ti.com
	(10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 9 Aug 2019 14:40:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 9 Aug 2019 14:40:53 -0500
Received: from UDA0869574A.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x79JerY4121574;
	Fri, 9 Aug 2019 14:40:53 -0500
From: Jianzhong Xu <xuj@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Aug 2019 15:40:48 -0400
Message-ID: <20190809194048.63206-1-xuj@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [thud/master] [PATCH] tidl-utils: bump SRCREV
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
X-List-Received-Date: Fri, 09 Aug 2019 19:41:50 -0000
Content-Type: text/plain

* tidl import tool fixes for non-square padding and Caffe data layer format

Signed-off-by: Jianzhong Xu <xuj@ti.com>
---
 meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
index 2c29fc27..6fdeec48 100644
--- a/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
+++ b/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.inc
@@ -1,6 +1,6 @@
 SRC_URI = "git://git.ti.com/tidl/tidl-utils.git;protocol=git;branch=master"
-SRCREV = "0c52c82a2aed1a27ca2a9b4b11effb426842b6ab"
+SRCREV = "b2466e02f99d85d8afcbc93edc612da5cc9345de"
 
-PV = "01.01.01.00"
+PV = "01.01.02.00"
 PR = "r0"
 
-- 
2.17.1


