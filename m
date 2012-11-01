Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 613B9529B8
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:37:01 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2648870oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=NI7uH9dkUSU9X6gQUgNSsn4XZDkYzoD5J3Lup2n5nto=;
	b=D8V6GCmXbVGad/bJYZjTznvDMfBxSc+tyaoiyyi73SO0cUOM/i2oG2xVag/71d4LTf
	uLhstnq0tChBVFpPJfQP7zf/zg6FGHxKrcpPNMPrWmfsN27JU9afa4NMBOmK0oCqx0se
	suYSEukqbEsKW+YyG9mOqIpnSBmb2stKVdgoo3L4Zi8MaK8EkjQmG3qVr6xQioN7/Ubq
	XVfXreXvGNLFu0w+C+ZcXyNdzcga2tmerT9O0Jt4pjTPwOGtqixt6AW7GxfBZst41o/2
	mOYdOkvm+reeVQv9+UJti3tXbOZZBk1V69DsNJ/gNEgS9Dvnktpdl3MpubhBt921/PHN
	EFdQ==
Received: by 10.60.32.135 with SMTP id j7mr34247337oei.132.1351795020715;
	Thu, 01 Nov 2012 11:37:00 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id on10sm6958363obc.9.2012.11.01.11.36.59
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:37:00 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:36:56 -0500
Message-Id: <1351795016-4461-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] matrix-gui-apps-git: Correct .desktop filenames
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
X-List-Received-Date: Thu, 01 Nov 2012 18:37:01 -0000

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


