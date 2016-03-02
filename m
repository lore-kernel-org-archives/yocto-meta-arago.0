Return-Path: <sam.nelson@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 717BE529E6
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 04:25:57 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u224PuC1002555
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 22:25:56 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u224PuLs013093
	for <meta-arago@arago-project.org>; Tue, 1 Mar 2016 22:25:56 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 1 Mar 2016 22:25:55 -0600
Received: from ares-ubuntu2.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	u224Pl8H021571;	Tue, 1 Mar 2016 22:25:54 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Mar 2016 23:25:43 -0500
Message-ID: <1456892743-7229-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456892743-7229-1-git-send-email-sam.nelson@ti.com>
References: <1456892743-7229-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] doxygen: Update to new version 1.8.9.1
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
X-List-Received-Date: Wed, 02 Mar 2016 04:26:01 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../recipes-devtools/doxygen/{doxygen_1.8.6.bb => doxygen_1.8.9.1.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-arago-extras/recipes-devtools/doxygen/{doxygen_1.8.6.bb => doxygen_1.8.9.1.bb} (88%)

diff --git a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
similarity index 88%
rename from meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb
rename to meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
index bef665e..23919e8 100644
--- a/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.6.bb
+++ b/meta-arago-extras/recipes-devtools/doxygen/doxygen_1.8.9.1.bb
@@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=b380c86cea229fa42b9e543fc491f5eb"
 DEPENDS = "flex-native bison-native"
 
 SRC_URI = "http://ftp.stack.nl/pub/users/dimitri/${BP}.src.tar.gz"
-SRC_URI[md5sum] = "9385dc52f0627875f8fa758e754ec674"
-SRC_URI[sha256sum] = "6a718625f0c0c1eb3dee78ec1f83409b49e790f4c6c47fd44cd51cb92695535f"
+SRC_URI[md5sum] = "3d1a5c26bef358c10a3894f356a69fbc"
+SRC_URI[sha256sum] = "d4ab6e28d4d45d8956cad17470aade3fbe2356e8f64b92167e738c1887feccec"
 
 EXTRA_OECONF = "--prefix ${prefix}"
 
-- 
1.9.1


