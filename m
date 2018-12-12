Return-Path: <h-gou@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 823B152A49
	for <meta-arago@arago-project.org>;
	Wed, 12 Dec 2018 21:08:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBCL8hLL022100
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 15:08:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544648923;
	bh=iijVGCrJmodquru7yXNbTzE9GSS1BcqdZgTwD+dmC68=;
	h=From:To:CC:Subject:Date;
	b=BsB9kHgat4daoVtl1coaUA836f3qlNA0lCxHMdLwXg0fAZFWGEyQ5pBQvtji2qGiP
	uOs5xIEQ0CPtnbeDlRyRBbtCMiQKlnjEQVq8BKCWIj1OBnFp1tqoPcbI3FeBFct+HP
	tw8e9hY7jMjYbnOwaWTvYNwj4kjwYVAqx5tIAna4=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBCL8he9023718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Dec 2018 15:08:43 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Wed, 12 Dec 2018 15:08:42 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Wed, 12 Dec 2018 15:08:42 -0600
Received: from uda0271529.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBCL8gQb006897;
	Wed, 12 Dec 2018 15:08:42 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 12 Dec 2018 16:08:40 -0500
Message-ID: <1544648920-16175-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk] [PATCH] ti-tisdk-makefile: update Makefile_pru-adc to allow full make clean
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
X-List-Received-Date: Wed, 12 Dec 2018 21:08:55 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <a0271529@ti.com>
---
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc | 2 +-
 recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
index 062f780..57c6f19 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-adc
@@ -12,7 +12,7 @@ pru-adc_clean:
 	@echo    Cleaning PRU-ADC
 	@echo =================================
 	@cd example-applications; cd `find . -name "*pru-adc*"`; \
-		make clean
+		make PRU_CGT=$(LINUX_DEVKIT_PATH)/sysroots/__SDKMACHINE__-arago-linux/usr/share/ti/cgt-pru PRU_SSP=$(SDK_PATH_TARGET)/usr clean
 
 pru-adc_install:
 	@echo ===================================================
diff --git a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
index cdf9ebb..bf3dc1e 100644
--- a/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
+++ b/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bbappend
@@ -1,4 +1,4 @@
-PR_append = ".tisdk60"
+PR_append = ".tisdk61"
 
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-- 
1.9.1


