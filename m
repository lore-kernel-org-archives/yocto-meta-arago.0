Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web09.21699.1643242927877060632
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 26 Jan 2022 16:22:08 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id BBDDC40CC2
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZCxHStNUeOiM for <meta-arago@lists.yoctoproject.org>;
	Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A5D5740C2E
	for <meta-arago@lists.yoctoproject.org>; Thu, 27 Jan 2022 00:22:06 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 23EE9174729
	for <meta-arago@lists.yoctoproject.org>; Wed, 26 Jan 2022 19:22:05 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [master][PATCH 01/23] ti-tisdk-makefile: Remove barcode-roi snippet
Date: Wed, 26 Jan 2022 19:21:42 -0500
Message-Id: <1643242924-25090-2-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643242924-25090-1-git-send-email-denis@denix.org>
References: <1643242924-25090-1-git-send-email-denis@denix.org>

From: Priya N S <priya.ns@mistralsolutions.com>

* barcode-roi support is dropped from meta-arago due to breakage with
  OpenCV 4.1
* Remove the makefile snippet from the installer toplevel makefile

Note:
* barcode-roi makefile snippet needs to be added back once barcode-roi
  breakage with OpenCV 4.1 is fixed.

Signed-off-by: Priya N S <priya.ns@ti.com>
Acked-by: Nikhil Devshatwar <nikhil.nd@ti.com>
Signed-off-by: Yogesh Siraswar <yogeshs@ti.com>
Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 .../recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb            | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
index 24af109..f7b299e 100644
--- a/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
+++ b/meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb
@@ -97,7 +97,6 @@ MAKEFILES_append_ti33x = " u-boot-spl \
                            cryptodev \
                            ti-sgx-ddk-km \
                            pru-icss \
-                           barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
@@ -112,7 +111,6 @@ MAKEFILES_append_ti43x = " u-boot-spl \
                            ti-sgx-ddk-km \
                            cmem-mod \
                            pru-icss \
-                           barcode-roi \
                            uio-module-drv \
 			   mmwavegesture-hmi \
                            pdm-anomaly-detection \
-- 
2.7.4

