Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id D9E9D52AD9
	for <meta-arago@arago-project.org>;
	Fri, 19 Feb 2016 19:43:02 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1JJh2pW006626
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1GL022378
	for <meta-arago@arago-project.org>; Fri, 19 Feb 2016 13:43:02 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1JJh1uK026288;
	Fri, 19 Feb 2016 13:43:01 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aWqxB-0006ep-Iq; Fri, 19 Feb 2016 14:43:01 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 19 Feb 2016 14:42:57 -0500
Message-ID: <1455910978-25530-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
References: <1455910978-25530-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/7] nativesdk-packagegroup-arago-sdk-host: Add clacc to the devkit
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
X-List-Received-Date: Fri, 19 Feb 2016 19:43:04 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 8f47c9c..42b93e7 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r11"
+PR = "r12"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -7,6 +7,7 @@ inherit packagegroup nativesdk
 EXTRA_TOOLS = "nativesdk-ti-cgt6x \
                nativesdk-ti-cgt-pru \
                nativesdk-clocl \
+               nativesdk-clacc \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


