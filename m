Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id C3FE052990
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 17:19:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91HJRBM010717
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJRBE017127
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 12:19:26 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJHmD001903;
	Tue, 1 Oct 2013 12:19:25 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2013 13:04:19 -0500
Message-ID: <1380650659-16536-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1380650659-16536-1-git-send-email-fcooper@ti.com>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/3] Don't package kernel files in boot partition for AMSDK 7.0
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
X-List-Received-Date: Tue, 01 Oct 2013 17:19:28 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 configs/amsdk-config-07.00.00.00.txt |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configs/amsdk-config-07.00.00.00.txt b/configs/amsdk-config-07.00.00.00.txt
index a011f83..bf409d7 100644
--- a/configs/amsdk-config-07.00.00.00.txt
+++ b/configs/amsdk-config-07.00.00.00.txt
@@ -241,7 +241,7 @@ SD_CARD_CONTENT="/home/jenkins/extra-files/sd_content"
 # the boot partition tarball or not.  For newer kernel and u-boot combinations
 # the uImage and dtb files are kept in the rootfs partition and placing it in
 # the boot partition will cause confusion.
-PACKAGE_BOOT_KERNEL_FILES="true"
+PACKAGE_BOOT_KERNEL_FILES="false"
 
 # This variable points to the directory where the webgen tool has been
 # Installed.
-- 
1.7.0.4


