Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 36DBD529AB
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 15:12:34 +0000 (UTC)
Received: by obbeh20 with SMTP id eh20so4521973obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 08:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=XIkvZuWBst/KFa0JJNrkColIDfm1b8f4j3JshduOUu0=;
	b=Fbx+cQxW0bJb54xXohNy15XtRVRgMTVtS5G2lzZwLb98yFQhhLdjzZ+SWkCQdsGUFY
	fg0WvDQpOyiZrrxi+NqFYYOa/jMEK8dsjGJNpvvo2v+DG6t57mb58Y3eN4oedQl/OduN
	6QzTnhUm+vYcwGsEDr1ndfjxvYFQ5+T2UCFFypypfBAvz+mKFcjAM3W+kmWd0yputQ7/
	3+gDs5QUI92QqDeMISr17TEHdYX9PFt9IL1nvafyoqp+QhQhto0kG5G4SLziB+3KaT7g
	VrOAX/cyRY3ghD47BSrwXgLwdMq5kBU9/wENqfBgXjUvw4F4NvRXWhT/RejvztclipTV
	H42Q==
Received: by 10.60.7.104 with SMTP id i8mr6336653oea.31.1347030753136;
	Fri, 07 Sep 2012 08:12:33 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id l10sm3943390oeb.13.2012.09.07.08.12.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 08:12:32 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 10:30:33 -0500
Message-Id: <1347031833-6602-1-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH] canutils: Add error frame's handling.
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
X-List-Received-Date: Fri, 07 Sep 2012 15:12:35 -0000

* Update the TAG used to include additional patches that add additional error
  capabilities not found in the latest release of canutils.
* This patch was base on a similar patch from arago.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../socketcan/canutils_4.0.6.bbappend              |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend

diff --git a/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend b/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
new file mode 100644
index 0000000..63b72ca
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/socketcan/canutils_4.0.6.bbappend
@@ -0,0 +1,8 @@
+# Take the top of the tree which is currenlty 4.0.6 plus two patches.
+# One of the patches adds error message support which is what we want
+TAG = "bab595e38295dcafcfc17a011d3d51f2df1618e6"
+
+# Set the PV to 4.0.6 plus the commit id
+PV = "4.0.6+gitr${SRCPV}"
+
+PR_append = "-arago0"
-- 
1.7.0.4


