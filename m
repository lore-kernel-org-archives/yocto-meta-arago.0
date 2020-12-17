Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 1C5DB529F2
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 21:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A33F540B98
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 21:42:27 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 3MfiItgtu8sc for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 21:42:27 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 90AB340A0B
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 21:42:27 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 473E3174512;
	Thu, 17 Dec 2020 16:42:27 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 17 Dec 2020 16:42:26 -0500
Message-Id: <1608241346-15755-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [dunfell/master][PATCH] optee-os: as meta-ti now has upstream 3.11, drop local fork
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
X-List-Received-Date: Thu, 17 Dec 2020 21:42:35 -0000

There's no need for ti-optee-os fork any more, as it's exactly the same as upstream

Signed-off-by: Denys Dmytriyenko <denis@denix.org>
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 7 -------
 1 file changed, 7 deletions(-)
 delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
deleted file mode 100644
index 677c6dd..0000000
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ /dev/null
@@ -1,7 +0,0 @@
-PR_append = ".arago0"
-
-SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
-           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
-"
-BRANCH = "ti-optee-os"
-SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
-- 
2.7.4


