Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by arago-project.org (Postfix) with ESMTPS id B10E752094
	for <meta-arago@arago-project.org>;
	Fri, 11 Aug 2017 06:47:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id 83so2457866pgb.4
	for <meta-arago@arago-project.org>;
	Thu, 10 Aug 2017 23:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=b1T4/bzXo2RZ7TJnGT1jgUmGuB2y1Qvnksqq8Gtyqa4=;
	b=tbAWl2/Yd7ypA1YvDcdnR7ZTBTNEpalNa3sxtrIsFx+GkdA5hi7nMOMbUU2coakXHT
	g3IhKezfxA7eciH4bHIzGRD4vp6UNYqfB/s++21FkgX8v9SgkCmzWffnUXXMJ7fqCWv4
	KDzz5yHPL9dW+MaQ7DFx7yY6Zf7mEUoBTNtKQlFrIWInR6eGvJsTOknUZ/hn07tNzv9d
	8YOEVpZ1uzAOPSzJ4zhu0Z28547dvkjq8nFmL/oKf4TIiTAxAzlp6zy9Ah2bWmyXvXov
	G1CMm11BR1EEzrgRYsHH95qH4jHpszWsKPw5qtuYJQaefkCLosCL+F57izqiT2Ak8tGO
	bQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=b1T4/bzXo2RZ7TJnGT1jgUmGuB2y1Qvnksqq8Gtyqa4=;
	b=aWJnYYkY3SD1ayX3jt0qXXlKEiZAYm0A6h0LOvJXF9Sw+x0GtyhDMUw1wo/uM8z1Zt
	3AUHVrXVUOEC45XqxSavXDU+7uGzxQuP0pcQRKxCjJLJmd2G7Ux3Kel0kvhnWK0ZOu69
	rOeCivFr3a6a9EapQyDH863NZG21D0eZ1H/Sllq6OwOeo/KC5LbVfdk/z3y4I1QGf4Jb
	zJMFPKt/Taj2yBZVoCG0sjoFKJ3Rva/9s6Etc+ntjDBH/YECSDyHpNW7Sj4gc6edD5nD
	lNdPqRMQd8mlboF1dKb+VGr2ff3zTdi7zEd9hVT+m4zM1LBY+xl1HJpraLRlz1Wszq3a
	75rQ==
X-Gm-Message-State: AHYfb5jQffxIfyPbNw4iVobb2JZ1LQkA+bsrqYAissdQSuJpYhVJErxR
	TfHWw7JBePhFSIpG
X-Received: by 10.84.129.132 with SMTP id b4mr16421437plb.294.1502434047928;
	Thu, 10 Aug 2017 23:47:27 -0700 (PDT)
Received: from localhost.localdomain (103-224-128-96.flip.co.nz.
	[103.224.128.96])
	by smtp.gmail.com with ESMTPSA id r9sm412711pgf.83.2017.08.10.23.47.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 10 Aug 2017 23:47:26 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 11 Aug 2017 18:47:10 +1200
Message-Id: <1502434030-13995-1-git-send-email-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.7.4
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [morty][PATCH] qtbase_%: Check wayland in DISTRO_FEATURES
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
X-List-Received-Date: Fri, 11 Aug 2017 06:47:29 -0000

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


