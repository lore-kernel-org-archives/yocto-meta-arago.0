Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id F2A3252A0E
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 21:05:16 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1952029oag.38
	for <meta-arago@arago-project.org>;
	Wed, 07 Nov 2012 13:05:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=83xU+emsvkPN64CvA4UEA6X71+AZU74mYJKpqG6tRGg=;
	b=zTecsjdRswJLXCVtdUFZDeOLl0GGltJZwOmHm+3Dnti8LnbXI7QlHkI0V16I3SSnwz
	5t2VYGnKyL23OWmnLHjEDLNB+Mg31ymkssEpCJKUNT5RiQ+tCWsqSHvZny8kIrEdix+y
	9ztiADD9rpbOB2cHHbI//ZxwjpkjzK5yRVM79i4pCTEy+eHOn6/N9r/smuiSdhMpx71c
	pCXc3hwQwIxC8mF38RoA7Lc/VOKFBc9ennFQIPjX3JRBbR3IJj74ukGvk2O6nzrCzyjS
	hRT0PiBYQZ4rXOGDsRWgSNp1/JoWO+NckhkhvWrVNB89JAU9A76dcF0cOh3Q8DB1WUSw
	GvNQ==
Received: by 10.60.31.135 with SMTP id a7mr3042246oei.26.1352322316302;
	Wed, 07 Nov 2012 13:05:16 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id
	nd14sm24647558obb.14.2012.11.07.13.05.15
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Nov 2012 13:05:15 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Nov 2012 15:05:11 -0600
Message-Id: <1352322311-11941-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] shadow-securetty: Allow remote telnet login as root
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
X-List-Received-Date: Wed, 07 Nov 2012 21:05:17 -0000

* Need to add pts/X to the securetty file to allow remote login via telnet as root

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../shadow/shadow-securetty_4.1.4.3.bbappend       |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend

diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
new file mode 100644
index 0000000..a09c514
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
@@ -0,0 +1,15 @@
+PR_append = "-arago0"
+
+do_install_append () {
+    # Allow telnet sessions to login as root
+    securetty_file=${D}${sysconfdir}/securetty
+
+    printf '\n' >> $securetty_file
+    printf '# Allow 5 telnet login\n' >> $securetty_file
+    printf 'pts/0\n' >> $securetty_file
+    printf 'pts/1\n' >> $securetty_file
+    printf 'pts/2\n' >> $securetty_file
+    printf 'pts/3\n' >> $securetty_file
+    printf 'pts/4\n' >> $securetty_file
+
+}
-- 
1.7.0.4


