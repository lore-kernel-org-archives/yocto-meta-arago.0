Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 018325208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:33 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=i16rKDLp8X8Yn8VSfDW/tC80qWPArgdrYtBNqA5IolY=;
	b=YWp21LBOJvhg2dzsxnU0Qb8SLs31/WacZFypvgMm9f/0cvW0kXC5duLlI8/2UVH6H+
	rxYUeD3+jT/BHS1kCC/ZnpQVtD6XLIaCvHf6D+L+elHuGjXbCtRntYxKDW+7k2nYjYWq
	zbOzcXWwkWLajb81KR4H3/Pce10TE9ZZDKECN70O8JORMtpWmewXHOtzWUThq5vgi/wp
	p8Ws3FQ1QVv4UujH/LcbvdDttHsjR5nNalSTs+/fl+4MUiOz5IWp+ZSIczjgDH5rjH7u
	5ubFWDoXg5+ncsd8jIaGPQSWQiVcmJHgKzIYzgDpy+trqOy5gFKJXsUyPzKNabgKmp8q
	UFjw==
Received: by 10.60.27.4 with SMTP id p4mr6603997oeg.54.1352080473745;
	Sun, 04 Nov 2012 17:54:33 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:33 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:35 -0600
Message-Id: <1352080417-9792-38-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 40/42] busybox: Enable more features in head application
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:34 -0000

* Enable additional features of the head application which is used
  by many of our SDK scripts.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    2 +-
 .../recipes-core/busybox/busybox_1.19.4.bbappend   |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index 4aa0e7e..31fbec2 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -219,7 +219,7 @@ CONFIG_FALSE=y
 # CONFIG_FOLD is not set
 # CONFIG_FSYNC is not set
 CONFIG_HEAD=y
-# CONFIG_FEATURE_FANCY_HEAD is not set
+CONFIG_FEATURE_FANCY_HEAD=y
 # CONFIG_HOSTID is not set
 # CONFIG_INSTALL is not set
 # CONFIG_FEATURE_INSTALL_LONG_OPTIONS is not set
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
index b7cd903..35b1243 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.19.4.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago2"
+PR_append = "-arago3"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.0.4


