Return-Path: <sam.nelson@ti.com>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id A5BF952A63
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 03:02:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id v4532Xwl017849
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 22:02:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493953353;
	bh=JF4HasAvpr0x7Joxer9OvF7Q5Dbczaa+1u5iBAHfyQY=;
	h=From:To:CC:Subject:Date;
	b=Pi0vPpDllclc+JO7fjJ/Sf6pap0FlFisgedzxeY1NGkPW7rtqIQQy/B106eIXDv9I
	dqZ/23ifWvDAu9SiutMp9/oe497ecQH5MSmEdoYRjKhggdb3Y+J28r4oE6QEy71ySU
	L0bvGoLILVCfQRPQmaTTP+AEzQiHafReTOLGRMes=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v4532Sel031697
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 22:02:28 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 22:02:28 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v4532R89001607;	Thu, 4 May 2017 22:02:28 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 May 2017 23:02:25 -0400
Message-ID: <1493953346-873-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 1/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package for k2 and omapl138
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
X-List-Received-Date: Fri, 05 May 2017 03:02:43 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Updated PR
---
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb       | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 784c5b4..d9b3391 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Additional packages beyond console packages shared by TI SDKs"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r16"
+PR = "r17"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
@@ -106,6 +106,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     ipsecmgr-mod \
     k2-initramfs \
     parse-ip \
+    ti-ipc-examples-linux \
     "
 
 # The following packages are not yet ready for k2g-evm
@@ -116,6 +117,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
 
 ARAGO_TI_PKGS = ""
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
+ARAGO_TI_PKGS_append_omapl138 = " ti-ipc-examples-linux"
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
-- 
1.9.1


