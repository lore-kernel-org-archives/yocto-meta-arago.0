Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f174.google.com (mail-ob0-f174.google.com
	[209.85.214.174])
	by arago-project.org (Postfix) with ESMTPS id C5C4852A67
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 02:28:10 +0000 (UTC)
Received: by mail-ob0-f174.google.com with SMTP id 16so948206obc.19
	for <meta-arago@arago-project.org>;
	Tue, 05 Feb 2013 18:28:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=c6E8NmN9qWdndcXL81HcINI2YQOHPr32mNXbX9Wwo2c=;
	b=VOmsu3MHoETDkNPXsqVoUbci6vtei8Xh4m7nIAAl1O2hOwb5CzcJuPTLAJYFyZek8E
	kR937WSLUl0Jh4ZHuyJb8M4vcOm82nKGnriaShPty/JDhjskZ46X65VoWe4A06THKQYP
	AQgvdISwBShpuo4IOZuj8gxM49CYgeZQT4q0WLT8ttD60OX64VCGqkvvqxJpHZbqvQ4k
	W4RF125kvqVzcfIaVKw3b4iZ8VqilV3Mp11/1Uy0upZeoZi6vznBA7REF5qK+hxZIL7Y
	OFt9swWLL1TZJBxSxFLcvqCVbdIYndiC0GmQNsNqfREwBJWzwmdos7Oa2yXFIb0bODSu
	jCMg==
X-Received: by 10.60.32.143 with SMTP id j15mr20939225oei.7.1360117690346;
	Tue, 05 Feb 2013 18:28:10 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id 9sm3307205oeh.8.2013.02.05.18.28.07
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 18:28:09 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Tue,  5 Feb 2013 20:27:57 -0600
Message-Id: <1360117678-4395-3-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360117678-4395-1-git-send-email-fcooper@ti.com>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 3/4] packagegroup-arago-qte-toolchain-target: Use packagegroup instead of task
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
X-List-Received-Date: Wed, 06 Feb 2013 02:28:11 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Use the new name for task-arago-standalone-sdk-target since it has been
  renamed to packagegroup-arago-standalone-sdk-target.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../packagegroup-arago-qte-toolchain-target.bb     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
index d0f9688..6603652 100644
--- a/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
+++ b/meta-arago-extras/recipes-core/packagegroups/packagegroup-arago-qte-toolchain-target.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Target packages for Qt Embedded SDK"
 LICENSE = "MIT"
 ALLOW_EMPTY = "1"
 
-PR = "r4"
+PR = "r5"
 
 inherit packagegroup
 
@@ -16,7 +16,7 @@ QT_SGX_SUPPORT = "\
 "
 
 RDEPENDS_${PN} += " \
-        task-arago-standalone-sdk-target \
+        packagegroup-arago-standalone-sdk-target \
         qt4-embedded-mkspecs \
         libqt-embeddedmultimedia4-dev \
         libqt-embeddedphonon4-dev \
-- 
1.7.0.4


