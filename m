Return-Path: <sam.nelson@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 976F8529E0
	for <meta-arago@arago-project.org>;
	Wed, 25 Feb 2015 21:06:09 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t1PL692v029887
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 15:06:09 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t1PL68KX012043
	for <meta-arago@arago-project.org>; Wed, 25 Feb 2015 15:06:08 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Feb 2015 15:06:07 -0600
Received: from udb0862859.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	t1PL66Bf025002;	Wed, 25 Feb 2015 15:06:07 -0600
From: Sam Nelson <sam.nelson@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Feb 2015 16:06:04 -0500
Message-ID: <1424898364-24979-2-git-send-email-sam.nelson@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1424898364-24979-1-git-send-email-sam.nelson@ti.com>
References: <1424898364-24979-1-git-send-email-sam.nelson@ti.com>
MIME-Version: 1.0
Subject: [PATCH v2 2/2] tisdk-server-rootfs-image: Add extra components for server
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
X-List-Received-Date: Wed, 25 Feb 2015 21:06:09 -0000
Content-Type: text/plain

Signed-off-by: Sam Nelson <sam.nelson@ti.com>
---
 .../images/tisdk-server-rootfs-image.bb            |    1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
index 908325f..3e9a30e 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-server-rootfs-image.bb
@@ -12,6 +12,7 @@ IMAGE_INSTALL += "\
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-crypto \
     packagegroup-arago-tisdk-matrix \
+    packagegroup-arago-base-tisdk-server-extra \
     gdb \
 "
 
-- 
1.7.9.5


