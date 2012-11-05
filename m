Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id E75E152A9A
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:18 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=cp9px8BsP5ZICLTcOl6qnjV7CnPip80ekMYffQbCwRE=;
	b=ZSf/8MYk4opg7KTyV6ilAM85svCsabCxBug1aYqwAP+dgwRoVjaLB4VnDKPa7+1sZO
	pTvc8EiO6Xh6SbFwGz/n3ZL8GIJDxjx7NezhaBJ8D9b4o7tXxQTHACEkO3/NoybDoR4z
	mkX5xrKCqJPNJVpa5HVbq44HSwA2amrAfa4bcdhoG6eLF51JVfShKomge0e0fgSHNcHR
	AwwRmZ1+A7TwVHzzrShHsW/+Yz0eHJe9uQlVgYF/81h5axUKj0NTMheQ5JimBCQBFQnl
	a0ETpsQhnF7fCyWDKshMHibzUDK1gophwOphhL5tUlrS9ynbonYmgH0HqyrLkPcFJJ/3
	ymUQ==
Received: by 10.182.108.69 with SMTP id hi5mr6917708obb.43.1352080458651;
	Sun, 04 Nov 2012 17:54:18 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:18 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:23 -0600
Message-Id: <1352080417-9792-26-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 28/42] qt4-embedded-gles: Add append to include arago-qt4.inc
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:19 -0000

* Use the arago-qt4.inc file to pick up some of the shared qt4-embedded
  tweaks.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../qt4/qt4-embedded-gles_4.8.0.bbappend           |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend

diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend
new file mode 100644
index 0000000..f9e5810
--- /dev/null
+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-gles_4.8.0.bbappend
@@ -0,0 +1,3 @@
+require arago-qt4.inc
+
+PR := "${PR}.0"
-- 
1.7.0.4


