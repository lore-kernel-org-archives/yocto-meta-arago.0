Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 2FFA9529D8
	for <meta-arago@arago-project.org>;
	Fri,  7 Sep 2012 17:29:10 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id eh20so4784053obb.38
	for <meta-arago@arago-project.org>;
	Fri, 07 Sep 2012 10:29:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=TdAXS5lOxuMQ7WR9lWPT7LJ/Mt3SalDxIFeV+VORDFY=;
	b=ZR8wJoJH/GlwdhfEbaJ1gGaBWEGtviMW4WR7uVrNsdjpBGnz/XCydhJmnMeNTjWjxf
	64XsC9SaVfToQxPt9yyt0x8p3dNtRpJcUbrdiKV5VJp+MtR0XUsXkcArMT9IlDJ/1PE4
	1BR7aeZDNY47KjfjMpyCYMhrYYGX8MY4+ktTWyrQqYz4sTqBiUlomy2s7X9xs/8twv5q
	7sxuqA9wrhF54MWBk/Vxj2u77TJ58BFd4AkXIrtxQGsFccEFYFhA7qCWY2y3sVBev9HP
	4rY+RGySDRDg8IlSfBKtXItvfvYfuFAbTf+NlNcd1z0F/E0wSPZod8kFfhXVdy64yMyf
	Cq5Q==
Received: by 10.182.110.40 with SMTP id hx8mr6987906obb.47.1347038950019;
	Fri, 07 Sep 2012 10:29:10 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a20sm4183815oei.2.2012.09.07.10.29.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 07 Sep 2012 10:29:09 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri,  7 Sep 2012 12:47:08 -0500
Message-Id: <1347040028-10047-2-git-send-email-fcooper27jr@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1347040028-10047-1-git-send-email-fcooper27jr@gmail.com>
References: <1347040028-10047-1-git-send-email-fcooper27jr@gmail.com>
Cc: "Franklin S. Cooper Jr" <fcooper27jr@gmail.com>
Subject: [meta-arago-distro][PATCH 2/2] pinmux-utility: Add temporary license file
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
X-List-Received-Date: Fri, 07 Sep 2012 17:29:10 -0000

* Add temporary license file to the pinmux-utility. This file was
  grabbed from the license agreement screen when installing the non
  am18x version of the pinmux utility. A proper license file needs to
  be added to the zip file that is apart of the offical pinmux utility
  release.

Signed-off-by: Franklin S. Cooper Jr <fcooper27jr@gmail.com>
---
 .../pinmux-utility/pinmux-utility_2.3.1.0.bb       |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
index 624ffae..fadbdc6 100644
--- a/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
+++ b/meta-arago-distro/recipes-arago/pinmux-utility/pinmux-utility_2.3.1.0.bb
@@ -1,6 +1,6 @@
 require pinmux-utility.inc
 
-PR_append = "-arago0"
+PR_append = "-arago1"
 
 SRC_URI = "https://gforge.ti.com/gf/download/frsrelease/815/5471/PinMuxUtility_v2_03_01_00.zip;name=base"
 
@@ -22,3 +22,8 @@ do_install_omapl138() {
 
 SRC_URI[omapl138.md5sum] = "5a4eb834bde44c662aaf669882adbfe6"
 SRC_URI[omapl138.sha256sum] = "6701ca0e91761b9eb80b0097fbb2e2ce2cd8e0bcdc0bd18c34cd0221d9d450d0"
+
+# Temporarily add LICENSE file here since zip files don't contain any license information. This file was grabbed
+# from the License Agreement screen when installing the non am18x version of the pinmux utility.
+SRC_URI += "file://LICENSE"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f400ac8ac09799ccf153aab40deff94"
-- 
1.7.0.4


