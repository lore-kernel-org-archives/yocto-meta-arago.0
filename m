Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f43.google.com (mail-oa0-f43.google.com
	[209.85.219.43])
	by arago-project.org (Postfix) with ESMTPS id 8A29E52A9E
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:37 +0000 (UTC)
Received: by mail-oa0-f43.google.com with SMTP id l10so9723206oag.16
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=N1ESSikIrtPxQd6u1qbqNbVrS9G9pCMHQj+49WA0WlQ=;
	b=bbylUwVmFJcc5pjpUBimAhv8p39bBgHxC5x1PH61iU/eIi7Ze7azHPU4m6Ov2Spxvx
	Pbj6ETwq86Rvl9f9NZNYHWdZ4jXzVCx2PUmD/vb+sKqdGk8bE4VOu5kwiLw33Zgvpxlm
	oDrMc6T/9NtBxfBlpwF7j4SnfEQtxMHFb3XQCEcbNpuC36M/s4OP+AosC30gatGGIWJU
	v6IkZaHudBCmXvPBkFcO9uqNSXGIDz8udpU2w0X/cql3QEymfyE8r10hx5pNI6wQaUDy
	jMrO7KKO6lEWnb2Egu7RD9gzIPeOm2o12J5+tlgdAgs09RUQyqlXMrJZAwc4aNRNqonG
	93vQ==
X-Received: by 10.182.221.105 with SMTP id qd9mr16504399obc.97.1362427296985; 
	Mon, 04 Mar 2013 12:01:36 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.34
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:35 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:20 -0600
Message-Id: <1362427289-18057-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 01/10] arago-source-ipk.conf: Adjust sourceipk for omap3 kernels
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:37 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* The kernel recipe for am3517 and am37x have been renamed to reflect the recipe
  name already in meta-ti.
* Tweak the sourceipk value to address this change.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index bc5ff59..88cd21d 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -116,9 +116,9 @@ CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-linux-omap3 = "1"
-SRCIPK_INSTALL_DIR_pn-linux-omap3 = "board-support/linux-${KVER}-psp${PSPREL}"
-SRCIPK_PACKAGE_ARCH_pn-linux-omap3 = "${MACHINE_ARCH}"
+CREATE_SRCIPK_pn-linux-omap-psp = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omap-psp = "board-support/linux-${KVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omap-psp = "${MACHINE_ARCH}"
 
 CREATE_SRCIPK_pn-linux-am335x = "1"
 SRCIPK_INSTALL_DIR_pn-linux-am335x = "board-support/linux-${KVER}"
-- 
1.7.0.4


