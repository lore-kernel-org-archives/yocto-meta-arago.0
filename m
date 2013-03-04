Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f173.google.com (mail-ob0-f173.google.com
	[209.85.214.173])
	by arago-project.org (Postfix) with ESMTPS id 5C35352ACD
	for <meta-arago@arago-project.org>;
	Mon,  4 Mar 2013 20:01:55 +0000 (UTC)
Received: by mail-ob0-f173.google.com with SMTP id dn14so2157199obc.18
	for <meta-arago@arago-project.org>;
	Mon, 04 Mar 2013 12:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=B7XBNKLnTUp2Uc0pTonPJR1lVCscyD4IbvTjqgoU0V4=;
	b=KLqkV/lnCp04y7bD2FTFuqTBdJIT5m/8wZNLmpyqbzXUUEu4LsIA2kKtMFYOwk1wIW
	gcJqIxTXOhfYAwM/zs4zDllHe0L4xV6GR26mKqy1OPiQw/XZf8jaquvBMPB1bHL+wHDh
	hOYSZufbWxCX7sJUo3vn2/UbR6QF66Qsxvg1KAbGi1r1hM6pcPDL6rvFZEhH9K9WksGJ
	r6V8Yy+sF1k3yhA9gL9sKEY3IzPBekB4NgUMotuGWBaG1UxTwC4+AfBRIlPI/gP3n897
	Du8x06kbCxwyKP6jgJSkmdstAjZ+kHsFE+BruEm7ditcJnANQ6u3S6ciqvRo+Zj8M0w5
	3F4w==
X-Received: by 10.60.171.144 with SMTP id au16mr17221096oec.56.1362427314892; 
	Mon, 04 Mar 2013 12:01:54 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id j4sm31153357oea.3.2013.03.04.12.01.52
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 04 Mar 2013 12:01:53 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon,  4 Mar 2013 14:01:29 -0600
Message-Id: <1362427289-18057-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362427289-18057-1-git-send-email-fcooper@ti.com>
References: <1362427289-18057-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/10] package-group-arago-gst: Add back gst-ffmpeg
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
X-List-Received-Date: Mon, 04 Mar 2013 20:01:55 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Adding back gst-ffmpeg since we disable libraries with known licensing and
  patent issues in libav.
* Also add gst-ffmpeg-dev packages to SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-gst-sdk-target.bb           |    3 ++-
 .../packagegroups/packagegroup-arago-gst.bb        |    5 ++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
index 461a238..bed3e18 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst-sdk-target.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to build and install header and libs in sdk"
 LICENSE = "MIT"
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -9,4 +9,5 @@ RDEPENDS_${PN} = "\
     gst-plugins-base-dev \
     gst-plugins-good-dev \
     gst-plugins-bad-dev \
+    gst-ffmpeg-dev \
 "
diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
index e538649..82265a1 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-gst.bb
@@ -1,6 +1,6 @@
 DESCRIPTION = "Task to add gstreamer and gstreamer plugins"
 LICENSE = "MIT"
-PR = "r5"
+PR = "r6"
 
 inherit packagegroup
 
@@ -16,6 +16,5 @@ GSTREAMER = " \
 
 RDEPENDS_${PN} = "\
     ${GSTREAMER} \
+    gst-ffmpeg \
     "
-
-#    gst-ffmpeg
-- 
1.7.0.4


