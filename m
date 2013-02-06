Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f170.google.com (mail-ob0-f170.google.com
	[209.85.214.170])
	by arago-project.org (Postfix) with ESMTPS id 10936529D3
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 02:28:06 +0000 (UTC)
Received: by mail-ob0-f170.google.com with SMTP id wc20so960723obb.15
	for <meta-arago@arago-project.org>;
	Tue, 05 Feb 2013 18:28:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=CZu/Drg2bz7hSekxFG2LUHYlSPJGIgNc1s0IJv12zL8=;
	b=FbBmlBtcVBkJXRqbWU9HgMe+xoaZmuNVH3HoWAWdv8HXbH0riF0SaQmL9ljGhDjlhd
	6LorPyVB+44tI4NTcXop7t6P9Br9u/iHUyzTEYCRBQP5uwT0legwY0iuT8cjsWkjqgmI
	LvQk6QQ6wocjAIYwVnekTW4qINIF4mzGjo7G6RC7bUvT2jNHiorAEvtNHiNRwtVAb2yL
	bXDnL4PJXSCAGzyHJXIsnYAYBYeoFBj1pnCaAasUMIkt98Lxkzm702H2338nv7vp4uxO
	0f211N2kj8JzHdU5oOX//qs/3QtS5aASf2yqWEa8Rx8qoK8x7Jpz2OxpvIyqLseEqiCN
	YWeQ==
X-Received: by 10.60.8.40 with SMTP id o8mr19755484oea.112.1360117684895;
	Tue, 05 Feb 2013 18:28:04 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm3307205oeh.8.2013.02.05.18.28.02
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 18:28:03 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2013 20:27:55 -0600
Message-Id: <1360117678-4395-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/4] php: Rename bbappend to match recipe in meta-oe
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
X-List-Received-Date: Wed, 06 Feb 2013 02:28:07 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/php/php_5.3.19.bbappend       |    6 ++++++
 .../recipes-devtools/php/php_5.3.6.bbappend        |    6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)
 create mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
 delete mode 100644 meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend

diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
new file mode 100644
index 0000000..4c3fd39
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/php/php_5.3.19.bbappend
@@ -0,0 +1,6 @@
+# look for files in this layer first
+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
+
+PR_append = "-arago0"
+
+SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
diff --git a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend b/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
deleted file mode 100644
index 4c3fd39..0000000
--- a/meta-arago-distro/recipes-devtools/php/php_5.3.6.bbappend
+++ /dev/null
@@ -1,6 +0,0 @@
-# look for files in this layer first
-FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
-
-PR_append = "-arago0"
-
-SRC_URI_append_virtclass-native = " file://0001-php-native-Fix-host-contamination-issue.patch"
-- 
1.7.0.4


