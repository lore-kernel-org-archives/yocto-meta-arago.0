Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f47.google.com (mail-oa0-f47.google.com
	[209.85.219.47])
	by arago-project.org (Postfix) with ESMTPS id 2FFA552AC8
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:47 +0000 (UTC)
Received: by mail-oa0-f47.google.com with SMTP id o17so9863250oag.34
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=ZLiLppP4c4dQyQ+6fGSfRyRTDK67Rkur0qCCzyc/GtE=;
	b=O7DFTuaB5TdZ9p2UPab0PzyeW+oVddRwRI1OvzZ8u4A8ZLNQxKRzTcTifrA6+2gIRU
	PT9y9Qf2UBOwOjbuXInsqGCKv6QjRUAqr/HbFSU4+9oskLdpzgpYuuopwgxhJSXdSRWt
	BZJH4ch1f3oBPzMuUxkXYS4dOr8+RL8HH6B31IDXtwETRPcuRiooqEW7tgqwpoI5hRI9
	op3+WarI83bDZdEScWlQV7LwWzX0tDlKktt06ip+/6A+eomaHOFX3gp2EVLIfgXUVuqs
	OQEhQg6/m+xzf+PZ0D7PqACj1BgxelqHS3NPBPoql49FqHCml0VU/EeQtt42ogVSutai
	FBFw==
X-Received: by 10.60.9.1 with SMTP id v1mr16394362oea.130.1362427306598;
	Mon, 04 Mar 2013 12:01:46 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.44
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:45 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:25 -0600
Message-Id: <1362427289-18057-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/10] arago.conf: Set PREFERRED_PROVIDER and VERSION for omap3 devices
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:47 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Set kernel PREFERRED_PROVIDER and PREFERRED_VERSION for omap3 devices.
* Set u-boot PREFERRED_VERSION for omap3 devices.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 6fa5401..17bb85b 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -60,6 +60,18 @@ PREFERRED_VERSION_linux-omapl138-psp_am180x-evm = "2.6.37"
 PREFERRED_PROVIDER_virtual/kernel_am180x-evm = "linux-omapl138-psp"
 PREFERRED_VERSION_u-boot_am180x-evm = "2010.12-psp03.21.00.04.sdk"
 
+PREFERRED_PROVIDER_virtual/kernel_am37x-evm = "linux-omap-psp"
+PREFERRED_VERSION_linux-omap-psp_am37x-evm = "2.6.37"
+PREFERRED_VERSION_u-boot_am37x-evm = "2012.04.01"
+
+PREFERRED_PROVIDER_virtual/kernel_am3517-evm = "linux-omap-psp"
+PREFERRED_VERSION_linux-omap-psp_am3517-evm = "2.6.37"
+PREFERRED_VERSION_u-boot_am3517-evm = "2011.09-psp04.06.00.08"
+
+PREFERRED_PROVIDER_virtual/kernel_beagleboard = "linux"
+PREFERRED_VERSION_linux_beagleboard = "3.3.7"
+PREFERRED_VERSION_u-boot_beagleboard = "2012.04.01"
+
 # Pin down udev version from oe-core, as meta-oe pulls in newer systemd-enhanced version
 PREFERRED_VERSION_udev = "164"
 PREFERRED_PROVIDER_udev = "udev"
-- 
1.7.0.4


