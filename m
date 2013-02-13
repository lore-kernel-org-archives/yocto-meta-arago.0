Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id 575A552AC9
	for <meta-arago@arago-project.org>;
	Wed, 13 Feb 2013 00:06:41 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so735162oag.12
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 16:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=75W6ZuvSr26AOKbV5XoH6SxLt0ozV24W5NtWbHIbma8=;
	b=hlWJhLuFz0mqZ/KqHf2N8D3B7rbOkiDkBTnaBaodumIrXtlYKCvoQALImD218HkpfP
	HUTOAETDUDpZnCt0lXISQ3OAipTlmT/Z00wactjbvYc/7g6FvA1IAKfz3BqGFppmg5gn
	zByNfb4GIuuRvCy6jBwz/C/j+91o6DyjnX+6AgeK3O1HJLcYJpq5+W9aBPVF1Gfry94C
	Nw/mX0x/euW7Cntsl9yf9p83kKs7KLPjcqh6W3A8QqqlAo0Ut/beoEybn9ttWuWXdN2o
	8iPlTtZy2g5wVh+31mlA+BZyzyyLk7pNWI/XjeLJzhizS2EyVBIaVMfxpsP+oP4LtZJP
	Xvjw==
X-Received: by 10.182.40.71 with SMTP id v7mr14689394obk.85.1360714000510;
	Tue, 12 Feb 2013 16:06:40 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id rn9sm54901953obb.11.2013.02.12.16.06.38
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 12 Feb 2013 16:06:39 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Tue, 12 Feb 2013 18:06:34 -0600
Message-Id: <1360713994-18064-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] Workaround oe-core/scripts/bitbake bug
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
X-List-Received-Date: Wed, 13 Feb 2013 00:06:41 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* There is a bug in the oe-core/scripts/bitbake script that causes a
  infinite recursive call.
* This issue is due to the oe-core/scripts/bitbake method of temporarily
  removing any layer's scripts directory from the system PATH variable.
* As of right now only one instance of a layer's scripts directory is removed
  from the path since only oe-core contained a scripts directory. This caused a
  problem when meta-arago added a scripts directory which revealed this problem.
* Detailed information and my proposed fix can be found here:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=3872
* For now rename scripts to arago-scripts to get around this problem until a
  proper fix is committed in oe-core.
---
 {scripts => arago-scripts}/relocate_sdk.py         |    0
 .../recipes-core/meta/meta-toolchain-arago.bb      |    2 +-
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename {scripts => arago-scripts}/relocate_sdk.py (100%)

diff --git a/scripts/relocate_sdk.py b/arago-scripts/relocate_sdk.py
similarity index 100%
rename from scripts/relocate_sdk.py
rename to arago-scripts/relocate_sdk.py
diff --git a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
index b75583b..863e0ef 100644
--- a/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
+++ b/meta-arago-extras/recipes-core/meta/meta-toolchain-arago.bb
@@ -77,7 +77,7 @@ fakeroot create_sdk_files() {
 	# Add version information
 	toolchain_create_sdk_version ${SDK_OUTPUT}/${SDKPATH}/version-${REAL_MULTIMACH_TARGET_SYS}
 
-	cp ${ARAGOBASE}/scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
+	cp ${ARAGOBASE}/arago-scripts/relocate_sdk.py ${SDK_OUTPUT}/${SDKPATH}/
 
 	# Replace the ##DEFAULT_INSTALL_DIR## with the correct pattern.
 	# Escape special characters like '+' and '.' in the SDKPATH
-- 
1.7.0.4


