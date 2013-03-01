Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id 00C0E52A27
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:10:57 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so4873326oag.8
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=Mz2YwGZ4hyzWQb+oDLghtiT7LY6zwrNAm7kdyKHzIuY=;
	b=m8PvIeLTSjj5jq5jh0I9uij94ACBMQDc5J1cCp5MuwWubhYGaDQb3Bm7VMlq9dYn70
	KZ5tIj0gYUGwTqLe5lTmVBIwhhrAu3vNkDRhAGrYid7xUbxtyd/x49cpniNtR+y631if
	dTWzxVkz174cCyGoULnTOCHzjGNwBNipfQOSHS+Ae0Gk1hSPTExdBPrfhTbSScKURopb
	MBoAF5m16lhaxu+jT7iD2rHAvT7Km6pl+XBvfbioxsoG6JHeTJ6HO8LGxQNpLT67VkKx
	tG5Zh6qxQeTyR5wX5aqUmGqY6A6YLWg1OmALM8GmQIZTAKsdXbxxfBSj8DHrCRNI4rEX
	sIfQ==
X-Received: by 10.60.170.242 with SMTP id ap18mr7175609oec.108.1362107457116; 
	Thu, 28 Feb 2013 19:10:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.10.53
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:10:55 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:39 -0600
Message-Id: <1362107447-11234-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 1/9] matrix-gui-apps-git.inc: Add additional Graphics demos
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
X-List-Received-Date: Fri, 01 Mar 2013 03:10:59 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Pull in new images, .desktops and scripts for the new Graphics demos provided
  by the Graphics minimal sdk.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index 823f0e7..f4d480e 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "4a5a56fff71ff83880204eac43514f686e251de6"
+SRCREV = "6a76c32dd0764825c4f4c8259d09299e8a15ea5e"
 BRANCH = "master"
-INC_PR = "r10"
+INC_PR = "r11"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


