Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 412EA529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:40:17 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2652802oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:40:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=UuQbM4L/JMq2NLG2QDZsTJlMV4SRwGceFnPgWnuhvy0=;
	b=f1HZuZorJS9Y6NjhJ5MR1WRudV3Ldif10uEJJIdYCyjUqTIKaxluhifn+bcXX5C0Wp
	wJQssHZZooBC2X9XJG3a9/59A9Fq2L5ugp+PmRtVPn65wGGaKwspm0+OTxN308WNuwM6
	mbd1RLq8nG/pSxVg/Nhaj8pMz0zTEp3/PdCpxMfITxeFeuvqg947SmIL1UocVXfEQ8oU
	WVo8VkfMeAJuMmCNH+WuHv3pIwQ/dz48Rb7d59oTGGfblcsxBPKTnZnSqbk09Tl2+qDj
	EDSAigV/2NIb4ftyykoXsffr23GOj1kGem5XD16N/vrH5pQpwlLVZFTJv9caYdBtR7Tw
	VUyQ==
Received: by 10.182.145.9 with SMTP id sq9mr34490496obb.42.1351795216765;
	Thu, 01 Nov 2012 11:40:16 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fw9sm6952144obc.19.2012.11.01.11.40.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:40:16 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:40:12 -0500
Message-Id: <1351795212-4786-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] wif-direct-demo: Remove unnecessary ${PN} from package list
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
X-List-Received-Date: Thu, 01 Nov 2012 18:40:17 -0000

* The current recipe added ${PN} to the PACKAGES variable. By default ${PN} is
  already included in the PACKAGES variable which resulted in the error:
  "ERROR: wifi-direct-demo is listed in PACKAGES multiple times, this leads to
   packaging errors."
* Removing ${PN} from the PACKAGES += statement fixes this issue

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../wifi-direct-demo/wifi-direct-demo_git.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
index 328bc41..96322ac 100644
--- a/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
+++ b/meta-arago-extras/recipes-connectivity/wifi-direct-demo/wifi-direct-demo_git.bb
@@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://src/main.cpp;md5=cf285050f56a20d116b026c9f8ded4f7"
 
 COMPATIBLE_MACHINE = "(am37x-evm|am335x-evm|am180x-evm|am181x-evm)"
 
-PR = "r2"
+PR = "r3"
 
 BRANCH = "dbus"
 SRCREV = "0950a67d9fe9a70668a993774e65ba9d457d750c"
@@ -35,7 +35,7 @@ do_install () {
        install -m 644 ${WORKDIR}/wifi-direct-demo.desktop ${D}${MATRIX_APP_DIR}/wifi-direct-demo
 }
 
-PACKAGES += "${PN} matrix-gui-wifi-direct-demo"
+PACKAGES += "matrix-gui-wifi-direct-demo"
 
 FILES_${PN} +=" \
 	${bindir}/wifi-direct-demo \
-- 
1.7.0.4


