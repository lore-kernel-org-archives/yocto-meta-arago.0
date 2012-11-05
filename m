Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id 535D25208C
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:12 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=K9f87fcINZzDSDZf4yK6WLk3jSShzwMtxTMTkadlZMY=;
	b=btOYqVxYfM59JazrvrmNtfVOdh9gV4QtiJRohTH4mfkRTYDMfNR8E1HurcIWjropCf
	s+po2X29W9RqpL700c9cwNl6LQ5tWYyfaoA3NZMfEIfRll2zlEiQHnI9wNPi/73jo103
	O56NeO2P6w4XqizS8uQnqOioejCHEzE9SxfK4MaxudSRbUIu8U+qopSDZAy2+8CK/H0B
	j54g6+NwOda5DpIPKQXisPqxuuJ6w6w3b0YKxE5pxWGeyXWu3MrDNKSbfHIPMOPaO9VU
	0pmyJHnrZPd0yXlG15yfSq2ndRw28lhTjYgAfITos9XlCa2hakRKkaPLPGxJiwGQ5gK0
	owLQ==
Received: by 10.60.7.41 with SMTP id g9mr6586864oea.18.1352080452063;
	Sun, 04 Nov 2012 17:54:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:11 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:16 -0600
Message-Id: <1352080417-9792-19-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 21/42] meta-toolchain-arago-tisdk: Add Arago SDK specific toolchain recipe
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:13 -0000

* Add a meta toolchain recipe that builds on top of meta-toolchain-arago-qte
  but includes components and tasks specific to the Arago SDK.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../meta/meta-toolchain-arago-tisdk.bb             |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb

diff --git a/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
new file mode 100644
index 0000000..46c77bf
--- /dev/null
+++ b/meta-arago-distro/recipes-core/meta/meta-toolchain-arago-tisdk.bb
@@ -0,0 +1,10 @@
+require recipes-core/meta/meta-toolchain-arago-qte.bb
+
+TOOLCHAIN_TARGET_TASK = "task-arago-toolchain-tisdk-target"
+TOOLCHAIN_OUTPUTNAME = "${SDK_NAME}-${ARMPKGARCH}-${TARGET_OS}-tisdk-${SDK_ARCH}"
+
+PR = "r0"
+
+toolchain_create_sdk_env_script_append() {
+    echo -e 'export PS1="\[\\e[32;1m\][linux-devkit]\[\\e[0m\]:\w> "' >> $script
+}
-- 
1.7.0.4


