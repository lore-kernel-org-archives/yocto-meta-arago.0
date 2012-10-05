Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 86025529B9
	for <meta-arago@arago-project.org>;
	Fri,  5 Oct 2012 06:26:11 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1323469oag.38
	for <meta-arago@arago-project.org>;
	Thu, 04 Oct 2012 23:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vtbMeEcE36gTiNOF5rWhKsqK6T09Z34F7w9kJt9q21Y=;
	b=VZidMli5eC+/y/xZFHniSNDVX9qyIssoD35Ete+/BjfpzKs2D4tg13bcm3Ay2WTdUc
	F6SryoGZ7P9P1rROEGvAQfvhu6c5zFKQ1x5VN0HbNjApkMlq4tVSHKrsrorS8lGbLJl3
	eM12kWv6QEQ8aYBHXBtUJS+rP0e21ADvUJzXWAMMbMFKzrt27v9Y7jqRGQqAm/BRJcts
	DSp5LTiUs2uEaqnPQpQacNjogZwqpeEW6wjIIV1x0xykCNJ4T9WOyfG3mgaEg9S56qGb
	u3RJ77L3jAAmTb2AXkZCv2iEGnVs8g+/wMCv7K3erk2JOxrSHqYH7UC66PL+WWOvuQiX
	UFWQ==
Received: by 10.60.5.129 with SMTP id s1mr6232374oes.85.1349418371035;
	Thu, 04 Oct 2012 23:26:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ig3sm8741028obb.0.2012.10.04.23.26.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 04 Oct 2012 23:26:10 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  5 Oct 2012 01:54:32 -0500
Message-Id: <1349420072-21985-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] gconf: Remove gtk dependency
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
X-List-Received-Date: Fri, 05 Oct 2012 06:26:11 -0000

* This patch mimics the patch "gconf: Disable gtk support" that has been
  applied to oe-core master branch. This patch can be removed once the
  patch mentioned above has been applied to the denzil branch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-gnome/gnome/gconf_3.2.3.bbappend       |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-gnome/gnome/gconf_3.2.3.bbappend

diff --git a/meta-arago-distro/recipes-gnome/gnome/gconf_3.2.3.bbappend b/meta-arago-distro/recipes-gnome/gnome/gconf_3.2.3.bbappend
new file mode 100644
index 0000000..ce85ced
--- /dev/null
+++ b/meta-arago-distro/recipes-gnome/gnome/gconf_3.2.3.bbappend
@@ -0,0 +1,14 @@
+PR_append = "-arago0"
+
+# The below changes are meant to mimic the patch
+# "gconf: Disable gtk support" commit 6facee8443966b646cd1e72f14ae13e58a13f621
+# The patch mentioned above has already been applied to master and has been 
+# requested to be pulled into denzil. The below changes can be removed once 
+# that patch has been applied to the denzil branch
+
+DEPENDS := "${@oe_filter_out('gtk+','${DEPENDS}', d)}"
+EXTRA_OECONF += "--disable-gtk"
+
+# Clear GTKOECONF variable to ensure gconf isn't configured to use gtk
+GTKOECONF = ""
+GTKOECONF_virtclass-native = ""
-- 
1.7.0.4


