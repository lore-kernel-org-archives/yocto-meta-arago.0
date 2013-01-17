Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f44.google.com (mail-oa0-f44.google.com
	[209.85.219.44])
	by arago-project.org (Postfix) with ESMTPS id 62CEC529E1
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:35 +0000 (UTC)
Received: by mail-oa0-f44.google.com with SMTP id n5so2942299oag.17
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FKC9Z+iSM8y7qQgRILvtgYwKBD4WxKFsMlXJlU+1t8I=;
	b=w9CIE6nb0wGO7rVeMLdlE0bJROGw9uHHHrobWZVeGUc39QWx2YqCP24yrC8jgJpAmn
	XSoLXjKgXklkv2QoADQZY9X5T0bHhZD58M2G1AVHF8Q0TX2REDIFb1WffigBDUrWpZaZ
	X1j+4bQC/jLuaF8W2AG8ubDDeaulHclIxX15SjZfhhozxZw8m3h9CoyKylXespli1YnW
	q1kVL+fjC26BHAGRN2gwBxqPHPLvTWj9QcY0EOKcgBW9LhjxREKNsEC/ep58Noh0l/Ui
	u4D41Pw3eFJw0FtlN/8Lt6KykOKraya8rAtTT2UPtrMEqU0v3eusEZIVUV5VlyOKuc4U
	Ijzw==
X-Received: by 10.60.30.201 with SMTP id u9mr4733831oeh.28.1358445214671;
	Thu, 17 Jan 2013 09:53:34 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.23
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:33 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:06 -0600
Message-Id: <1358445195-22441-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 03/12] shadow-securetty: Allow remote telnet login as root
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:35 -0000

* Need to add pts/X to the securetty file to allow remote login via telnet as root

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../shadow/shadow-securetty_4.1.4.3.bbappend       |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend

diff --git a/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
new file mode 100644
index 0000000..0f997ad
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/shadow/shadow-securetty_4.1.4.3.bbappend
@@ -0,0 +1,15 @@
+PR_append = "-arago0"
+
+do_install_append () {
+    # Allow telnet sessions to login as root
+    securetty_file=${D}${sysconfdir}/securetty
+
+    echo '' >> $securetty_file
+    echo '# Allow 5 telnet login' >> $securetty_file
+    echo 'pts/0' >> $securetty_file
+    echo 'pts/1' >> $securetty_file
+    echo 'pts/2' >> $securetty_file
+    echo 'pts/3' >> $securetty_file
+    echo 'pts/4' >> $securetty_file
+
+}
-- 
1.7.0.4


