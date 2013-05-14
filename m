Return-Path: <a0862859@udb0862859>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id A1B5B52A5D
	for <meta-arago@arago-project.org>;
	Tue, 14 May 2013 13:08:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id r4ED8OoX030370
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 08:08:24 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r4ED8OYK012102
	for <meta-arago@arago-project.org>; Tue, 14 May 2013 08:08:24 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 14 May 2013 08:08:24 -0500
Received: from udb0862859 (udb0862859.am.dhcp.ti.com [10.218.112.220])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r4ED8OLf012977;
	Tue, 14 May 2013 08:08:24 -0500
Received: from a0862859 by udb0862859 with local (Exim 4.76)	(envelope-from
	<a0862859@udb0862859>)	id 1UcExs-00077q-7D;
	Tue, 14 May 2013 09:08:24 -0400
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 14 May 2013 09:08:16 -0400
Message-ID: <1368536896-27356-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH] Recipe: Adding pciutils package
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
X-List-Received-Date: Tue, 14 May 2013 13:08:25 -0000
Content-Type: text/plain

   pciutils provides very basic utilities for
   querying the devices on the pci bus, when pci
   interface is supported in the platform and
   useful to be part of the console package

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-console.bb    |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
index 5a80064..ceee77e 100755
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-console.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Extended task to get more basic and console apps"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -25,6 +25,7 @@ ARAGO_UTILS = "\
     i2c-tools \
     iproute2 \
     strace \
+    ${@base_contains('MACHINE_FEATURES', 'pci', 'pciutils', '',d)} \
     "
 
 ARAGO_SDK_PREREQ = "\
-- 
1.7.9.5


