Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 1EBC952990
	for <meta-arago@arago-project.org>;
	Wed, 20 Sep 2017 15:32:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8KFWa3I025045
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:32:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1505921556;
	bh=vU/U6NX6gFaX24Eni3BU2fNUEjf2yyLrZ5CuvlcIoTs=;
	h=From:To:CC:Subject:Date;
	b=eQn+tliYcgbC4MrvvE2ZdxNEhaABOsN4NJ4qBKGid3lIwBwD+pgj1oSWXeG2081Wi
	S3QcLKZvqdOPYKjO/HLPy6H+ZUwg8Uq1Wl/BSudo8+EaeU5iIcSM09HAs9o70ZrzXV
	Z7VPvnrULbbP6zzL5WOT0f1tlB+FKQ8Pfel25v9Y=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFWVsN027277
	for <meta-arago@arago-project.org>; Wed, 20 Sep 2017 10:32:31 -0500
Received: from DLEE105.ent.ti.com (157.170.170.35) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Wed, 20 Sep 2017 10:32:31 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE105.ent.ti.com
	(157.170.170.35) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Wed, 20 Sep 2017 10:32:31 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8KFWVYf015193;
	Wed, 20 Sep 2017 10:32:31 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 20 Sep 2017 11:32:23 -0400
Message-ID: <1505921543-25981-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH 1/2 v3] uio-test-pruss: add support for k2g
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
X-List-Received-Date: Wed, 20 Sep 2017 15:32:47 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
v3 change: extend DEVICE_NAME to the k2g family

 recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
index 7297c8b..f611b0b 100644
--- a/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
+++ b/recipes-ti/uio-test-pruss/uio-test-pruss_git.bbappend
@@ -1,6 +1,10 @@
-PR_append = ".tisdk0"
+PR_append = ".tisdk1"
 
 PV = "1.0.2.0"
 
 # Corresponds to version 01.00.02.00
 UIO_TEST_PRUSS_SRCREV = "e52a7b099d7203ca52519650df51419e9fef7e0c"
+
+COMPATIBLE_MACHINE = "ti33x|ti43x|omap-a15|k2g"
+
+DEVICE_NAME_append_k2g = "k2g"
-- 
1.9.1


