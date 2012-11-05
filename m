Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 760185208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:53:57 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so4861422oag.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:53:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=NI7uH9dkUSU9X6gQUgNSsn4XZDkYzoD5J3Lup2n5nto=;
	b=HDkEgtA2OjX5msbDuhHaRk6u5idD/wnvSD3pnbjGLJabJldFSxa489W+0+ckEwKjyk
	WjV4jR3GV2lLsNYoJsCu6D1qcI3KghuGWU7Nmvby64vXfdDJs+ISgYdceG1TBUvx+Ait
	qKdXCSeWX4qzk2Apxinn4SoZxfWMZ69glqHnYjp6HVARARiXGC3rIWhDJR0kwfvIuLmn
	lsGPW5c5BoDzFM01ej5SD/e9PepaACiY8B2zOxXTbPhzfgTaKJn+cQbC4B7cr2Dj2R70
	LTPh8cEDXlqqk60ZyqBSH1Xwc7LavL8jP90US49RlPIAtYJn6QqGlJCqZfJ91CGkoUIb
	l0qA==
Received: by 10.60.170.114 with SMTP id al18mr6869454oec.56.1352080437224;
	Sun, 04 Nov 2012 17:53:57 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.53.56
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:53:56 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:04 -0600
Message-Id: <1352080417-9792-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 09/42] matrix-gui-apps-git: Correct .desktop filenames
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
X-List-Received-Date: Mon, 05 Nov 2012 01:53:58 -0000

* Some of the .desktops for power management related demos had incorrect
  filenames.
* Pulling in the commit that provides the correct filenames.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/matrix/matrix-gui-apps-git.inc    |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
index ca5f69d..ddbc7a7 100644
--- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
+++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
@@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
 LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
 
 SRC_URI = "git://gitorious.org/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
-SRCREV = "cf78c056a48573600438535adb31b4415377bc00"
+SRCREV = "6a0c9776adfef03463535de6c7059d8525a336aa"
 BRANCH = "master"
-INC_PR = "r4"
+INC_PR = "r5"
 
 # Pull in the base package for installing matrix applications
 require matrix-gui-apps.inc
-- 
1.7.0.4


