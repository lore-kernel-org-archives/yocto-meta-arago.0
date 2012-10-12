Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 3964C529AA
	for <meta-arago@arago-project.org>;
	Fri, 12 Oct 2012 05:11:04 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so2442137obb.38
	for <meta-arago@arago-project.org>;
	Thu, 11 Oct 2012 22:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=otkM02Ti/KVsnKt3a8cyaQ6BiPLGEeW8Cp9XzQfa5Kg=;
	b=Wk1iKC3YujLsYy0Qn6ZwYkEU4LWD9lfsxAt761UQjEQBvHx1LNz4BfMMNLaimiADQj
	/dbjFdpoUwl5m2duB6Esm7yFClXXenadYhXp+JLmbCTkqE+yMXa/qLryxMdIGlyS+pvy
	NZ70hqa8GOjmxa5SCfZLqQRypGxwBkIghXEZx9CS98C0KDZ+sDslL++SX/UYgwiw1+AQ
	PvZpLVxAkh6iDGVOcdWRWYvwdmZDEbnQEnVyfl+wSoCp/KEIP76D2Piv3knQOCfKJo09
	fDceMILqKhxN4n4DeXtv0qKk2FaF6ZbsI2Of9xPHwln7lUrqvG00aViAQvOlQj3Wc5kD
	WmEA==
Received: by 10.182.69.36 with SMTP id b4mr2533427obu.96.1350018663751;
	Thu, 11 Oct 2012 22:11:03 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id q6sm4674851oec.7.2012.10.11.22.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 11 Oct 2012 22:11:03 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 12 Oct 2012 00:41:55 -0500
Message-Id: <1350020515-11721-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago.conf: Set preferred kernel version for am335x
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
X-List-Received-Date: Fri, 12 Oct 2012 05:11:04 -0000

* For now linux-am335x_3.2.0-psp04.06.00.08 is not the default kernel for
  am335x. Therefore, a PREFERRED_PROVIDER and PREFERRED_VERSION needs to
  be set to make sure the Arago SDK picks up the right kernel.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 48629f1..2188fde 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -36,6 +36,10 @@ ARAGO_QT_PROVIDER_armv7a = "qt4-embedded-gles"
 
 PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
+# Use the SDK supported kernel and kernel version
+PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
+PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp04.06.00.08"
+
 # Use the SDK supported u-boot version
 PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
 
-- 
1.7.0.4


