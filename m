Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id E7AFA52A88
	for <meta-arago@arago-project.org>;
	Tue, 28 Aug 2018 19:10:19 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7SJAB3K086577
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1535483411;
	bh=wQKsy+yMfrbItbQmL4R0ZGCE4zb9Lkjn/Ae7yVE3swk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=qQPHMjX3KrFVFORemPeOTfYgUjai/jXf/OtebRaijXTSwj4qxGavgTX4Nf3HHZdSK
	R4FWpfVGITmC/03STgt+ccnrexr2JaMb72eadl8tgjShIkr9iZaoElfZeUf4JnwTAg
	BMWG/A4hpi8k1KxL2H+h482ysZdtGnKIjn173FLo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJABK6022094
	for <meta-arago@arago-project.org>; Tue, 28 Aug 2018 14:10:11 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 28 Aug 2018 14:10:11 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 28 Aug 2018 14:10:11 -0500
Received: from udd0866934.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7SJA4ct003290;
	Tue, 28 Aug 2018 14:10:11 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 28 Aug 2018 14:57:47 -0400
Message-ID: <1535482668-18232-4-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1535482668-18232-1-git-send-email-j-stiffler@ti.com>
References: <1535482668-18232-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Nick Saulnier <nsaulnier@ti.com>
Subject: [PATCH v2 4/5] ti-tisdk-makefile: enable pru-icss for k3
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
X-List-Received-Date: Tue, 28 Aug 2018 19:10:21 -0000
Content-Type: text/plain

Cc: Nick Saulnier <nsaulnier@ti.com>
Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/Makefile_pru-icss              | 20 ++++++++++++++++++++
 .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       |  4 +++-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
index 8035b3a..d0f5130 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_pru-icss
@@ -83,3 +83,23 @@ pru-icss_install_k2g: pru-icss_install_common
 				$(DESTDIR)/lib/firmware/pru; \
 		done; \
 	done
+
+pru-icss_install_am65x: pru-icss_install_common
+	@cd example-applications; cd `find . -name "*pru-icss*"`; \
+	for i in 0 1; \
+	do \
+		install -m 0644 ./examples/am65x/PRU_Halt/gen/PRU$${i}/PRU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+		install -m 644 ./examples/am65x/RTU_Halt/gen/RTU$${i}/RTU_Halt_$${i}.out \
+			$(DESTDIR)/lib/firmware/pru; \
+	done; \
+	for i in 0 1 2; \
+	do \
+		for j in 0 1; \
+		do \
+			install -m 0644 ./examples/am65x/PRU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/PRU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+			install -m 0644 ./examples/am65x/RTU_RPMsg_Echo_Interrupt$${j}/gen/icssg$${i}/RTU_RPMsg_Echo_Interrupt$${i}_$${j}.out \
+				$(DESTDIR)/lib/firmware/pru; \
+		done; \
+	done
diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 802451f..78baa9b 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r89"
+PR = "r90"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -169,6 +169,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         barcode-roi \
                         cryptodev \
                         ti-sgx-ddk-km \
+                        pru-icss \
 "
 
 # Use this to export kernel arch to ARCH
@@ -199,6 +200,7 @@ PRU_ICSS_INSTALL_TARGET_ti33x = "pru-icss_install_am335x"
 PRU_ICSS_INSTALL_TARGET_ti43x = "pru-icss_install_am437x"
 PRU_ICSS_INSTALL_TARGET_omap-a15 = "pru-icss_install_am572x"
 PRU_ICSS_INSTALL_TARGET_k2g = "pru-icss_install_k2g"
+PRU_ICSS_INSTALL_TARGET_k3 = "pru-icss_install_am65x"
 
 
 # If it's not defined at all, like for zImage case
-- 
2.7.4


