Return-Path: <tom.rini@gmail.com>
Received: from mail-qa0-f49.google.com (mail-qa0-f49.google.com
	[209.85.216.49])
	by arago-project.org (Postfix) with ESMTPS id 744235299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:26:28 +0000 (UTC)
Received: by mail-qa0-f49.google.com with SMTP id i13so745170qae.15
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 11:26:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id:in-reply-to:references;
	bh=7LRHMYTMLjnKnr6g7XvhDyeaoKrSmpERKlK6qwjM8Bw=;
	b=Hf0/nzDzLIUFFotR9e/WEKKQnShsOINI8elQfdOYpPq6rhgXBOxxkZtrTIrR7aas0r
	mbEoENH2P1WaXZWanZ7k9ljo1KhmO0TCG3OqxU1lngIcyFlwGSviJDgGuE4tzXPhtbMt
	YgjOuc4G8fz/Q//x7XxMo9ojdoi7lLuRau1w+yUPTSNQcq94ciG7z/2O4IBnRt07QSPc
	KsKckLVmowYwW6mqWDrXtqv/JRpRq93Y1i8MaCSdd/i/6VBP8BZaLpWBNek/S0uePJSQ
	nZM2R/nxQJAd/95FF09qYflqXGD8osmCUTNepu0ngaDukSrooIM9lXv9Gh7o2p6kBgD4
	uiAg==
X-Received: by 10.224.11.7 with SMTP id r7mr5834549qar.91.1382552788288;
	Wed, 23 Oct 2013 11:26:28 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id 5sm63987969qao.3.2013.10.23.11.26.26
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 11:26:27 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 23 Oct 2013 14:26:15 -0400
Message-Id: <1382552778-29138-2-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1382552778-29138-1-git-send-email-trini@ti.com>
References: <1382552778-29138-1-git-send-email-trini@ti.com>
Subject: [PATCH 1/3] busybox: add /usr/bin/stat applet
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
X-List-Received-Date: Wed, 23 Oct 2013 18:26:28 -0000

From: Andy Ross <andy.ross@windriver.com>

The busybox defconfig lacks a stat tool, the functionality of which
cannot be reproduced in a way accessible to a shell script running in
a minimal configuration.  Enable, and modify the installation path to
/usr/bin/stat to match the coreutils tool for proper alternatives
handling.

Signed-off-by: Andy Ross <andy.ross@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
[trini: Import ef7e123 from openembedded-core, so just a defconfig
change]
Signed-off-by: Tom Rini <trini@ti.com>
---
 .../recipes-core/busybox/busybox/defconfig         |    4 ++--
 .../recipes-core/busybox/busybox_1.20.2.bbappend   |    2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta-arago-distro/recipes-core/busybox/busybox/defconfig b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
index adafe0b..a54c32d 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox/defconfig
+++ b/meta-arago-distro/recipes-core/busybox/busybox/defconfig
@@ -264,8 +264,8 @@ CONFIG_SORT=y
 CONFIG_FEATURE_SORT_BIG=y
 # CONFIG_SPLIT is not set
 # CONFIG_FEATURE_SPLIT_FANCY is not set
-# CONFIG_STAT is not set
-# CONFIG_FEATURE_STAT_FORMAT is not set
+CONFIG_STAT=y
+CONFIG_FEATURE_STAT_FORMAT=y
 CONFIG_STTY=y
 # CONFIG_SUM is not set
 CONFIG_SYNC=y
diff --git a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
index be174ef..d3ff409 100644
--- a/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
+++ b/meta-arago-distro/recipes-core/busybox/busybox_1.20.2.bbappend
@@ -1,7 +1,7 @@
 # look for files in this layer first
 FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
 
-PR_append = "-arago9"
+PR_append = "-arago10"
 
 SRC_URI += " \
 	file://inetd \
-- 
1.7.9.5


