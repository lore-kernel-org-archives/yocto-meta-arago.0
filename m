Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id 904225208C
	for <meta-arago@arago-project.org>;
	Wed,  7 Nov 2012 01:15:35 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so1025239oag.38
	for <meta-arago@arago-project.org>;
	Tue, 06 Nov 2012 17:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=PYXagy41KwfInamM2m8efMGgPQs/6t9sUH6zYEIBYvI=;
	b=KMAB1icIE0L4qMTS7SMMnrzocwl3nQ0x6vm8Zg9mp6LTQhiZjvYa1cbT4n5oc3j/XH
	OiJSqRZdNqO1LGo2/oH9EnUdT9wrs//GbJDJTZM8Y8OBwXjMDl3cwsx1rT2uyk50aU8t
	QlGkFRy8zgJ0qeAh55KAH4ecBXJlrn3MZU9LBaNuZ8aJe/AQ4kfbQMruo/efnKa02Tq3
	NxWv+qqL0fsNm+3jemarJSpJ31180diqVo3drvKlocEZYyHhg0fKARMP2gjumhbMYIPc
	ngVifpHYHP85nNH7tvY+Rh40H5viGSeq4Wcar3Q7RS1Tj1EyVJko54Swa0ym0xJ6UxCi
	dkiw==
Received: by 10.60.24.7 with SMTP id q7mr495176oef.108.1352250935340;
	Tue, 06 Nov 2012 17:15:35 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id fw9sm22288514obc.19.2012.11.06.17.15.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Nov 2012 17:15:34 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Tue,  6 Nov 2012 19:15:25 -0600
Message-Id: <1352250925-12259-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352250925-12259-1-git-send-email-fcooper@ti.com>
References: <1352250925-12259-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] arago-source-ipk: Remove libgles-omap3
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
X-List-Received-Date: Wed, 07 Nov 2012 01:15:35 -0000

* do_create_srcipk was causing build failures for libgles-omap3.
* Remove libgles-omap3 from the list of packages that have sourceipk enabled
  since it wasn't suppose to be enabled in the first place.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index 7a36f1f..312f629 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -262,9 +262,6 @@ CREATE_SRCIPK_pn-ti-audio-soc-example = "1"
 SRCIPK_INSTALL_DIR_pn-ti-audio-soc-example = "audio-soc-example_${PV}"
 SRCIPK_PACKAGE_ARCH_pn-ti-audio-soc-example = "${MACHINE_ARCH}"
 
-CREATE_SRCIPK_pn-libgles-omap3 = "1"
-SRCIPK_INSTALL_DIR_pn-libgles-omap3 = "component-sources/graphics-sdk_${PV}"
-
 CREATE_SRCIPK_pn-ti-c6run = "1"
 SRCIPK_INSTALL_DIR_pn-ti-c6run = "component-sources/c6run_${PV}"
 SRCIPK_PACKAGE_ARCH_pn-ti-c6run = "${MACHINE_ARCH}"
-- 
1.7.0.4


