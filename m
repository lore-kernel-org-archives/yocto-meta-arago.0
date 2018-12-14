Return-Path: <manishalocal@uda0393239>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 7069F52A79
	for <meta-arago@arago-project.org>;
	Fri, 14 Dec 2018 22:45:03 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id wBEMipbd051897
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1544827491;
	bh=5qrtrSNtFSR+0LNbvSX9tJxrJN22FAfDduAvkycgv0M=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=N18CbNvke1jYv7KRiVZiWnLubZnBCDbwC19aVaA+iX4atyTM+GR02C4X/Dgr4g6AL
	HR+8+AbJlIXxCxU/lW0fEt3LTjgoJz0d9kqEeDysbEaPev2wD6SXjDUQ5imEKEd6Ae
	+werhIPJioLDAb6gqUDtzkjdqzTIgv6b0TopzHhM=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wBEMipwA091875
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Dec 2018 16:44:51 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Fri, 14 Dec 2018 16:44:51 -0600
Received: from uda0393239 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id wBEMip6A017526;
	Fri, 14 Dec 2018 16:44:51 -0600
Received: from manishalocal by uda0393239 with local (Exim 4.82)
	(envelope-from <manishalocal@uda0393239>)
	id 1gXwCR-0004xU-Bt; Fri, 14 Dec 2018 16:44:51 -0600
From: Manisha Agrawal <manisha.agrawal@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 14 Dec 2018 16:44:49 -0600
Message-ID: <20181214224449.19010-4-manisha.agrawal@ti.com>
X-Mailer: git-send-email 2.13.0
In-Reply-To: <20181214224449.19010-1-manisha.agrawal@ti.com>
References: <20181214224449.19010-1-manisha.agrawal@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko-next-rel][PATCH v2 4/4] ti-tisdk-makefile : add mmwavegesture-hmi demo
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
X-List-Received-Date: Fri, 14 Dec 2018 22:45:04 -0000
Content-Type: text/plain

Add mmwavegesture-hmi demo to Am335x, AM437x, omap15 and k3 device.

Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb       | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index f8eca685..c02f5c18 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,9 +50,10 @@ SRC_URI = "\
     file://Makefile_ti-gc320-driver \
     file://Makefile_barcode-roi \
     file://Makefile_sysfw-image \
+    file://Makefile_mmwavegesture-hmi \
 "
 
-PR = "r92"
+PR = "r93"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -94,6 +95,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            pru-icss \
                            barcode-roi \
                            uio-module-drv \
+			   mmwavegesture-hmi \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -107,6 +109,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            pru-icss \
                            barcode-roi \
                            uio-module-drv \
+			   mmwavegesture-hmi \
 "
 
 MAKEFILES_append_dra7xx = " cryptodev \
@@ -128,6 +131,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               ti-gc320-driver \
                               barcode-roi \
                               uio-module-drv \
+			      mmwavegesture-hmi \
 "
 MAKEFILES_append_omapl138 = " linux-dtbs \
                               u-boot-spl \
@@ -173,6 +177,7 @@ MAKEFILES_append_k3 = " u-boot-spl \
                         ti-sgx-ddk-km-k3 \
                         pru-icss \
                         sysfw-image \
+			mmwavegesture-hmi \
 "
 
 # Use this to export kernel arch to ARCH
-- 
2.13.0


