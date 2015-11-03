Return-Path: <jake@udd0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id CAE4952AB3
	for <meta-arago@arago-project.org>;
	Tue,  3 Nov 2015 19:56:37 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tA3JuaS8014199
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3Juahh025172
	for <meta-arago@arago-project.org>; Tue, 3 Nov 2015 13:56:36 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 Nov 2015 13:56:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tA3JuaCa006857;
	Tue, 3 Nov 2015 13:56:36 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zthh6-0004VQ-Bi; Tue, 03 Nov 2015 14:56:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 3 Nov 2015 14:56:28 -0500
Message-ID: <1446580592-17255-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
References: <1446580592-17255-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 06/10] packagegroup-arago-tisdk-crypto-sdk-host: keystone: Add cryptodev sources
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
X-List-Received-Date: Tue, 03 Nov 2015 19:56:39 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
index 509642e..632efe7 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-crypto-sdk-host.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install crypto sources in SDK"
 LICENSE = "MIT"
-PR = "r9"
+PR = "r10"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -10,10 +10,12 @@ CRYPTO_RDEPENDS = ""
 
 CRYPTO_RDEPENDS_append_ti33x = " ti-crypto-examples-src"
 CRYPTO_RDEPENDS_append_ti43x = " ti-crypto-examples-src"
+CRYPTO_RDEPENDS_append_keystone = " ti-crypto-examples-src"
 
 CRYPTO_RDEPENDS_append_ti33x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_ti43x = " cryptodev-module-src"
 CRYPTO_RDEPENDS_append_dra7xx = " cryptodev-module-src"
+CRYPTO_RDEPENDS_append_keystone = " cryptodev-module-src"
 
 CRYPTO_RDEPENDS_append_am37x-evm = "\
     ti-ocf-crypto-module-src \
-- 
1.9.1


