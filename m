Return-Path: <h-gou@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id EBF7252079
	for <meta-arago@arago-project.org>;
	Thu, 22 Jun 2017 22:39:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v5MMdckX032498
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1498171178;
	bh=Ggmv6B2igZnmA9N8Trjup53Xf9pQcEw5KZxpaA4yiyk=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=aVRWj6qWk+IpPPzMBOiX8ntUwPH3M1dA7nhJrZDfRtoU6ZxtEYnMDAL8O19k9iU4n
	ST6VzFedxW1tcDVqdyKVqIqYW8bTCf7SVUtv3ORdTQegViiDEd1YKZa7uSzAZSwjEU
	2UeHfn2WxUXxABqU2wpktWAeVwxq/FsBgJjwr4S0=
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v5MMdWWY027147
	for <meta-arago@arago-project.org>; Thu, 22 Jun 2017 17:39:32 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 22 Jun 2017 17:39:32 -0500
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v5MMdQQO018315;	Thu, 22 Jun 2017 17:39:32 -0500
From: Hongmei Gou <h-gou@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 22 Jun 2017 18:39:20 -0400
Message-ID: <1498171160-26749-3-git-send-email-h-gou@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1498171160-26749-1-git-send-email-h-gou@ti.com>
References: <1498171160-26749-1-git-send-email-h-gou@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] ti-tisdk-makefile: add uio-module-drv for am3/am4/am5
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
X-List-Received-Date: Thu, 22 Jun 2017 22:39:48 -0000
Content-Type: text/plain

Signed-off-by: Hongmei Gou <h-gou@ti.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb         | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 15c14aa..7db995c 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -50,7 +50,7 @@ SRC_URI = "\
     file://Makefile_barcode-roi \
 "
 
-PR = "r81"
+PR = "r82"
 
 MAKEFILES_MATRIX_GUI = "matrix-gui-browser \
                         refresh-screen \
@@ -90,6 +90,7 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            ti-sgx-ddk-km \
                            pru-icss \
                            barcode-roi \
+                           uio-module-drv \
 "
 MAKEFILES_append_ti43x = " u-boot-spl \
                            ${QUICK_PLAYGROUND} \
@@ -101,6 +102,7 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ti-sgx-ddk-km \
                            pru-icss \
                            barcode-roi \
+                           uio-module-drv \
 "
 
 MAKEFILES_append_dra7xx = " cryptodev \
@@ -121,6 +123,7 @@ MAKEFILES_append_omap-a15 = " u-boot-spl \
                               pru-icss \
                               ti-gc320-driver \
                               barcode-roi \
+                              uio-module-drv \
 "
 MAKEFILES_append_omapl138 = " pru \
                               u-boot-legacy \
-- 
1.9.1


