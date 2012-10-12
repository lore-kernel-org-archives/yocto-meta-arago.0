Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id B5FD952A70
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:08:47 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2441184obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vx+722wNWmiOBfZFdKYy65q6NSZHNtOZQRThIbbaLvY=;
	b=vbeRJA8Kt9+lyf8J1j6zDef/D8W0bMu31An2lZW0ORCpsYROFSXsgPMgpu7sD7eP2L
	extvCrEaXuwbq429zPnCQnzYT7Wh2ar0qAWOq6Pknv2qFCObyHPejoV38wX7X1LzPg2j
	d7wpskkl45PMaMeosenSJiGwHhYD3yoxQIVpPY2vyYUCCFCQa2qSUdojOgLbAqPw9Sco
	IJ2APZfVdJFiy0eWfiSoP3gQUk/oqQnDljswIhpZDyd+xYE42slPcB+d/+CJTZwyMrhj
	j1MKCTZrbDTvJ0G5VcNqRD7VTlGKF/mOXU6LyEuE5OSjNOV3FMWUDU+aq0d3bUSIwV8f
	Jh5w==
Received: by 10.182.51.65 with SMTP id i1mr2587670obo.45.1350018527203;
	Thu, 11 Oct 2012 22:08:47 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id f3sm2976349obz.8.2012.10.11.22.08.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:08:46 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:39:38 -0500
Message-Id: <1350020378-11548-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] linux-am335x: Add Arago tweak to linux-am335x recipe
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
X-List-Received-Date: Fri, 12 Oct 2012 05:08:48 -0000

* Append linux-am335x recipe to use both the setup-defconfig and
  copy-defconfig include files.
* Add KVER variable which is used by the sourceipk class.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../defconfig                                      |    1 +
 .../linux-am335x_3.2.0-psp04.06.00.08.bbappend     |    9 +++++++++
 2 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig
new file mode 100644
index 0000000..f8cbc03
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x-3.2.0-psp04.06.00.08.sdk/defconfig
@@ -0,0 +1 @@
+use-kernel-config=am335x_evm_defconfig
diff --git a/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
new file mode 100644
index 0000000..3f7b524
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux-am335x_3.2.0-psp04.06.00.08.bbappend
@@ -0,0 +1,9 @@
+PR_append = "-arago0"
+
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+# KVER is used by arago-source-ipk.conf
+KVER = "${PV}"
+
+require copy-defconfig.inc
+require setup-defconfig.inc
-- 
1.7.0.4


