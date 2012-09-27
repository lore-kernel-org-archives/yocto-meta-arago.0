Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id A4BE452AB8
	for <meta-arago@arago-project.org>;
	Thu, 27 Sep 2012 04:29:12 +0000 (UTC)
Received: by oagn12 with SMTP id n12so1417477oag.38
	for <meta-arago@arago-project.org>;
	Wed, 26 Sep 2012 21:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=or0Annmb3DZ6d7vyYfTOpmJDL/UY1eIUZ0qb39PAXvk=;
	b=pygeqfV2at5QVEwWIQLM5ifYcnXbP2x16tz6whK1+mE4LiIa0xO0VKS0y/vU71cC2o
	nxTTZKNL6pxSDWAh9b0FfsfZNv0O/T7RMwHwls0qJ+sTQ+wCbxHPYEhfmghYAU/Nnoto
	n+0dlE4+pLfSNdHWXqhXApyRpyK6VpPgrhR5FZiUEaPakLx21wPU5TRjfgZ/bJOtFgD6
	3dZTxr2gtyqTK4gSRHttEi3LVPe0icmIvSVrMMbisO2h9TlCd0b9XJGLzbrVMr9m/67s
	bVZjzdgLUXARXgea3tZtMQubfTbk6ROII1nBL161cakcwTW7e/TIEUAKa17S/pf1beIw
	60nA==
Received: by 10.182.207.71 with SMTP id lu7mr2111492obc.78.1348720151929;
	Wed, 26 Sep 2012 21:29:11 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id ez16sm4812811obc.8.2012.09.26.21.29.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 26 Sep 2012 21:29:11 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 26 Sep 2012 23:54:30 -0500
Message-Id: <1348721670-8186-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH v2] dt: Port dt recipe
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
X-List-Received-Date: Thu, 27 Sep 2012 04:29:13 -0000

* Port dt recipe from oe-classic

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
Version 2 addresses the following issues:
Incorrect commit message. Previous commit implied recipe was ported from
oe-core instead of oe-classic.

 .../recipes-devtools/dt/dt/no_aio.patch            |   17 +++++++++++
 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb  |   30 ++++++++++++++++++++
 2 files changed, 47 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
 create mode 100644 meta-arago-extras/recipes-devtools/dt/dt_17.07.bb

diff --git a/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
new file mode 100644
index 0000000..8253e86
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/dt/dt/no_aio.patch
@@ -0,0 +1,17 @@
+---
+ Makefile.linux |    2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+Index: dt.d-WIP/Makefile.linux
+===================================================================
+--- dt.d-WIP/Makefile.linux
++++ dt.d-WIP/Makefile.linux
+@@ -68,7 +68,7 @@ LINTLIBS=
+
+ PORG      = -O3
+
+-CFLAGS= $(PORG) -DAIO -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
++CFLAGS= $(PORG) -DFIFO -DMMAP -DTTY -D__linux__ -D_GNU_SOURCE -D_FILE_OFFSET_BITS=64
+ CPP=	/lib/cpp
+ CPPOPTS= -D__GNUC__ -DFIFO -DMMAP -D__linux__ -D_GNU_SOURCE
+ LDFLAGS=
diff --git a/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
new file mode 100644
index 0000000..22fd6ac
--- /dev/null
+++ b/meta-arago-extras/recipes-devtools/dt/dt_17.07.bb
@@ -0,0 +1,30 @@
+HOMEPAGE = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/dt.html"
+DESCRIPTION = "The Data Test Program (dt) is a generic data test program used to verify proper \
+operation of peripherals, file systems, device drivers, or any data stream supported by the \
+operating system."
+
+SECTION = "console/tests"
+
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=fb073c94d1f584010fc75867b686d6d3"
+
+INC_PR = "r0"
+
+SRC_URI = "http://home.comcast.net/~SCSIguy/SCSI_FAQ/RMiller_Tools/ftp/dt/dt-source.tar.gz"
+S = "${WORKDIR}/dt.d"
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile() {
+	${MAKE} -f Makefile.linux
+}
+
+SRC_URI_append_libc-uclibc = " file://no_aio.patch "
+
+do_install() {
+	install -d ${D}${bindir}
+	install -m 0755 dt ${D}${bindir}
+}
+
+SRC_URI[md5sum] = "fc3373e30868698b90f02cc5fab9aabd"
+SRC_URI[sha256sum] = "6a213b8da2b8907c4f1633c3b90229085ac239e4d43aa5879b0123c21f951cab"
-- 
1.7.0.4


