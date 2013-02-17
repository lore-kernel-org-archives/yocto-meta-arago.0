Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f177.google.com (mail-ye0-f177.google.com
	[209.85.213.177])
	by arago-project.org (Postfix) with ESMTPS id A60F852A1D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:33 +0000 (UTC)
Received: by mail-ye0-f177.google.com with SMTP id m14so917028yen.36
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=wLCXkNYSPErjByhc6pb9zmR8nMVxUVDwFyraUvPDVvE=;
	b=UiznoOdUIyPCyfv8Y3UXLfxRyJSqScPNVMG/KmSO/xU8zVnBox6sDbgF6wzdVOsRcu
	zqkUsWqqZqp3h58okQX6Ui+SWBLbjloxcZurBYIcQW5WcWqX8Xtg9WFw452aEFMu631f
	6adKFIZFAMd479BDsjTIn/MTz9C9EGuXh1hzE59tn7AofO8B9wRQSRmtaAuGaswZFrzp
	BpRkKsaLOiqb8C8Fz37WSXKqCcM6imcCMEhBJLFgxTemtXLCzh8I8ycZDhvJhlL87y14
	iluC6bn5uKER+D9XBycvbw09xo57TfILOdYZLzHPnycYTrHN7VGuktORKED+1aL9u/qg
	HK7g==
X-Received: by 10.236.172.39 with SMTP id s27mr17295073yhl.10.1361141613368;
	Sun, 17 Feb 2013 14:53:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.31
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:32 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:01 -0600
Message-Id: <1361141595-1687-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 06/20] linux-omapl138-psp_2.6.37: Add sourceipk variables
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:33 -0000

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


