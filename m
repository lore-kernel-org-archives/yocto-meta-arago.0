Return-Path: <a0221004@ares-ubuntu>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id E6F7C52A6B
	for <meta-arago@arago-project.org>;
	Wed,  8 May 2013 22:30:06 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r48MU6rI017290
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:30:06 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r48MU5OM015753
	for <meta-arago@arago-project.org>; Wed, 8 May 2013 17:30:06 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 8 May 2013 17:30:05 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r48MU5E9018453;	Wed, 8 May 2013 17:30:05 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UaCs8-0007po-Uo;
	Wed, 08 May 2013 18:30:04 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 8 May 2013 18:30:02 -0400
Message-ID: <1368052202-30076-2-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
References: <1368052202-30076-1-git-send-email-zhoujt@ti.com>
MIME-Version: 1.0
Cc: Jingting Zhou <zhoujt@ti.com>
Subject: [PATCH 2/2] Added initscript-debugfs to the server-extra packagegroup list
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
X-List-Received-Date: Wed, 08 May 2013 22:30:07 -0000
Content-Type: text/plain

From: Jingting Zhou <zhoujt@ti.com>

Signed-off-by: Jingting Zhou <zhoujt@ti.com>
---
 .../packagegroup-arago-base-tisdk-server-extra.bb  |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 46db7c2..dfc78c2 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r7"
+PR = "r8"
 
 inherit packagegroup
 
@@ -95,4 +95,5 @@ RDEPENDS_${PN} = "\
     ti-netapi \
     ti-ipc \
     ebtables \
+    initscript-debugfs \
 	"
-- 
1.7.9.5


