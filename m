Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id CF48A529A5
	for <meta-arago@arago-project.org>;
	Thu,  1 Nov 2012 18:44:48 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so2657611oag.38
	for <meta-arago@arago-project.org>;
	Thu, 01 Nov 2012 11:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=ZxVg/+Z6F93GzceLTDC/JTZQJiUnFMffr2bgm4n27/k=;
	b=VuozjriY0eJHXqyQS/CWKISUVt3/n11LDI8ZlLpJtIorCh5prT0LlDximrT5E0/60e
	e+Z3xKYg81l8tbDj4ULJHNztf3r9OUYYiAvOcj7RMhpnzNjaD2n5YZCDinr9RAHixkGd
	8XSOXzr3df42SbhKbwZpl6waQE6u+KOSAzaKxjsjSj0V8zkuNQi1BGomX8u0tGqQYt6M
	R3QsQi4bNj5fCqXMmzI7aLAaIW4k4kPiCuE5deaV1HWzJM05KSbSFrC4dve9WBT0zYM/
	KhKS+u2DSJL7dGBMb6LIdC6ZfRmm+EjoR1Ja1L0z0e4cS4pq8mCwb5SuCnPq661xJia+
	KWdg==
Received: by 10.182.89.42 with SMTP id bl10mr33954507obb.27.1351795488335;
	Thu, 01 Nov 2012 11:44:48 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id g17sm1136353oei.10.2012.11.01.11.44.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Nov 2012 11:44:47 -0700 (PDT)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Thu,  1 Nov 2012 13:44:44 -0500
Message-Id: <1351795484-5273-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago.conf: Setting PREFERRED_VERSIONS
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
X-List-Received-Date: Thu, 01 Nov 2012 18:44:49 -0000

* Setting PREFERRED_VERSIONS to use a specific version of a library or
  application that does not require a GPLv3 license.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 013e496..84d0050 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -67,6 +67,12 @@ PREFERRED_VERSION_udev = "164"
 PREFERRED_PROVIDER_jpeg = "libjpeg-turbo"
 PREFERRED_PROVIDER_jpeg_armv5te = "jpeg"
 
+# Setting PREFERRED_VERSIONS due to selecting a specific version of a library or
+# application that does not have a GPLv3 license
+PREFERRED_VERSION_gdbm = "1.8.3"
+PREFERRED_VERSION_readline = "5.2"
+
+
 # Disable polkit's systemd configuration from meta-oe
 POLKITAUTH = ""
 
-- 
1.7.0.4


