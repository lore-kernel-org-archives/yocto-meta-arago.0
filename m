Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by arago-project.org (Postfix) with ESMTPS id AB61B529E1
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:30 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j1so1067116oag.29
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=KWYu5429cEMagentDVnLod4qT1TryJsB0WLWpVzQAgA=;
	b=SA9EWS5jTCt0i2Xx4oS2zVPAcox6tMDIafqqz0B2Z8ZoW7N7Cj3nX97p7no5MZ/8gJ
	qiBIZ/eR2oUNwPG0u2A6HFiwknllg4LrdBKnD2N3DZZYolp/wY6sXsJg8WoXyYpbAWx7
	VDWIahXJXzZqUMnw9v3DvZXsF8DoeGPfJmz1x63nB0C44LxWqfh/lJAfAlbIqqCtz88X
	3aXdwhj4hZoJWdOEdOsixqDfTqmEMMvz+zHgOROTgTbkY1Pvi0wIbsAx+Ue0SSIXjdv+
	EvhcJkZVaSizZ6PBg/wD0k2WpX4obJfXkwCaN+/g17DHCCVnZmnYGFcddT5KcxqF4PcD
	kz8Q==
X-Received: by 10.182.11.99 with SMTP id p3mr5729801obb.24.1359151110049;
	Fri, 25 Jan 2013 13:58:30 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:29 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:53:58 -0600
Message-Id: <1359150851-23602-17-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 18/31] linux-am335x: Update to latest am335x PSP kernel
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:30 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* This version corresponds to the official PSP release
---
 .../linux/linux-am335x_3.2.0-psp05.06.00.00.bb     |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
index 711103b..53ed93a 100644
--- a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp05.06.00.00.bb
@@ -25,11 +25,12 @@ DEPENDS += "am33x-cm3"
 KERNEL_IMAGETYPE = "uImage"
 
 # The main PR is now using MACHINE_KERNEL_PR, for ti33x see conf/machine/include/ti33x.inc
-MACHINE_KERNEL_PR_append = "b+gitr${SRCPV}"
+MACHINE_KERNEL_PR_append = "c+gitr${SRCPV}"
 
 BRANCH = "v3.2-staging"
 
-SRCREV = "${AUTOREV}"
+#This SRCREV corresponds to tag v3.2_AM335xPSP_04.06.00.09-rc2
+SRCREV = "b701b5e2e6c09b8d19bc706af3af85a11018fd23"
 
 SRC_URI = "git://arago-project.org/git/projects/linux-am33x.git;protocol=git;branch=${BRANCH} \
            file://defconfig \
-- 
1.7.0.4


