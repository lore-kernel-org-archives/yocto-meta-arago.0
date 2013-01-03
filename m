Return-Path: <fcooperjr27@gmail.com>
Received: from mail-gh0-f173.google.com (mail-gh0-f173.google.com
	[209.85.160.173])
	by arago-project.org (Postfix) with ESMTPS id C81B452A6C
	for <meta-arago@arago-project.org>;
	Thu,  3 Jan 2013 20:17:53 +0000 (UTC)
Received: by mail-gh0-f173.google.com with SMTP id 16so1873884ghy.4
	for <meta-arago@arago-project.org>;
	Thu, 03 Jan 2013 12:17:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=JF6jguylYWPXQ+cRf3m9rA2mPXTHjGw12dh3YYmqR0s=;
	b=xNTVMshQlDiGrpH0qbRjdSj7nu+hEK+sMhTfBsw5/gaC6ge4CJ0Bd6MWUVIB7qCfPd
	xCYNH8os1N8NvcPbGuriFeOUjBFl6Jd6RWRlNJucQKJ+NtKxZ4JUGr0dwIf43PwBCfrK
	XdRURrTS1G1gz4QKSw6zDHMcmrSIsUKfxghur1rAAil0FCEs57jiF411kawYu7ofHaAd
	IBy7KckFy406p4qC78vi0ZxqZz+rus5UOwdm++XD5zVGIaumuaht9APmJT7ktvlByjd/
	RrQ/IiaGPxjvqYCd3uh3P5ZxVDINHaH//SMFbCPofIoPEw3tLJVXmWIdGN/XZ5x8UZLN
	5EWg==
X-Received: by 10.236.127.38 with SMTP id c26mr52471130yhi.109.1357244273516; 
	Thu, 03 Jan 2013 12:17:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id a9sm38275442anb.6.2013.01.03.12.17.51
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 Jan 2013 12:17:52 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  3 Jan 2013 14:17:40 -0600
Message-Id: <1357244261-22829-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1357244261-22829-1-git-send-email-fcooper@ti.com>
References: <1357244261-22829-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] psplash_git: Remove patch
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
X-List-Received-Date: Thu, 03 Jan 2013 20:17:54 -0000

* Oe-core denzil is sticking with an older psplash commit.
* The patch psplash_fix_bad_arg_segfault.patch is not needed in meta-arago
  since we are using a newer psplash commit that includes this patch.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/psplash/psplash_git.bbappend      |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
index aaa6167..d354a93 100644
--- a/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
+++ b/meta-arago-distro/recipes-core/psplash/psplash_git.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 # Update which portion of the psplash.h file to use as a checksum. This tweak
 # has already been done in oe-core master
@@ -10,6 +10,10 @@ LIC_FILES_CHKSUM = "file://psplash.h;beginline=1;endline=16;md5=840fb2356b10a85b
 # Updating to latest version of psplash. This is the version used in oe-core master
 SRCREV = "de9979aefbc56af59b4d236a4b63dd19dcdcfb53"
 
+# Remove backported patch from oe-core denzil since the SRCREV we are using
+# includes this patch.
+SRC_URI := "${@oe_filter_out('file://psplash_fix_bad_arg_segfault.patch','${SRC_URI}', d)}"
+
 SRC_URI += "file://psplash-18bpp.patch                      \
             file://0003-Updated-configurability.patch.patch \
             file://psplash-poky-img.h                       \
-- 
1.7.0.4


