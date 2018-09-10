Return-Path: <h-gou@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 3CD6852985
	for <meta-arago@arago-project.org>;
	Mon, 10 Sep 2018 18:19:36 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8AIJRjV096655
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 13:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536603568;
	bh=78vqQMrXsFblqeQddwrZC3wt38O3j2za6B0FDB9Q56k=;
	h=From:To:CC:Subject:Date;
	b=OPmOnINU2ZlBy00C3z2d7t7jA5QJ726roKOeWPEdd59lJ4ednTiST0mV7LmIhBdwe
	vhEtXKWlHCh37Hgsbuk+djYkmhgO1x+DE6IAjyXSQtZz/DU75Xr2FcbWJtrrZLRiJ/
	8mOkbiz48hquKZ7VOl9rA/qu2YCrHsVvbNgC1/x4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AIJRYP006217
	for <meta-arago@arago-project.org>; Mon, 10 Sep 2018 13:19:27 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 10 Sep 2018 13:19:28 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 10 Sep 2018 13:19:27 -0500
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8AIJRTY025109;
	Mon, 10 Sep 2018 13:19:27 -0500
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 10 Sep 2018 14:19:25 -0400
Message-ID: <1536603565-5971-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] ti-tisdk-makefile: update Makefile_pru-adc for renaming the binary in installation
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
X-List-Received-Date: Mon, 10 Sep 2018 18:19:36 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc | 2 +-
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
index 4723879..062f780 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
@@ -30,5 +30,5 @@ pru-adc_install:
 		$(DESTDIR)/lib/firmware/pru; \
 	install -m 0644 ./PRU_ADS8688_Interface/gen/PRU_ADS8688_Interface.out \
 		$(DESTDIR)/lib/firmware/pru; \
-	install -m 755 ./ARM_User_Space_App/gen/ARM_User_Space_App.out $(DESTDIR)/usr/bin
+	install -m 755 ./ARM_User_Space_App/gen/ARM_User_Space_App.out $(DESTDIR)/usr/bin/pru-adc-arm-app.out
 
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index f80e65b..171c531 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk57"
+PR_append = ".tisdk58"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


