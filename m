Return-Path: <sam.nelson@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 50CA952A3E
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 17:58:43 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SHwhba000972
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:58:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493402323;
	bh=n9vGfc9ZL0tQyTxvu71qJ6V1iraCdWeIzblmVK48M98=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=hQKVQs77HmGGEkpx3Fp/su/K7oTYhImg4f5HQtGlkrFaNeJ7BuyaFqH4GrNZnFCic
	/o8gjKzxRWabbnAVKDooQKBUW8Y7Dfv0G84pE3/pQX94Igxf6uK85BmzF3FUpNcpiv
	A0v707AONu59tsMd2lZKf27XO0diyOW1rfUvnyGU=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SHwhtR023166
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 12:58:43 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 12:58:43 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SHwfrO008305;	Fri, 28 Apr 2017 12:58:42 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Apr 2017 13:58:40 -0400
Message-ID: <1493402320-11537-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
References: <1493402320-11537-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v2 2/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package
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
X-List-Received-Date: Fri, 28 Apr 2017 17:58:44 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb        | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 784c5b4..f0248d3 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
@@ -106,6 +106,7 @@ ARAGO_TI_KEYSTONE_PKGS = "\
     ipsecmgr-mod \
     k2-initramfs \
     parse-ip \
+    ti-ipc-examples-linux \
     "
 
 # The following packages are not yet ready for k2g-evm
@@ -116,6 +117,8 @@ ARAGO_TI_KEYSTONE_PKGS = "\
 
 ARAGO_TI_PKGS = ""
 ARAGO_TI_PKGS_append_keystone = " ${ARAGO_TI_KEYSTONE_PKGS}"
+ARAGO_TI_PKGS_append_omap-a15 = " ti-ipc-examples-linux"
+ARAGO_TI_PKGS_append_omapl138 = " ti-ipc-examples-linux"
 
 # Disable netapi due to libnl and xfrm conflict
 #    netapi
-- 
1.9.1


