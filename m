Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id AEB4552AAA
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 17:53:47 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id j6so2866182oag.40
	for <meta-arago@arago-project.org>;
	Thu, 17 Jan 2013 09:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8iMX/Euu1D5IT2vnXXZrxz5+HF7bwVvJsQJacoUjVJc=;
	b=z2wUdedy6v0Q5qnWqcFHH2DoUrgxqQ06pTaj+LwzlQSOwI5bACg6qOfeHZLhGGEMVW
	m7xPK+5+mGnEns9hmT9OaTUZFO+QsOaosflGDcDKCKo6iG9Yt6WRoDW+U6b7eHzxz6bO
	U6E248TjDe8S9MUfvb8X9sH5w99Zh2nupSEu29qYmE0OC4voVTGrEeMm3REsZt+k4z6E
	MPIQRguP3g1WrCIMq3Rt3Qy1X9qXBoMP9LiIUcG6o6mPk8X9ZfbVgYkrxDhBugdSL9MJ
	94xGLP7E4CCbSKakvzi87Bv42+eM/HJtdhnC8TdOXbKs5vTIdacNwzfPcT2MaQeL+n1x
	juLQ==
X-Received: by 10.60.32.44 with SMTP id f12mr4737987oei.61.1358445227107;
	Thu, 17 Jan 2013 09:53:47 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id zn9sm1503218obb.23.2013.01.17.09.53.45
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 17 Jan 2013 09:53:46 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu, 17 Jan 2013 11:53:13 -0600
Message-Id: <1358445195-22441-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1358445195-22441-1-git-send-email-fcooper@ti.com>
References: <1358445195-22441-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/12] screenshot: Add screenshot application
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
X-List-Received-Date: Thu, 17 Jan 2013 17:53:47 -0000

* Add screenshot application used to take a screenshot of the framebuffer and
  save it to a bmp file.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-graphics/screenshot/screenshot_1.0.bb  |   26 ++++++++++++++++++++
 1 files changed, 26 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb

diff --git a/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
new file mode 100644
index 0000000..ed819d0
--- /dev/null
+++ b/meta-arago-extras/recipes-graphics/screenshot/screenshot_1.0.bb
@@ -0,0 +1,26 @@
+DESCRIPTION = "Screenshot"
+HOMEPAGE = "https://gitorious.org/screenshot"
+LICENSE = "BSD"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5cad16cc3f514a15adb1d710b82d5fc4"
+SECTION = "graphics"
+
+PR = "r0"
+
+BRANCH ?= "master"
+SRCREV = "1f11a23be4386c2ee0387cd12c1a9569c703a3bb" 
+
+SRC_URI = "git://gitorious.org/screenshot/screenshot.git;protocol=git;branch=${BRANCH}"
+
+S = "${WORKDIR}/git"
+
+do_compile() {
+    export CROSS_COMPILE=${TARGET_PREFIX}
+    export ARCH=${ARMPKGARCH}
+    # build the release version
+    make release
+}
+
+do_install() {
+    export ARCH=${ARMPKGARCH}
+    make DESTDIR=${D} install
+}
-- 
1.7.0.4


