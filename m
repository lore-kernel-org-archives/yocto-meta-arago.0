Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 1D6E052AA4
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:15 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n12so4434455oag.13
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wLCXkNYSPErjByhc6pb9zmR8nMVxUVDwFyraUvPDVvE=;
	b=hLf/wj1ClRiJbUJhpwalHr7Ocly92KIDJzTIvWq3BJrhEzV/tPo1O+1a3jSXiTtNRR
	CTtvpRhti0doynpaQTWeUv5Wnl0Sj+//SGU+/1GFwNzbtOOePyBhVIEdj1P/86MpTXi/
	x3X1FouWxMHAYoL6AgnIfp1PkGiubf4O6HAhcT0Z/2oB4HyDbVx+Viq5IsbsXODZAlpI
	ifJXgyv7PHWY3rY+aRCImuJCV59HPekPK4R5SxXy4NDUYUCRzX0HuHOd6SyJlZl/fmPm
	tqYLgTTIK0qgubA/7r2NOXov0t4MBZn0Ne5HqU+CyA9vE/sJn9ayMbKgED89gPxtWNYQ
	qWgg==
X-Received: by 10.60.172.198 with SMTP id be6mr161503oec.20.1361849594223;
	Mon, 25 Feb 2013 19:33:14 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.12
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:13 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:52 -0600
Message-Id: <1361849574-7710-8-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 08/10] linux-omapl138-psp_2.6.37: Add sourceipk variables
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:15 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Set variables for sourceipk
* Add empty file to disable multikernel stuff

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../linux/linux-omapl138-psp_2.6.37.bbappend       |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp-2.6.37/am180x-evm/configs/empty
new file mode 100644
index 0000000..e69de29
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
new file mode 100644
index 0000000..e8b0606
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-omapl138-psp_2.6.37.bbappend
@@ -0,0 +1,10 @@
+MACHINE_KERNEL_PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${P}:"
+
+# KVER is used by arago-source-ipk.conf
+KVER = "2.6.37"
+PSPREL = "03.21.00.04.sdk"
+
+require copy-defconfig.inc
+require setup-defconfig.inc
-- 
1.7.0.4


