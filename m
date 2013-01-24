Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id E446652A21
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 14:21:51 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id n16so9923331oag.9
	for <meta-arago@arago-project.org>;
	Thu, 24 Jan 2013 06:21:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=c5dVvwXsH/pg8Na/4rqv6AHTyLt750nQNwa2RABX0b8=;
	b=vYfzUa7xKb+7RM5GoD7t7Kdwax73xW4ThVF7rv/o43Ami7x91YOkBjHAW/2CxW1zhZ
	20IpGP00Vz1tglggV//2dta2mwNEZ00gZ9I/4f5Zr4PLIk0rK80VSpPwkt/UdKeicCGK
	iYjKYp7FNycACRoMxmxREkvUveb7WXLWpvDSqODLYnTnIrwWF7APYrX2L7md867bwoBb
	D0TTzMoFoi1eJOL70LOyXpiOOagIHwCiipKsbeyDKI5LtTjZqd9XTpM2k/qBGn7yFQuw
	EHYwvN+FzYLvVPQmaDvbmM+5jEgj0Z6KtZ/VYnnRLYaIxKB7oNX+8uePvsxb3SeecFrx
	9K+Q==
X-Received: by 10.182.36.8 with SMTP id m8mr1545801obj.93.1359037311448;
	Thu, 24 Jan 2013 06:21:51 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id yn8sm18069853obb.12.2013.01.24.06.21.49
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 24 Jan 2013 06:21:50 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 24 Jan 2013 08:21:18 -0600
Message-Id: <1359037281-12610-13-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359037281-12610-1-git-send-email-fcooper@ti.com>
References: <1359037281-12610-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 44/47] busybox: Enable rev utility
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
X-List-Received-Date: Thu, 24 Jan 2013 14:21:52 -0000

* Enabling rev utility that is used by some test scripts.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index f681eb7..7d3c552 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -518,7 +518,7 @@ CONFIG_DEFAULT_DEPMOD_FILE="modules.dep"
 # Linux System Utilities
 #
 # CONFIG_BLOCKDEV is not set
-# CONFIG_REV is not set
+CONFIG_REV=y
 # CONFIG_ACPID is not set
 # CONFIG_FEATURE_ACPID_COMPAT is not set
 # CONFIG_BLKID is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index b2d2540..bee6201 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago4"
+PR_append = "-arago5"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


