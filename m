Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f49.google.com (mail-oa0-f49.google.com
	[209.85.219.49])
	by arago-project.org (Postfix) with ESMTPS id E170A52AB3
	for <meta-arago@arago-project.org>;
	Fri,  1 Mar 2013 03:11:07 +0000 (UTC)
Received: by mail-oa0-f49.google.com with SMTP id j6so4873464oag.8
	for <meta-arago@arago-project.org>;
	Thu, 28 Feb 2013 19:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=8yIDw61W65tUBQ8eOCKlNLYOCYm3H+VZqxfoAY+yWYk=;
	b=d9vyYkA6Wojd8o6LOhHg8biuVapnJVNI0735FlrNOrAGtvJnxt0e5X8jOTAZAJrStZ
	G9MGPv1Y6Oew1QUu+w6mrM8aK0iVKiX0PbjYGj+oVEdR1yiUcMrFgduxQLFJegbc/03l
	mURZJVl9HYgnggPhmD5euCquItxP52QcEClf43M+TgrczVeTbFddz3ZHE6R1WmxpTGgb
	+8NFHDY/NuqX0R2h3ZbLdgEzv9juisxvQE2KYflpsar825DxH64ZPKOyaQS4LmaXw9mS
	SgfiIAGoUdRTMZw1YuVvkTY01Vf0JoRXymw1ffvyStuAv1vdbWP7hbo5YGaOCM2FWObk
	I1XA==
X-Received: by 10.60.20.35 with SMTP id k3mr7313721oee.119.1362107467599;
	Thu, 28 Feb 2013 19:11:07 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id i19sm15854877obf.0.2013.02.28.19.11.05
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Thu, 28 Feb 2013 19:11:06 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Thu, 28 Feb 2013 21:10:44 -0600
Message-Id: <1362107447-11234-6-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1362107447-11234-1-git-send-email-fcooper@ti.com>
References: <1362107447-11234-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 6/9] nativesdk-packagegroup-arago-sdk-host: Fix No module named distutils
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
X-List-Received-Date: Fri, 01 Mar 2013 03:11:08 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Fix "ImportError: No module named distutils" error by adding missing package.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../nativesdk-packagegroup-arago-sdk-host.bb       |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
index a6c89fd..1db12aa 100644
--- a/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bb
@@ -1,5 +1,5 @@
 DESCRIPTION = "Host packages for a standalone Arago SDK or external toolchain"
-PR = "r3"
+PR = "r4"
 LICENSE = "MIT"
 
 inherit nativesdk packagegroup
@@ -8,4 +8,5 @@ RDEPENDS_${PN} = "\
     nativesdk-pkgconfig \
     nativesdk-opkg \
     nativesdk-libtool \
+    nativesdk-python-distutils \
     "
-- 
1.7.0.4


