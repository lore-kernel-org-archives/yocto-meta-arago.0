Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 21B155299E
	for <meta-arago@arago-project.org>;
	Tue, 27 Nov 2018 15:22:42 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id wARFMUFU095512
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 09:22:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1543332150;
	bh=f5eJ3u40vn68ESzAQW9uw3++/5e7IluxhfRuDy7n+kI=;
	h=From:To:CC:Subject:Date;
	b=g0J4g/AF+s7b3f26zyr4Nl4BChncrdG0wCFibdUVttAnpxK7jlVBCbxWMacrsI7YB
	E9l7kGXmaaQyQ9cpNQx/ZT/KTdow4WS/E+EQKYINkHWlRkt01Q5xcAIG/pJrWfthqp
	cEGRzIfOLyUEjoKgpJlfiMUhZvn3SVAbTo6fG9RU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id wARFMUbj087290
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Tue, 27 Nov 2018 09:22:30 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1591.10;
	Tue, 27 Nov 2018 09:22:30 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1591.10 via Frontend
	Transport; Tue, 27 Nov 2018 09:22:30 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id wARFMUjJ012637;
	Tue, 27 Nov 2018 09:22:30 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Nov 2018 10:10:06 -0500
Message-ID: <1543331406-27245-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [master/rocko][PATCH] ti-tisdk-makefile: linux_dtbs: fix installation
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
X-List-Received-Date: Tue, 27 Nov 2018 15:22:43 -0000
Content-Type: text/plain

* Mimic the way DTB installation is handled by
  kernel-devicetree.bbclass.
* This resolves an error when DTBs with identical filenames are found
  in multiple locations. For example:
  - arch/arm/boot/dts/am57xx-beagle-x15.dtb
  - arch/arm/boot/dts/ti/am57xx-beagle-x15.dtb

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs           | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
index 2697772..fa409d0 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linux-dtbs
@@ -18,7 +18,9 @@ linux-dtbs_install:
 		exit 1; \
 	fi
 	install -d $(DESTDIR)/boot
-	@cp -f `find $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/dts/ -regex '.*\.dtbo?'` $(DESTDIR)/boot/
+	@for DTB in __KERNEL_DEVICETREE__; do \
+		install -m 0644 $(LINUXKERNEL_INSTALL_DIR)/arch/__KERNEL_ARCH__/boot/dts/$$DTB $(DESTDIR)/boot/; \
+	done
 
 linux-dtbs_clean:
 	@echo =======================================
-- 
2.7.4


