Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id E149C529A4
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 15:14:31 +0000 (UTC)
Received: by obblz20 with SMTP id lz20so1291270obb.38
	for <meta-arago@arago-project.org>;
	Tue, 25 Sep 2012 08:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=e69F0pLzwAxixq6rFSdRDEZbSavMqzj3q/QDOhNvegI=;
	b=u6eNjtPWYMvHYLMidZzTu0TF9CGOOKdHDUlQkInZCdQ8g1W177r6LGN1Vu5UMMMwF0
	M798m+qX8g/K8esoveDNHLGfVrCsdnIWIKwkK4DAh/OSFE5WkFqlmW3GRqYgdO7AyT2m
	sTwxHtV4xh9vcKijXk7tKhQ6OqIqNWJ/t+eRgBSVrGurHc58dQ8zjs8lFh7eSAqWFhsW
	IYbKmxPWDyxzod91Wr5lCPZ2JsZOcU+jyE+/CdkBn0a+uZt5hUSslMRF8mbhLB4NR7TW
	YDVjPi928+phpNDyPXYGDJ4BU/yFfRy02wc8CdufImzxTO9I8wYOwjqN1aaEPRjycM0J
	5Lig==
Received: by 10.182.152.36 with SMTP id uv4mr12475350obb.81.1348586071372;
	Tue, 25 Sep 2012 08:14:31 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm453897obi.22.2012.09.25.08.14.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 25 Sep 2012 08:14:30 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue, 25 Sep 2012 10:39:10 -0500
Message-Id: <1348587550-25528-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH] eventdump: Port eventdump tool
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
X-List-Received-Date: Tue, 25 Sep 2012 15:14:32 -0000

* Port eventdump tool from arago

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-devtools/eventdump/eventdump_git.bb    |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb

diff --git a/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
new file mode 100644
index 0000000..57996b3
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/eventdump/eventdump_git.bb
@@ -0,0 +1,15 @@
+DESCRIPTION = "Utility for parsing system events"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://eventdump.c;beginline=1;endline=34;md5=23b59be24a88ddc407b553035f3fd3e9"
+
+PR = "r0+gitr${SRCREV}"
+
+SRCREV = "5db45a36a05a78ea44a4cb25312ed5ee3c2bd76d"
+
+SRC_URI = "git://github.com/TI-ECS/eventdump.git;protocol=git"
+
+S = "${WORKDIR}/git"
+
+do_install() {
+	oe_runmake 'DEST_DIR=${D}' 'BIN_DIR=${bindir}' install
+}
-- 
1.7.0.4


