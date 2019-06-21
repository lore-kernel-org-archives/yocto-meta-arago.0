Return-Path: <d-senicic1@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 91930529F6
	for <meta-arago@arago-project.org>;
	Fri, 21 Jun 2019 15:44:34 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5LFhq0g059685
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:43:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561131832;
	bh=9FmvDAHzbQUHcKPhkNiCY/dj8l/rpY2suxm9+rZ2xaA=;
	h=From:To:CC:Subject:Date;
	b=ufK0omAmiTSdtLPMuHnfcUOdLMlVHWNCV9LrB9iexWQ0lya550pM7aY6x+JDbOz2a
	dpxf/UEd83dZsZ6KqrNK075ThZ+fTLsOQ/aAtmUIzKCyWddM/CPyeMmSdVgItmw1SL
	vyDtYSPvjTP4P8TIne18IeLFGfLHdYhWXTDk1GZM=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5LFhqtb065911
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 21 Jun 2019 10:43:52 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 21 Jun 2019 10:43:52 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 21 Jun 2019 10:43:52 -0500
Received: from uda0271529a.gt.design.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5LFhpgl060505;
	Fri, 21 Jun 2019 10:43:52 -0500
From: Djordje Senicic <x0157990@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 21 Jun 2019 06:40:17 -0400
Message-ID: <20190621104017.31121-1-x0157990@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Djordje Senicic <x0157990@ti.com>
Subject: [thud/master][PATCH] demo-glow: Add makefile for demo-glow example application
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
X-List-Received-Date: Fri, 21 Jun 2019 15:44:34 -0000
Content-Type: text/plain

Signed-off-by: Djordje Senicic <x0157990@ti.com>
---
 .../ti-tisdk-makefile/Makefile_demo-glow      | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
new file mode 100644
index 00000000..96ede6af
--- /dev/null
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_demo-glow
@@ -0,0 +1,19 @@
+# barcode-roi build targets
+
+demo-glow:
+	@echo =============================
+	@echo    Building Demo GLOW
+	@echo =============================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build release
+
+demo-glow_clean:
+	@echo =============================
+	@echo    Cleaning Demo GLOW
+	@echo =============================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build clean
+
+demo-glow_install:
+	@echo ================================================
+	@echo   Installing Demo Glow - Release version
+	@echo ================================================
+	@cd example-applications; cd `find . -name "*demo-glow*"`; make -f Makefile.build install
-- 
2.17.1


