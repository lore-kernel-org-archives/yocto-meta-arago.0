Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 5D5A152999
	for <meta-arago@arago-project.org>;
	Tue, 27 Oct 2015 19:05:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t9RJ5U9R012141
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:30 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5UvG022306
	for <meta-arago@arago-project.org>; Tue, 27 Oct 2015 14:05:30 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 27 Oct 2015 14:05:30 -0500
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t9RJ5U8N029197;
	Tue, 27 Oct 2015 14:05:30 -0500
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1Zr9Yo-0000xd-7q; Tue, 27 Oct 2015 15:05:30 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 27 Oct 2015 15:05:21 -0400
Message-ID: <1445972723-3625-7-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
References: <1445972723-3625-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [PATCH 6/8] nativesdk-packagegroup-arago-sdk-host: Add clocl
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
X-List-Received-Date: Tue, 27 Oct 2015 19:05:31 -0000
Content-Type: text/plain

* clocl is the OpenCL kernel compiler which is required for OpenCL
  runtime and development.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bb            | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index ec80bcb..4914e70 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,10 +1,10 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r9"
+PR = "r10"
 LICENSE = "MIT"
 
 inherit packagegroup nativesdk
 
-EXTRA_TOOLS = "nativesdk-ti-cgt6x"
+EXTRA_TOOLS = "nativesdk-ti-cgt6x nativesdk-clocl"
 
 RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
-- 
1.9.1


