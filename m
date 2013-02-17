Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f178.google.com (mail-gh0-f178.google.com
	[209.85.160.178])
	by arago-project.org (Postfix) with ESMTPS id 0656752A91
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:42 +0000 (UTC)
Received: by mail-gh0-f178.google.com with SMTP id g24so474915ghb.9
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=Mz2YwGZ4hyzWQb+oDLghtiT7LY6zwrNAm7kdyKHzIuY=;
	b=ypAAwp3NtIehu4jqEtdSdLBL7NkjAYbcm/cbh7MVkGWfZn1CpQ20mRgzQI1kl1mX/W
	MgSMbAsKmysUcEaIv/uoDKt2Lyh0iO0UkgwQNX7QT5M+ZaoSSYjP+ilxDLeN7v4AF+2X
	67xhq9upPtw6RqcOaxz4v8T4fLPcD5glcizuLpmU6AGgYxX/whxIAVYPZGYfLViaamIS
	3YQ+jCNOLYE9uJV6o04dBscrur7z8hYgmdPr+lbmdQ1L/FX149EI0+MU36/8yr5ludt7
	LaqcPLQ4m6GgLjSZwg8biyoOyi6IpQlFLF5NOlZ4LSvXYEDWnpzsG39wtfyEdN34cnx3
	mj7Q==
X-Received: by 10.236.134.163 with SMTP id s23mr16720213yhi.54.1361141621715; 
	Sun, 17 Feb 2013 14:53:41 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.39
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:40 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:05 -0600
Message-Id: <1361141595-1687-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/20] matrix-gui-apps-git.inc: Add additional Graphics demos
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:42 -0000

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


