Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id A20D1529DC
	for <meta-arago@arago-project.org>;
	Fri, 20 Dec 2019 20:28:02 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBKKQOEQ104587
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 14:26:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576873584;
	bh=Itntbg2n392bHejZ9QiO1hv3PVCpWecZ3fvEDUKtF28=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=F8IQXAUBZ0szO/F0vWM8j/CMWSCpKCwKOHrom3PaXZ0IlV5Jj3woLWZR/8jTTPTnh
	rA2t4fbOYg8W23kxZfC2PBtvvdUOE4PtPL5uAwVW9s/+ZZakknG4KBk29OsMks/Z79
	sr1qZQxcqvhUOSdQbX+Fc3CUsJ0nwjwzuXOLMwfo=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBKKQO3i031547
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 20 Dec 2019 14:26:24 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Fri, 20 Dec 2019 14:26:22 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Fri, 20 Dec 2019 14:26:22 -0600
Received: from udd0866934.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBKKQLtR043367;
	Fri, 20 Dec 2019 14:26:21 -0600
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 20 Dec 2019 15:07:17 -0500
Message-ID: <1576872438-22238-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576872438-22238-1-git-send-email-j-stiffler@ti.com>
References: <1576872438-22238-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [RFC 2/3] opencl: fix RDEPENDS
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
X-List-Received-Date: Fri, 20 Dec 2019 20:28:03 -0000
Content-Type: text/plain

* Use opencl-runtime package to bring in necessary dependencies to use
  OpenCL with run-time kernel compilation.
* The base opencl package will only pull dependencies necessary for
  running pre-built kernels.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 meta-arago-extras/recipes-ti/ocl/opencl_git.bb | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
index 69f9330..7128c74 100644
--- a/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
+++ b/meta-arago-extras/recipes-ti/ocl/opencl_git.bb
@@ -13,8 +13,13 @@ PACKAGE_ARCH = "${MACHINE_ARCH}"
 
 PACKAGES =+ "${PN}-runtime"
 
+MONITORS                      = " opencl-monitor"
+MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
+MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
+MONITORS_append_dra7xx        = " opencl-monitor-ipu"
+
 DEPENDS = " ocl-gl-headers \
-            opencl-monitor \
+            ${MONITORS} \
             cmake-native \
             cmem \
             ti-llvm3.6 \
@@ -35,14 +40,9 @@ DEPENDS_append_dra7xx   = " ti-ipc virtual/kernel"
 DEPENDS_append_keystone = " mpm-transport multiprocmgr"
 DEPENDS_remove_k2g = " libulm"
 
-MONITORS                      = " opencl-monitor"
-MONITORS_append_am57xx-evm    = " opencl-monitor-ipu"
-MONITORS_append_am57xx-hs-evm = " opencl-monitor-ipu"
-MONITORS_append_dra7xx        = " opencl-monitor-ipu"
-
-RDEPENDS_${PN} += " bash"
-RDEPENDS_${PN}-dev += " ocl-gl-headers-dev opencl-monitor"
-RDEPENDS_${PN}-runtime += " ${PN} ${MONITORS} clocl ti-cgt6x"
+RDEPENDS_${PN} += " bash ${MONITORS}"
+RDEPENDS_${PN}-dev += " ocl-gl-headers-dev"
+RDEPENDS_${PN}-runtime += " ${PN} clocl"
 
 ALLOW_EMPTY_${PN}-runtime = "1"
 
-- 
2.7.4


