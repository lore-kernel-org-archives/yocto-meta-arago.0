Return-Path: <sam.nelson@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 6D5C552982
	for <meta-arago@arago-project.org>;
	Fri,  5 May 2017 01:15:26 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v451FQwK028292
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 20:15:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1493946926;
	bh=OMoTtRdEq9j7fK67h2VgGTQH7eDLJ7PEsIBRrwxYkAs=;
	h=From:To:CC:Subject:Date;
	b=Nv5w15K14/HJuM2Q6Zzox77UdTdUyBLKU0mJKI0I6IU4P5cjDNGl/IwFH/BEVHLRs
	zhIDEaDv/e0ClWmCBAHUis1Y7rOjhcNYPXh/tn1gY6JI+VyIZkLxTUlizvVv0efHga
	u9meQpAAI4wT3qcqPnrqtoPMShJUVSE2PyYDwiyk=
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v451FPrO018690
	for <meta-arago@arago-project.org>; Thu, 4 May 2017 20:15:25 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 4 May 2017 20:15:25 -0500
Received: from uda0862859a.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	v451FPxf023374;	Thu, 4 May 2017 20:15:25 -0500
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 4 May 2017 21:15:22 -0400
Message-ID: <1493946923-64498-1-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [morty/master][PATCH 1/2] arago-base-tisdk-server-extra: Add ti-ipc-examples-linux package for k2 and omapl138
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
X-List-Received-Date: Fri, 05 May 2017 01:15:27 -0000
Content-Type: text/plain

ti-ipc-examples-linux adds binaries for Host Linux to Slave RTOS IPC
examples

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
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


