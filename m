Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 5188A529AB
	for <meta-arago@arago-project.org>;
	Wed,  5 Sep 2012 22:14:54 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so1207403obb.38
	for <meta-arago@arago-project.org>;
	Wed, 05 Sep 2012 15:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ME6Pf1w508zhqTAkcTGfFs1gUFgg7ouJ9+7w0CkU5+Y=;
	b=wc6IGGX7pCSei0qSav/dMniZVzS4K3+QH8hjoRxG6mBYCAgemxz1MYPqys2fkimrCe
	a6VlebRd6DQVQqWgWFj44o33TX2zOl6Kek/Vr1d6vdoBr2of3//jb2J6UpDPEGiahcrK
	rjhuzu3kgLa0LMAH9PepJKHRMKF3YA1Q7tqRvtuYToiRrMF1Zopc8T/aFo8g7EoysaOk
	hkIRnBmYiyttSuUYqQrOFLIVFDRCn1UnJTxIahux2PvqZ1+qDYPEehz3lFoEIN8HrH2Q
	7K0tYnK7M3RLx4V/fJng/U6XG5yVHqvxOeRTZeiwZwFgfU6uI1mZ8EiIA4Bov23zq6Z+
	Ighg==
Received: by 10.182.73.65 with SMTP id j1mr12151obv.42.1346883293263;
	Wed, 05 Sep 2012 15:14:53 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a6sm199155oeh.1.2012.09.05.15.14.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 05 Sep 2012 15:14:52 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  5 Sep 2012 17:32:16 -0500
Message-Id: <1346884336-3752-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH] freetype: Select GPLv2+ license
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
X-List-Received-Date: Wed, 05 Sep 2012 22:14:55 -0000

* Software library has a choice between Freetype or GPLv2+. Selecting
  GPLv2+.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../freetype/freetype_2.4.9.bbappend               |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-graphics/freetype/freetype_2.4.9.bbappend

diff --git a/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.9.bbappend b/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.9.bbappend
new file mode 100644
index 0000000..6641cb5
--- /dev/null
+++ b/meta-arago-distro/recipes-graphics/freetype/freetype_2.4.9.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+LICENSE = "GPLv2+"
-- 
1.7.0.4


