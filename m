Return-Path: <e-ruei1@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 6094352AB3
	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 23:08:05 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id tAPN848W012559
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tAPN84Mj026929
	for <meta-arago@arago-project.org>; Wed, 25 Nov 2015 17:08:04 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 25 Nov 2015 17:08:04 -0600
Received: from uda0850410.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id
	tAPN83pf018422	for <meta-arago@arago-project.org>;
	Wed, 25 Nov 2015 17:08:04 -0600
From: Eric Ruei <e-ruei1@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 25 Nov 2015 18:07:57 -0500
Message-ID: <1448492879-1050-4-git-send-email-e-ruei1@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
References: <1448492879-1050-1-git-send-email-e-ruei1@ti.com>
MIME-Version: 1.0
Subject: [PATCH 3/5] tisdk-rootfs-image: Include packagegroup-arago-tisdk-graphics unconditionally
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
X-List-Received-Date: Wed, 25 Nov 2015 23:08:06 -0000
Content-Type: text/plain

From: Eric Ruei <a0850410@uda0850410>

Enable non-SGX build for AM3/AM4
The Weston module within packagegroup-arago-tisdk-graphics is required 
for non-SGX software rendering build.

Signed-off-by: Eric Ruei <a0850410@uda0850410>
---
 meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
index 1bc6a36..98e1009 100644
--- a/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
+++ b/meta-arago-distro/recipes-core/images/tisdk-rootfs-image.bb
@@ -4,7 +4,7 @@ require arago-base-tisdk-image.bb
 
 IMAGE_INSTALL += "\
     packagegroup-arago-test \
-    ${@base_contains('MACHINE_FEATURES','sgx','packagegroup-arago-tisdk-graphics','',d)} \
+    packagegroup-arago-tisdk-graphics \
     packagegroup-arago-tisdk-qte \
     packagegroup-arago-tisdk-addons \
     packagegroup-arago-tisdk-connectivity \
-- 
1.9.1


