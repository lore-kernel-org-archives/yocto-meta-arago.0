Return-Path: <a0866934local@udb0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id BC439529C6
	for <meta-arago@arago-project.org>;
	Thu, 23 Apr 2015 11:52:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3NBqAn8014418
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 06:52:10 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NBq92h026881
	for <meta-arago@arago-project.org>; Thu, 23 Apr 2015 06:52:09 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 23 Apr 2015 06:52:09 -0500
Received: from udb0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3NBq9C2025629;
	Thu, 23 Apr 2015 06:52:09 -0500
Received: from a0866934local by udb0866934 with local (Exim 4.76)
	(envelope-from <a0866934local@udb0866934>)	id 1YlFfs-00052q-Na;
	Thu, 23 Apr 2015 07:52:08 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 23 Apr 2015 07:52:05 -0400
Message-ID: <1429789925-19362-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] nativesdk-packagegroup-arago-sdk-host: Add ti-cgt6x for omap-a15.
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
X-List-Received-Date: Thu, 23 Apr 2015 11:52:12 -0000
Content-Type: text/plain

* Add DSP codegen tools for omap-a15 SOC family.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 9ef9ddd..6615839 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,13 +1,17 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r5"
+PR = "r6"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
 
+EXTRA_TOOLS = ""
+EXTRA_TOOLS_omap-a15 = "nativesdk-ti-cgt6x"
+
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-opkg \
     nativesdk-libtool \
     nativesdk-python-distutils \
     nativesdk-git \
+    ${EXTRA_TOOLS} \
     "
-- 
1.7.9.5


