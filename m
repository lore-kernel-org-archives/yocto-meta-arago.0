Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id E0B5F529DD
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:22 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id o6so2974227oag.11
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=J87JD0hBU4ylA81k5aRHZ8a835kNKHDowZIA7o0nR8A=;
	b=XNtlHNZ5IzCJaCvGP1Cwbx+VMnCIpz/Xkh2DtfTmY1W9Gk4FfJfslFFLYjIRcvdVaQ
	mtn8t6nLhdTbY03iz0wAv/frGLxBvZwQ4FJKDM9PmGspNgHlvEfi3TJMJLfZGdpt1xCG
	0ucm2YBuLuc2GRbiOA/vZa2P4JK54COGCnhn9gBn7tB5Vwks+1sXjz19u8RZohnaoFwB
	uXOZcyGwBIc8JjCNqq7KvpL9MvMaWbmL9aYREuvxTD3llrsOyAcJFgCVHE7LWQed9CKh
	Uv4Pa1V7rGtndEFB/gfeh0sT5hry/pw/ScWZzJ9Cl9t2tQiyhPOuWmOKG6YNGEOC7+ww
	i68A==
X-Received: by 10.182.40.106 with SMTP id w10mr4491763obk.85.1358445201775;
	Thu, 17 Jan 2013 09:53:21 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.19
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:20 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:04 -0600
Message-Id: <1358445195-22441-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/12] busybox: Enable telnetd
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:23 -0000

* Enable telnetd to allow someone to connect to the target device via telnet

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 31fbec2..f681eb7 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -810,8 +810,8 @@ CONFIG_TCPSVD=y
 CONFIG_TELNET=y
 # CONFIG_FEATURE_TELNET_TTYPE is not set
 CONFIG_FEATURE_TELNET_AUTOLOGIN=y
-# CONFIG_TELNETD is not set
-# CONFIG_FEATURE_TELNETD_STANDALONE is not set
+CONFIG_TELNETD=y
+CONFIG_FEATURE_TELNETD_STANDALONE=y
 # CONFIG_FEATURE_TELNETD_INETD_WAIT is not set
 CONFIG_TFTP=y
 CONFIG_TFTPD=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index 35b1243..b2d2540 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago3"
+PR_append = "-arago4"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


