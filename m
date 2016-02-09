Return-Path: <jake@udd0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 4E4CB52996
	for <meta-arago@arago-project.org>;
	Tue,  9 Feb 2016 16:16:38 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u19GGb9x024962
	for <meta-arago@arago-project.org>; Tue, 9 Feb 2016 10:16:37 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u19GGbdx031574
	for <meta-arago@arago-project.org>; Tue, 9 Feb 2016 10:16:37 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 9 Feb 2016 10:16:37 -0600
Received: from udd0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u19GGb5t018640;
	Tue, 9 Feb 2016 10:16:37 -0600
Received: from jake by udd0866934 with local (Exim 4.82)	(envelope-from
	<jake@udd0866934>)	id 1aTAxw-0008RC-Kq; Tue, 09 Feb 2016 11:16:36 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 9 Feb 2016 11:16:34 -0500
Message-ID: <1455034594-32400-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] packagegroup-arago-tisdk-addons-sdk-target: Add back ipsecmgr dev packages
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
X-List-Received-Date: Tue, 09 Feb 2016 16:16:38 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 .../packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
index cf279b5..6322ee8 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-addons-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to install headers and libraries related to addons into the SDK"
 LICENSE = "MIT"
-PR = "r22"
+PR = "r23"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -28,9 +28,6 @@ TI_SECURE_STORAGE_DEV = "\
 	libp11-staticdev \
 	"
 
-# Broken with 4.1
-#	ipsecmgr-dev
-#	ipsecmgr-staticdev
 EXTRA_LIBS_append_keystone = "\
 	${TI_SECURE_STORAGE_DEV} \
 	cmem-dev \
@@ -70,6 +67,8 @@ EXTRA_LIBS_append_keystone = "\
 	lksctp-tools-staticdev \
 	ipc-transport-qmss-dev \
 	ipc-transport-qmss-staticdev \
+	ipsecmgr-dev \
+	ipsecmgr-staticdev \
 	"
 
 EXTRA_LIBS_append_k2l-evm = "\
-- 
1.9.1


