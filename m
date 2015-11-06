Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id A95E352A71
	for <meta-arago@arago-project.org>;
	Fri,  6 Nov 2015 19:30:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA6JUaws012094
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:37 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUaCb010821
	for <meta-arago@arago-project.org>; Fri, 6 Nov 2015 13:30:36 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 6 Nov 2015 13:30:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA6JUauc009588;
	Fri, 6 Nov 2015 13:30:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zumia-0006MU-E8; Fri, 06 Nov 2015 14:30:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 6 Nov 2015 14:30:30 -0500
Message-ID: <1446838233-24415-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
References: <1446838233-24415-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 1/4] nativesdk-packagegroup-arago-sdk-host: Add ti-cgt-pru
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
X-List-Received-Date: Fri, 06 Nov 2015 19:30:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb         | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 4914e70..8f47c9c 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,10 +1,13 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r10"
+PR = "r11"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
-EXTRA_TOOLS = "nativesdk-ti-cgt6x nativesdk-clocl"
+EXTRA_TOOLS = "nativesdk-ti-cgt6x \
+               nativesdk-ti-cgt-pru \
+               nativesdk-clocl \
+"
 
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
-- 
1.9.1


