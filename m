Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 4ED165208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:11 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=zOHvRrRF3ewwlbIi4sTmQbLt4QyjLZh5IM5qAqTKNec=;
	b=Das577sZSB6EhXTsb92DWo4sRSBb3HWuOf/EyCyF5YTLx9OYfLhutHiQ4/jxfsA9bs
	Ffi6GMV35XiL/uWlqbpB8EbgEbeAQp4o8wTbzZUJfztz4QsxIJnZXIodKnoB8Qen1/Y7
	7nLF64Zn9EAsjTR/WL6yshgra+ex5YRC9FETkgNJxdol544VzrrFUI5e5KoLYjGNyo+B
	mHuqbCsgr4uLV2qLH5mcaaeAgP8VEQwUexHtqslZlozCXprGNiW9dZmc6JtOVP/TZPmN
	vQ4XI4RmSn/5S5kQWhfvHQ/QGD1t7UwPoyVrTkGcgxCRu/89ZJGPqoEXeeH5Y5IVLyPj
	sLRA==
Received: by 10.60.7.73 with SMTP id h9mr6838912oea.13.1352080451012;
	Sun, 04 Nov 2012 17:54:11 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:10 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:15 -0600
Message-Id: <1352080417-9792-18-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 20/42] task-arago-toolchain-tisdk-target: Add task-arago-toolchain-tisdk-target
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:12 -0000

* This task is used to group up all the various sdk-target tasks to enable SDK
  users to build applications using libraries that are included in the SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-toolchain-tisdk-target.bb     |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
new file mode 100644
index 0000000..ef1a803
--- /dev/null
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-toolchain-tisdk-target.bb
@@ -0,0 +1,14 @@
+DESCRIPTION = "Task to build and install header and libs into the sdk"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+PR = "r0"
+
+inherit task
+
+RDEPENDS_${PN} = "\
+    task-arago-qte-toolchain-target \
+    task-arago-tisdk-multimedia-sdk-target \
+    task-arago-tisdk-connectivity-sdk-target \
+    task-arago-tisdk-crypto-sdk-target \
+    task-arago-tisdk-graphics-sdk-target \
+"
-- 
1.7.0.4


