Return-Path: <fcooper@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 37D0652099
	for <meta-arago@arago-project.org>;
	Tue,  1 Oct 2013 17:19:25 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r91HJOVe010706
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:24 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJOZh017091
	for <meta-arago@arago-project.org>; Tue, 1 Oct 2013 12:19:24 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 1 Oct 2013 12:19:24 -0500
Received: from localhost.localdomain (dbdp20.itg.ti.com [172.24.170.38])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r91HJHmC001903;
	Tue, 1 Oct 2013 12:19:22 -0500
From: "Franklin S. Cooper Jr" <fcooper@ti.com>
To: <meta-arago@arago-project.org>
Date: Tue, 1 Oct 2013 13:04:18 -0500
Message-ID: <1380650659-16536-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1380650659-16536-1-git-send-email-fcooper@ti.com>
References: <1380650659-16536-1-git-send-email-fcooper@ti.com>
MIME-Version: 1.0
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 2/3] Remove unnecessary binary from boot partition
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
X-List-Received-Date: Tue, 01 Oct 2013 17:19:25 -0000
Content-Type: text/plain

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 lib/oesdk/package-sdks |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/lib/oesdk/package-sdks b/lib/oesdk/package-sdks
index 49f1fe7..8f4e5e2 100644
--- a/lib/oesdk/package-sdks
+++ b/lib/oesdk/package-sdks
@@ -42,6 +42,12 @@ create_sd_card_content() {
         mv u-boot-$m.bin u-boot.bin
     fi
 
+    # Remove this binary since it wouldn't be used in the boot partition
+    if [ -e u-boot-spl.bin-$m ]
+    then
+        rm u-boot-spl.bin-$m
+    fi
+
     # For some devices the uImage  and dtb files are read from the /boot
     # directory of the rootfs.  In this case do not package the uImage
     # and device tree files into the boot partition as it will cause
-- 
1.7.0.4


