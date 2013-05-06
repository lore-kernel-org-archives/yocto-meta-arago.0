Return-Path: <a0221004@ares-ubuntu>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id DCD1252981
	for <meta-arago@arago-project.org>;
	Mon,  6 May 2013 21:19:35 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r46LJZgp030388
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:19:35 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r46LJZTT025104
	for <meta-arago@arago-project.org>; Mon, 6 May 2013 16:19:35 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 6 May 2013 16:19:34 -0500
Received: from ares-ubuntu.am.dhcp.ti.com (ares-ubuntu.am.dhcp.ti.com
	[158.218.103.17])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	r46LJZWH031006;	Mon, 6 May 2013 16:19:35 -0500
Received: from a0221004 by ares-ubuntu.am.dhcp.ti.com with local (Exim 4.76)
	(envelope-from <a0221004@ares-ubuntu>)	id 1UZSoo-0002Dz-Rm;
	Mon, 06 May 2013 17:19:34 -0400
From: <zhoujt@ti.com>
To: <meta-arago@arago-project.org>, <zhoujt@ti.com>
Date: Mon, 6 May 2013 17:19:30 -0400
Message-ID: <1367875170-8518-2-git-send-email-zhoujt@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1367875170-8518-1-git-send-email-zhoujt@ti.com>
References: <1367875170-8518-1-git-send-email-zhoujt@ti.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] added initscrip-debugfs into the server-extrapackage group
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
X-List-Received-Date: Mon, 06 May 2013 21:19:36 -0000
Content-Type: text/plain

From: Jingting Zhou <a0221004@ares-ubuntu>

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


