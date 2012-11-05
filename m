Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 82D4F5208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:03 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=USY61uU8HVH6+R//wfNu7Ujwx8t9M7NtKkWkQltWhOA=;
	b=A9bVYpFq0BgcrYdjwOBBcAf639X3z1cqMjpGGHniIAGfTBOX5GM/D9cHWzkaoEq3K9
	Cg1dfv4JwtUl93pV02S/3Y182m/HjI61Nymr6KLzgisLNkFbAK15Od65AT+C+2eJJhLG
	LHvjD8087kbzEMMH2Yh9Ft48ebsC2RlcovQyf/yFqWitRo7b/dvbQiddRqjlLiK1i447
	o7ZFFLdzfvwrPWdhs2LLIOxTClx9l+KI1umzqpTMnMov/aZUb3oKjafF4tc6WLdEkFNK
	kQ/7AdAcLswkSqflu5K23/mUK3wv8suwhfwFu6SCIwHURRKICw0ovIEWfFAbdG/YWCaZ
	h3pw==
Received: by 10.60.171.41 with SMTP id ar9mr6945544oec.16.1352080443231;
	Sun, 04 Nov 2012 17:54:03 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:02 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:08 -0600
Message-Id: <1352080417-9792-11-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 13/42] arago-amsdk-image: Add task-arago-tisdk-amsdk-sdk-host
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:04 -0000

* Add amsdk task which pulls in SDK specific scripts, files and applications.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 6ddcb8b..05778dd 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -22,6 +22,7 @@ IMAGE_INSTALL = "\
     task-arago-tisdk-matrix-sdk-host \
     task-arago-tisdk-multimedia-sdk-host \
     task-arago-tisdk-qte-sdk-host \
+    task-arago-tisdk-amsdk-sdk-host \
 "
 
 export IMAGE_BASENAME = "arago-amsdk-image"
-- 
1.7.0.4


