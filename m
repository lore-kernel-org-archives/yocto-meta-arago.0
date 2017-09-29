Return-Path: <e-ruei1@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 2B1C152AE4
	for <meta-arago@arago-project.org>;
	Fri, 29 Sep 2017 18:23:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v8TINaIf007554
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1506709416;
	bh=X+2hHaFY4XosemHqJ59Eam+Ybby2TljWZMaqMKYj6es=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=jFWxddtUXr2xfC1J7KRC3LzqezMbscAeqBfsiL1F4/yPCHwQ7hWTKtCGbSu6dRnI7
	KcybrdoSZyP0X0B6UNvCkBJNf0FEFFXgAXQKmiJitYGnMcJSV7kKGIW6vW3EbAHy58
	+WcRVqNlzMJcN0/+Xnq8wAH79iIa0KHQtqx9XYM0=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINaQR010434
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
Received: from DLEE104.ent.ti.com (157.170.170.34) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Fri, 29 Sep 2017 13:23:36 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Fri, 29 Sep 2017 13:23:36 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v8TINW8g006890
	for <meta-arago@arago-project.org>; Fri, 29 Sep 2017 13:23:36 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 29 Sep 2017 14:23:21 -0400
Message-ID: <1506709407-16448-18-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
References: <1506709407-16448-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][morty-x11-experimental][PATCH 17/ packagegroup-arago-tisdk-graphics-sdk-host(target): select sgx ddk package based om MACHINE_FEATURES (xsgx vs. sgx)
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
X-List-Received-Date: Fri, 29 Sep 2017 18:23:43 -0000
Content-Type: text/plain

Note: xsgx represents sgx for X11 support

Signed-off-by: Eric Ruei <e-ruei1@ti.com>
---
 .../packagegroup-arago-tisdk-graphics-sdk-host.bbappend              | 4 +++-
 .../packagegroup-arago-tisdk-graphics-sdk-target.bbappend            | 5 ++++-
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bbappend
index 2fc476e..2dcbaec 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-host.bbappend
@@ -1,4 +1,6 @@
-PR_append = ".tisdk3"
+PR_append = ".tisdk4"
+
+GRAPHICS_RDEPENDS = "${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-km-src", "ti-sgx-ddk-km-src", d)}"
 
 GRAPHICS_GC320_RDEPENDS = "ti-gc320-driver-src"
 
diff --git a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bbappend b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bbappend
index 40ea58a..7c40d56 100644
--- a/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bbappend
+++ b/recipes-core/packagegroups/packagegroup-arago-tisdk-graphics-sdk-target.bbappend
@@ -1,4 +1,7 @@
-PR_append = ".tisdk3"
+PR_append = ".tisdk4"
+
+GRAPHICS_RDEPENDS_remove = "ti-sgx-ddk-um-dev"
+GRAPHICS_RDEPENDS_append = "${@bb.utils.contains("MACHINE_FEATURES", "xsgx", "ti-xsgx-ddk-um-dev", "ti-sgx-ddk-um-dev", d)}"
 
 GRAPHICS_GC320_RDEPENDS = "ti-gc320-libs-dev"
 
-- 
1.9.1


