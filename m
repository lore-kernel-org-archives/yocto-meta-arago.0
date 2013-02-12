Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f50.google.com (mail-oa0-f50.google.com
	[209.85.219.50])
	by arago-project.org (Postfix) with ESMTPS id 6735252A2E
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:54 +0000 (UTC)
Received: by mail-oa0-f50.google.com with SMTP id l20so7009369oag.9
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=m3vhgRwiprzqNGB7LUz8FHxHgmrK1wZnEEWBK4FZIsc=;
	b=bYLLQ0eg5GKDZXvwxKMAijWzzHQMpTkHnxP8MZGZVVy9dSS9H0oWbAo7T75yvALJ+N
	Fo5Mnzrc10RtS5aWlnp0VUdyGJvvoKG3ppsGVN6JEC8pRtuKAt1leuvn7UFZnHU1iuh/
	JVCa0zGaOJ82eBm8B5z3J47SoTFJyxmSDyciniDBCMu2B+x0+OkMcVTUiizqeWyTd6gJ
	PP4L1eHxH0zf2tsaXy7SWN/AUxmBqtT17f46AEQXLEOU1InmFP5VrX/yuaY/3WE6AmfH
	F+uaYWnwVqtuP5gb+0SoNOd/VlzKN4SEWQJuQjoEiVSCj+UP19XDubWDBU0KoGmVmmwB
	X4uw==
X-Received: by 10.60.32.33 with SMTP id f1mr12428301oei.122.1360630013886;
	Mon, 11 Feb 2013 16:46:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.52
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:52 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:16 -0600
Message-Id: <1360629979-24789-15-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 15/18] meta-toolchain-arago-tisdk: Set TOOLCHAIN_CLEANUP_PACKAGES
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:54 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Add TOOLCHAIN_CLEANUP_PACKAGES which list packages to remove from the
  toolchain sdk.
---
 .../meta/meta-toolchain-arago-tisdk.bb             |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
index 8666625..b7f3607 100644
--- a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -2,8 +2,9 @@ require recipes-core/meta/meta-toolchain-arago-qte.bb
 
 TOOLCHAIN_TARGET_TASK = "packagegroup-arago-toolchain-tisdk-target"
 TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}"
+TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
 
-PR = "r0"
+PR = "r1"
 
 toolchain_create_sdk_env_script_append() {
     echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
-- 
1.7.0.4


