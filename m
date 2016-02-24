Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 099A3529E6
	for <meta-arago@arago-project.org>;
	Wed, 24 Feb 2016 20:12:01 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u1OKC1hK030134
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC1ZZ012610
	for <meta-arago@arago-project.org>; Wed, 24 Feb 2016 14:12:01 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u1OKC0pC029841;
	Wed, 24 Feb 2016 14:12:00 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aYfmy-0003Nk-A9; Wed, 24 Feb 2016 15:12:00 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 24 Feb 2016 15:11:57 -0500
Message-ID: <1456344717-12958-3-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1456344717-12958-1-git-send-email-j-stiffler@ti.com>
References: <1456344717-12958-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] nativesdk-packagegroup-arago-sdk-host: Include ubifs utils
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
X-List-Received-Date: Wed, 24 Feb 2016 20:12:02 -0000
Content-Type: text/plain

* Include the ubifs utils to allow users to create their own ubi
  images

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb             | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index 42b93e7..8eb4759 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r12"
+PR = "r13"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
@@ -8,6 +8,7 @@ EXTRA_TOOLS = "nativesdk-ti-cgt6x \
                nativesdk-ti-cgt-pru \
                nativesdk-clocl \
                nativesdk-clacc \
+               nativesdk-mtd-utils-ubifs \
 "
 
 RDEPENDS_${PN} = "\
-- 
1.9.1


