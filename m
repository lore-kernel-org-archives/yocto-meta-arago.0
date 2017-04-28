Return-Path: <sam.nelson@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 8903F5209B
	for <meta-arago@arago-project.org>;
	Fri, 28 Apr 2017 20:20:38 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v3SKKcCI012163
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 15:20:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493410838;
	bh=A78uT6YFTN4LXE5fw1uFsCbfWkS/zq9OJXE3GXwsC3Q=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=WW70FU2JV/6vt+PW5m6mRlFmboqEh61oXrUr0leU4Qd+h7F6LDbuR88etaygJZ3Hl
	yz4sHGdpfNfp4gj/SENA85y6oi8uDGiei1IFtCpcjkONGRf1DkyWQut9pBfwJ3kaXy
	RYVGUrb/PIwufmS2Nm4f3vA3faiAyj7VyJzQcHDw=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v3SKKcRV022428
	for <meta-arago@arago-project.org>; Fri, 28 Apr 2017 15:20:38 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 28 Apr 2017 15:20:38 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v3SKKPT8003599;	Fri, 28 Apr 2017 15:20:38 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 28 Apr 2017 16:20:24 -0400
Message-ID: <1493410824-49935-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
References: <1493410824-49935-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [morty/master][PATCH v3 2/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package
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
X-List-Received-Date: Fri, 28 Apr 2017 20:20:39 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>

---
Changes from previous patch
Remove for omap-a15
---
---
 .../packagegroups/packagegroup-arago-base-tisdk-server-extra.bb         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
index 784c5b4..56be64e 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base-tisdk-server-extra.bb
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


