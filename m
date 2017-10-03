Return-Path: <e-ruei1@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 2D47552AFA
	for <meta-arago@arago-project.org>;
	Tue,  3 Oct 2017 15:54:34 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v93FsOFE005624
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507046064;
	bh=X+2hHaFY4XosemHqJ59Eam+Ybby2TljWZMaqMKYj6es=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=Kv69K6P2cj8NuZdEspedL0W9oiI3NkJHBmJMdrVfVSr28BF3aUWpTmNd5DTb+vupo
	+1VliS8JCffdsSb3z83PBJUTBD8/a26KkHOwQR7Ser6Nfob11+H4gwtqcIGrYZdudw
	vlDsWsWY3B+Ty/ZAYfPnnqdbdgApm4gfROAawAmc=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsJid018720
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:19 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 3 Oct 2017 10:54:18 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 3 Oct 2017 10:54:18 -0500
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v93FsFSE013524
	for <meta-arago@arago-project.org>; Tue, 3 Oct 2017 10:54:18 -0500
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Oct 2017 11:54:05 -0400
Message-ID: <1507046051-57949-18-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
References: <1507046051-57949-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [meta-processor-sdk][PATCH v2 17/23] packagegroup-arago-tisdk-graphics-sdk-host(target): select sgx ddk package based om MACHINE_FEATURES (xsgx vs. sgx)
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
X-List-Received-Date: Tue, 03 Oct 2017 15:54:35 -0000
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


