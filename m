Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id E475E529A1
	for <meta-arago@arago-project.org>;
	Thu, 29 Nov 2012 01:00:33 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id n12so13246859oag.38
	for <meta-arago@arago-project.org>;
	Wed, 28 Nov 2012 17:00:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=GObT6FAKPZa6Q603/WGwmxlTffuuKUXxDhkt5PVWJhQ=;
	b=tWxiPY3YaUsLv15bV1f7TZwd3mt+34uuwVuXOT/8qkvNT+jnCjWgnAcqRP1SLMhIe/
	WVIkb+0S7e6J/YOTdw6lO5tPXUEdpJAswLN+ncE5vJjurFcDmxlMKYdYxhX1jwoDY68t
	AmUHgQtAH8xJ0SbmfjqQxONDjgNLcIjweIdp4R08HHiG4BDWgW0O+roC+gTt3uMGqiLF
	v6q6iKfWKfQZCYAiD3GjQOW/XLgkFW7WCGh1xxwdBp+nS3zPXpsFn6C8Ajny1L1MO+3t
	p3TT7D5Ot/tNr5vdQuGfzrpYfPWBokJDYbEBoMxsTx7WB9GGAeSvJyAQ31vbARvuI/wD
	HUWQ==
Received: by 10.60.10.230 with SMTP id l6mr263004oeb.94.1354150832940;
	Wed, 28 Nov 2012 17:00:32 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id w14sm150599obd.5.2012.11.28.17.00.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 28 Nov 2012 17:00:32 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Wed, 28 Nov 2012 19:00:25 -0600
Message-Id: <1354150825-4279-1-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH] task-arago-standaline-sdk-target: Fix PREFERRED_PROVIDER
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
X-List-Received-Date: Thu, 29 Nov 2012 01:00:34 -0000

* A PREFERRED_PROVIDER is set for jpeg. The jpeg provider depends on the ARM
  architecture.
* Therefore, the jpeg development library to use should also depend on which
  PREFERRED_PROVIDER has been set.
* This change fixes the "Multiple .bb files are due to be built which each
  provide jpeg" due to the proper development package not being chosen.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../tasks/task-arago-standalone-sdk-target.bb      |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb b/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
index 29b129d..cfce86e 100644
--- a/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
+++ b/meta-arago-extras/recipes-core/tasks/task-arago-standalone-sdk-target.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Target packages for the standalone SDK"
-PR = "r1"
+PR = "r2"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://${COREBASE}/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58 \
                     file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
@@ -21,7 +21,7 @@ RDEPENDS_${PN} = "\
     curl-dev \
     i2c-tools-dev \
     freetype-dev \
-    jpeg-dev \
+    ${@base_conditional('PREFERRED_PROVIDER_jpeg', 'libjpeg-turbo', 'libjpeg-turbo-dev', 'jpeg-dev', d)}  \
     lzo-dev \
     libopkg-dev \
     libpng-dev \
-- 
1.7.0.4


