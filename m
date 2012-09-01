Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 1C4D4529A1
	for <meta-arago@arago-project.org>;
	Sat,  1 Sep 2012 18:06:18 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so6986403obb.38
	for <meta-arago@arago-project.org>;
	Sat, 01 Sep 2012 11:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=KU0Hg7XJ4nO7KjkYbvVWzC3u7gcNpsJ9tHid7cSsWVo=;
	b=vM0iRgOFf4hG7Rn7o+UwW9q96aDxedIiuyn/K2MTbrrIg8nnCreo5FJvG5swIfPMHY
	xIyrWORDDTwKFQOY1qObyA8C6BP+wLE9c8o900hswuK87aGQ6UYswJh6obXsrQhngJ2u
	0oOkwfH0uwMZuSOQc5+gka2lyIc5gvYpwNPnZJyDJg818xcjt397ZdMZtC5ooe178Bxd
	CEzjcPEDJO6pIxFqBOQoGW9aMa9R3oXXYbIthNLzci3ZzkjZg7w1HGDcLOI65QB3SD/3
	eyrPUMIGtKySHlCzm2aT4KmQqJtQkKHS+tRD9PAgd/KCpJmeZSPNk36RKCsToXrTASY7
	BJCg==
Received: by 10.60.8.67 with SMTP id p3mr10952581oea.128.1346522777384;
	Sat, 01 Sep 2012 11:06:17 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id jl8sm7138734obb.18.2012.09.01.11.06.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 01 Sep 2012 11:06:16 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sat,  1 Sep 2012 13:22:07 -0500
Message-Id: <1346523727-332-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH] recipes: Revert temporary compiler fixes
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
X-List-Received-Date: Sat, 01 Sep 2012 18:06:18 -0000

* Several commits were made due to issues with an external linaro toolchain.
  Until these issues are resolved we are switching to the external toolchain
  used in arago. Therefore, these temporary fixes are no longer needed.

Revert "libatomics-ops: Fix compiler error message (Temporary)"

This reverts commit 6bc795a800fbd9bb26655b156e39945e059ed0ae.

Revert "tremor: Fix compiler error message (Temporary)"

This reverts commit ee2a70d55bcb72c9bc5df1540b894cdbcd48f3d3.

Revert "postgresql: Fix compiler error message (Temporary)"

This reverts commit 56d541690539dd0e5f8e15760d0544430fb833a4.

Revert "tremor: correct the previous fix to properly pass the flags to assembler"

This reverts commit 315725a4e11954a455f92378099829d390889fc3

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pulseaudio/libatomics-ops_1.2.bbappend         |    3 ---
 .../tremor/tremor_20120314.bbappend                |    3 ---
 .../postgresql/postgresql_8.4.7.bbappend           |    3 ---
 3 files changed, 0 insertions(+), 9 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
 delete mode 100644 meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend
 delete mode 100644 meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend

diff --git a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend b/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
deleted file mode 100644
index 4c60634..0000000
--- a/meta-arago-distro/recipes-multimedia/pulseaudio/libatomics-ops_1.2.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago0"
-
-EXTRA_OEMAKE += "-mimplicit-it=thumb"
diff --git a/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend b/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend
deleted file mode 100644
index 74afa9d..0000000
--- a/meta-arago-distro/recipes-multimedia/tremor/tremor_20120314.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago1"
-
-EXTRA_OEMAKE += "CFLAGS+='-Wa,-mimplicit-it=thumb'"
diff --git a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend b/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
deleted file mode 100644
index 4c60634..0000000
--- a/meta-arago-distro/recipes-support/postgresql/postgresql_8.4.7.bbappend
+++ /dev/null
@@ -1,3 +0,0 @@
-PR_append = "-arago0"
-
-EXTRA_OEMAKE += "-mimplicit-it=thumb"
-- 
1.7.0.4


