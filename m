Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 58C2852AB0
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:49 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id l10so2895757oag.22
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=/5mYRt0OMqVWjp9pwctCVhQDAut3S60PoukoH7kT3HA=;
	b=lngAoqz2HDvsC7alab56Tibz4DrlD+pXHZqWHKFzeeTbvOtPFKtrKWa3bcT6Bejc24
	8E40gdeQ7L9e0Or2P+M8Mw1oBsInkHMXTcBWJZdUUlCE0MwSMkxGQLpJi82xi0NpBiSs
	9fJTs/FWV00DH4i6lzKreyq+6LSsJl0tO6zG0npNFpKuuvCyhigWmY2AcAdH+VtN9NX1
	2jQ/piq1Kut3imee13YE80D2Wkcilj9htE0bKHfiteRy3z+e6B+FbNzLJnI4F3yBvNau
	ZtEFtPal7N+A6Wk8Y1b29mFIqcx2LvSd92UOoKmzjo45tEnVlvcecp5DjHz2tBHKRof3
	uDfA==
X-Received: by 10.182.78.168 with SMTP id c8mr73276obx.30.1358445228756;
	Thu, 17 Jan 2013 09:53:48 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.47
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:47 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:14 -0600
Message-Id: <1358445195-22441-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 11/12] task-arago-tisdk-amsdk: Add screenshot
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:49 -0000

* Add screenshot to the list of applications installed in the SDK

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/tasks/task-arago-tisdk-amsdk.bb   |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
index 1351030..d0a07a0 100644
--- a/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
+++ b/meta-arago-distro/recipes-core/tasks/task-arago-tisdk-amsdk.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Task to install additional packages only used in the Arago SDK"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-PR = "r0"
+PR = "r1"
 
 inherit task
 
@@ -16,6 +16,11 @@ OOBE_ti33x += "\
     parse-ip \
 "
 
+EXTRA_APPLICATIONS = "\
+    screenshot \
+"
+
 RDEPENDS_${PN} = "\
     ${OOBE} \
+    ${EXTRA_APPLICATIONS} \
 "
-- 
1.7.0.4


