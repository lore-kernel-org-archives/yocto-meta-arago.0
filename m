Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by arago-project.org (Postfix) with ESMTPS id E55945297E
	for <meta-arago@arago-project.org>;
	Thu, 10 Aug 2017 12:31:57 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t86so566115pfe.1
	for <meta-arago@arago-project.org>;
	Thu, 10 Aug 2017 05:31:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=b1T4/bzXo2RZ7TJnGT1jgUmGuB2y1Qvnksqq8Gtyqa4=;
	b=PsVwjuV09LRHzt6K5USCy2gK0qcFqX6qxbdjq05qYBzQ9QStXtsh+a2MwdkwkwINkq
	jiK8+72FBcH7zSRK3BTWeII9m5i5qa8kqt04/UmG9fUVcTiXtzUIpor9XGYJUs20C4uE
	UY98YPHcr/rju3IwdceV4KuiPOhk0hnyAaBhEH37TcsPSrOCGvbqZvX2LSxeLAhhq39q
	fPfy9H04ltMmw/HMWhv8vPWIQd6ioeNBwDjxZVulSaKejL5c6nH9yYM4oaPfOfv3wDfm
	LNtTN9cQw4mAImYaJFW1Nzo1ofDQUDqnRbjyqLLDxqcexA1++S23Tb89Q29E8EAcpWXL
	z3Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b1T4/bzXo2RZ7TJnGT1jgUmGuB2y1Qvnksqq8Gtyqa4=;
	b=smPuJ0Fg7J/p0nU2QrY7DEOesIaz40wQw1bUPk8cuTlryNYb6A2zrXYm8IFOWeAupC
	kPbcv79RtmyCfSWRUItlJ11zHJv9mMZZZaifsPHq1FBo8X/H8JlVtaX1twN+p7gi2U4+
	3vXzhgocRuitYL3ajpjCbHfvbOI9g1ycZauvQrT8qQwoewoUDYWP0VmwdI8RyHwP2WlH
	c6rKXaw69sMcErtson6IqRzh9wYSh/MFUCCoW0NmzLN6fd3s3PKE889j9BzXHFrMM5hS
	JAE+rAxO2y4UrWV8enh1rP530Q9onoUoB03cZYI1xxkYJ4aC7i2Ic9FehEJ75Wh0ZXb5
	C9Qg==
X-Gm-Message-State: AHYfb5g937w7G08T3ZgKCYCtPJDZm1JKh+DjWAgwYxe7/AXOgX7Jnp0n
	8AS0ja0GG9HK7PqRvww=
X-Received: by 10.84.238.1 with SMTP id u1mr13285311plk.187.1502368317386;
	Thu, 10 Aug 2017 05:31:57 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-49.flip.co.nz.
	[103.224.128.49])
	by smtp.gmail.com with ESMTPSA id l2sm7146616pgc.27.2017.08.10.05.31.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 05:31:56 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 11 Aug 2017 00:31:43 +1200
Message-Id: <1502368303-9406-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [PATCH] qtbase_%: Check wayland in DISTRO_FEATURES
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
X-List-Received-Date: Thu, 10 Aug 2017 12:31:58 -0000

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
index 5d6f5e4..9cf76c4 100644
--- a/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
+++ b/meta-arago-distro/recipes-qt/qt5/qtbase_%.bbappend
@@ -1,10 +1,10 @@
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-GLES_EXTRA_DEPS = "libdrm wayland"
+GLES_EXTRA_DEPS = "libdrm ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)}"
 
 PACKAGECONFIG[gles2] = "-opengl es2 -eglfs,,virtual/libgles2 virtual/egl ${GLES_EXTRA_DEPS}"
 
-PR_append = ".arago12"
+PR_append = ".arago13"
 
 QT_CONFIG_FLAGS += "-qpa ${@bb.utils.contains('DISTRO_FEATURES', 'wayland', 'wayland', 'eglfs', d)}"
 
-- 
2.7.4


