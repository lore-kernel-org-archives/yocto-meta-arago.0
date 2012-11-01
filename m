Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 9FBE3529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:43:21 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2655995oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=vF3VRMeIODRXKwaT66SmcdcadxgiR5CFTnUzGcMWc6Y=;
	b=ctUScDIkysOkQGhf4Te11kH6bRlhseC07HrLVGOtwWKc6khvv0ZfEVLq3VajKP6zuP
	E7pq6QwY4ZyxnyLkpSLpt057TJC0AXRilYNZBL+1mW1HmEbxAcPkiMXmQ4cyV7sXKWs5
	ReMttBlLdHHOFMyye5V9Ve+Yr35cI+XSvDkMAmq3yhmCdj10NrjPYZVPun+rN1ilcnve
	1qmK2gcQ3tut1LO/0iS+xkkdARS1YXJoiTEkfl8bHRlcVNfHH4Nqjxpp8U72MvaSeolm
	LfORlax03Mx+LR5GtUtombHN3vSdw0XDKkSV/I6g8Wb7oKFC228GwA6zvRKNjLu8yR0D
	5ngA==
Received: by 10.60.31.241 with SMTP id d17mr34951473oei.107.1351795401098;
	Thu, 01 Nov 2012 11:43:21 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ig3sm6979996obb.0.2012.11.01.11.43.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:43:20 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:43:16 -0500
Message-Id: <1351795396-5146-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] meta-toolchain-arago-tisdk: Add Arago SDK specific toolchain recipe
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
X-List-Received-Date: Thu, 01 Nov 2012 18:43:21 -0000

* Add a meta toolchain recipe that builds on top of meta-toolchain-arago-qte
  but includes components and tasks specific to the Arago SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../meta/meta-toolchain-arago-tisdk.bb             |   18 ++++++++++++++++++
 1 files changed, 18 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
new file mode 100644
index 0000000..17f3966
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -0,0 +1,18 @@
+require recipes-core/meta/meta-toolchain-arago-qte.bb
+
+TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-tisdk-target"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-sdk-${SDK_ARCH}"
+
+PR = "0"
+
+toolchain_create_sdk_env_script_append() {
+    echo -e 'export CPP="\x24{TARGET_PREFIX}gcc -E"' >> $script
+    echo -e 'export NM=\x24{TARGET_PREFIX}nm' >> $script
+    echo -e 'export RANLIB=\x24{TARGET_PREFIX}ranlib' >> $script
+    echo -e 'export OBJCOPY=\x24{TARGET_PREFIX}objcopy' >> $script
+    echo -e 'export STRIP=\x24{TARGET_PREFIX}strip' >> $script
+    echo -e 'export AS=\x24{TARGET_PREFIX}as' >> $script
+    echo -e 'export AR=\x24{TARGET_PREFIX}ar' >> $script
+    echo -e 'export OBJDUMP=\x24{TARGET_PREFIX}objdump' >> $script
+    echo 'export PKG_CONFIG_ALLOW_SYSTEM_LIBS=1' >> $script
+}
-- 
1.7.0.4


