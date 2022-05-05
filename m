Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0DCB6C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 12:24:17 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web10.10227.1651753452836421571
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 05 May 2022 05:24:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=h+dW3nKa;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: reatmon@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 245CO91r003699;
	Thu, 5 May 2022 07:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1651753449;
	bh=RdHxJqH4ugeTA7yipM2VnHc87Tq15KHtj56kJvoSZpY=;
	h=From:To:Subject:Date;
	b=h+dW3nKadc00pwxCU+xasCR8b/ZqdxY1OpAlRCoeDEimuJ+BMfeUhNp+NuHg+Levh
	 w7M2VyrgB3ZXFGVLpAzeLbe+qTBU9d0+MRISUaZctUsEvXQ9/Rhvdhhu9FWWenbKjM
	 38iVF6t+xDdZ19SfcC53nCWGllTiyEasPcBWLZj4=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 245CO9Vs031378
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 5 May 2022 07:24:09 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Thu, 5
 May 2022 07:24:09 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Thu, 5 May 2022 07:24:09 -0500
Received: from uda0214219 (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 245CO9qH001037;
	Thu, 5 May 2022 07:24:09 -0500
Received: from reatmon by uda0214219 with local (Exim 4.90_1)
	(envelope-from <reatmon@ti.com>)
	id 1nmaWf-0002bj-2Q; Thu, 05 May 2022 07:24:09 -0500
From: Ryan Eatmon <reatmon@ti.com>
To: Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: [meta-arago][dunfell][PATCH] packagegroups,ti-tisdk-makefile: am62xx
 dd pru-icss
Date: Thu, 5 May 2022 07:24:09 -0500
Message-ID: <20220505122409.9984-1-reatmon@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 05 May 2022 12:24:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13837

Now that the recipe for pru-icss supports am62xx we
need to also turn on the dependencies that pull pru-icss
into the images.

Signed-off-by: Ryan Eatmon <reatmon@ti.com>
---
 ...ackagegroup-arago-tisdk-addons-sdk-host.bb |  4 ++
 .../packagegroup-arago-tisdk-addons.bb        |  2 +-
 .../ti-tisdk-makefile/Makefile_pru-icss       | 40 +++++++++++++++++++
 .../ti-tisdk-makefile_1.0.bb                  |  5 +++
 4 files changed, 50 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
index c44f95ca..062948d0 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-host.bb
@@ -57,6 +57,10 @@ UTILS_append_am64xx = " \
     pru-icss-src \
 "
 
+UTILS_append_am62xx = " \
+    pru-icss-src \
+"
+
 EXTRA_LIBS = ""
 
 EXTRA_LIBS_append_omap-a15 = " \
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
index 71b737e7..094c47a2 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons.bb
@@ -65,7 +65,7 @@ UTILS_append_k3 = " mmc-utils \
 "
 
 UTILS_append_am64xx = " ti-rtos-firmware pru-icss"
-UTILS_append_am62xx = " ti-rtos-firmware"
+UTILS_append_am62xx = " ti-rtos-firmware pru-icss"
 UTILS_append_am65xx = " ti-rtos-firmware pru-icss pru-pwm-fw"
 UTILS_append_j7 = " ti-rtos-firmware"
 UTILS_append_j7-evm = " pru-icss"
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
index 10e5bf3f..46642e64 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -107,6 +107,46 @@ pru-icss_install_am65x: pru-icss_install_common
 		done; \
 	done
 
+pru-icss_install_am64x: pru-icss_install_common
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
+	for i in 0 1; \
+	do \
+		install -m 0644 ./examples/am64x/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+		install -m 644 ./examples/am64x/RTU_Halt/gen/RTU$${i}/RTU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+	done; \
+	for i in 0 1 2; \
+	do \
+		for j in 0 1; \
+		do \
+			install -m 0644 ./examples/am64x/PRU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+			install -m 0644 ./examples/am64x/RTU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/RTU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+		done; \
+	done
+
+pru-icss_install_am62x: pru-icss_install_common
+	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
+	for i in 0 1; \
+	do \
+		install -m 0644 ./examples/am62x/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+		install -m 644 ./examples/am62x/RTU_Halt/gen/RTU$${i}/RTU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+	done; \
+	for i in 0 1 2; \
+	do \
+		for j in 0 1; \
+		do \
+			install -m 0644 ./examples/am62x/PRU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+			install -m 0644 ./examples/am62x/RTU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/RTU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+		done; \
+	done
+
 pru-icss_install_j721e: pru-icss_install_common
 	@cd example-applications; cd `find . -maxdepth 1 -type d -name "*pru-icss*"`; \
 	for i in 0 1; \
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 7fb47bbb..f0a044f7 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -202,6 +202,10 @@ MAKEFILES_append_am64xx = " \
                         pru-icss \
 "
 
+MAKEFILES_append_am62xx = " \
+                        pru-icss \
+"
+
 # Use this to export kernel arch to ARCH
 #
 # We need to be very careful here. This class will also overwrite UBOOT_ARCH
@@ -239,6 +243,7 @@ PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
 PRU_ICSS_INSTALL_TARGET_am65xx = "pru-icss_install_am65x"
 PRU_ICSS_INSTALL_TARGET_j7 = "pru-icss_install_j721e"
 PRU_ICSS_INSTALL_TARGET_am64xx = "pru-icss_install_am64x"
+PRU_ICSS_INSTALL_TARGET_am62xx = "pru-icss_install_am62x"
 
 # Path to toolchains for the various cores in TI SOCs
 #
-- 
2.17.1


