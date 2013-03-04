Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f52.google.com (mail-oa0-f52.google.com
	[209.85.219.52])
	by arago-project.org (Postfix) with ESMTPS id 5DDCE52ABD
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:45 +0000 (UTC)
Received: by mail-oa0-f52.google.com with SMTP id k14so9496686oag.25
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HNsbFeyb0edwLSzxjfbwnhxZw2DAspzI2mG+xgg4i6w=;
	b=lvnEp9dXISzSX7ar0h8sJ1hvF35Td71RBDQldboPal6PqtMarI3pY+hoDFeRjEhj2w
	VovxM/J3zS6N+7tzhPN87JUcQ0QJXDY1aPRWyifEGNGRSz2oEVSj5J5NpM6XUsYv8l/x
	qGnGTrcWwQdgpXKco+ODiiV9kBjdchfa6PVQVc7fioXttLXVIeInsuI04h/EYjh2DZRi
	tuKarxKhDEYl1X+hdCVu+GrimkD0LmsrcirW6+ccjgvJu7ZO3FdbSbsGkxf0tcINBElP
	uH2mgQtk+j0FnR6c19nUR5JzBCquGIf9TyUG6Tx4y2ADudLscByIRC3D937nE7BoqIFr
	tRCQ==
X-Received: by 10.60.19.161 with SMTP id g1mr16422047oee.101.1362427304817;
	Mon, 04 Mar 2013 12:01:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:43 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:24 -0600
Message-Id: <1362427289-18057-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/10] linux_3.3.7: Set sourceipk variables
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:45 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

---
 .../recipes-kernel/linux/linux_3.3.7.bbappend      |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend

diff --git a/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
new file mode 100644
index 0000000..6e1c92c
--- /dev/null
+++ b/meta-arago-distro/recipes-kernel/linux/linux_3.3.7.bbappend
@@ -0,0 +1,4 @@
+PR_append = "-arago0"
+
+require copy-defconfig.inc
+require setup-defconfig.inc
-- 
1.7.0.4


