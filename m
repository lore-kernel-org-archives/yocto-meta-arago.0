Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f169.google.com (mail-ob0-f169.google.com
	[209.85.214.169])
	by arago-project.org (Postfix) with ESMTPS id 023B352A68
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 17:26:30 +0000 (UTC)
Received: by mail-ob0-f169.google.com with SMTP id ta14so3009060obb.28
	for <meta-arago@arago-project.org>;
	Mon, 28 Jan 2013 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=NEtdPJtNklg1l1dKj0/4RvIhvEOLsbLO9AtsNIL11CQ=;
	b=u3bcJpFRL7RMVCeVZY25oocJ5B7RspwQezuhm701zwzVa49vye+r4EuRgK++bgjJYd
	nhj0GNZCTlhvcG3xqlr0wZl4129Id8Xth7wwlZyXqt0vBQNuVAKVcMFDMN+jPqFIA7/N
	+PXTrJHUQfYP0rSm2Bia1p/dSCJL4QVeHPu4wz6l/9VjrH30Uqf02eCtg3hCLvMO366g
	vVD6RBcSghdACECWjGoqFFxxiu00G1C3y5m35RfEIaqT8yo5w3d8Lu0uTU+BYonVwPag
	47VmGMd/1Wb7sYkevSSsXxojLeH4UXGJsyzPMeWckqFtXKQsZ/3zmIlHe/Sug9DJIaxl
	mvcA==
X-Received: by 10.60.169.207 with SMTP id ag15mr11574331oec.120.1359393990571; 
	Mon, 28 Jan 2013 09:26:30 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id m3sm8149180obm.21.2013.01.28.09.26.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 28 Jan 2013 09:26:29 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 28 Jan 2013 11:25:29 -0600
Message-Id: <1359393932-31361-29-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359393932-31361-1-git-send-email-fcooper@ti.com>
References: <1359393932-31361-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 29/32] u-boot_2012.10.psp05.06.00.00 - Freeze PSP 05.06.00.00
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
X-List-Received-Date: Mon, 28 Jan 2013 17:26:31 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Stop autoreving the git tree. Stick with the selected commit since that
  corresponds to  the 05.06.00.00 release.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../u-boot/u-boot_2012.10-psp05.06.00.00.bb        |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
index d18af34..fa2183e 100644
--- a/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
+++ b/meta-arago-distro/recipes-bsp/u-boot/u-boot_2012.10-psp05.06.00.00.bb
@@ -23,14 +23,14 @@ DEFAULT_PREFERENCE = "-1"
 
 PACKAGE_ARCH = "${MACHINE_ARCH}"
 
-PR = "r6+gitr${SRCPV}"
+PR = "r7+gitr${SRCPV}"
 
 SRC_URI = "git://arago-project.org/git/projects/u-boot-am33x.git;protocol=git;branch=${BRANCH} \
 "
 
 BRANCH = "amsdk-05.06.00.00"
 
-SRCREV = "${AUTOREV}"
+SRCREV = "6536bfa6b7f16bb49fdea8c72959e3ed54e77a82"
 
 S = "${WORKDIR}/git"
 
-- 
1.7.0.4


