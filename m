Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 640C152A6F
	for <meta-arago@arago-project.org>;
	Mon, 13 Apr 2020 22:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 76FA140C40;
	Mon, 13 Apr 2020 22:34:55 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id OhxlNxypFgof; Mon, 13 Apr 2020 22:34:55 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 628DC40C35;
	Mon, 13 Apr 2020 22:34:54 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 2B2781724AB;
	Mon, 13 Apr 2020 18:34:54 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Apr 2020 18:34:54 -0400
Message-Id: <1586817294-37587-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] Revert "optee-os: temporarily set default OPTEE_ARCH to null"
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
X-List-Received-Date: Mon, 13 Apr 2020 22:37:11 -0000

From: Denys Dmytriyenko <denys@ti.com>

This reverts commit 724a90af5143f487862bf6760bd51d6a218ecfc4.
---
 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
index 716a95c..2fb3e27 100644
--- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
+++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
@@ -6,8 +6,6 @@ SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
 BRANCH = "ti-optee-os"
 SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
 
-OPTEE_ARCH = "null"
-
 do_compile() {
     export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
     oe_runmake all PLATFORM=${OPTEEMACHINE} PLATFORM_FLAVOR=${OPTEEFLAVOR}
-- 
2.7.4


