Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 5D85F52986
	for <meta-arago@arago-project.org>;
	Tue,  6 Mar 2018 04:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C0B8620A8A;
	Tue,  6 Mar 2018 04:02:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 5BOYtdKLUpfK; Tue,  6 Mar 2018 04:02:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8BFD02098D;
	Tue,  6 Mar 2018 04:02:50 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id DA3D4163310;
	Mon,  5 Mar 2018 23:02:49 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Mon,  5 Mar 2018 23:02:47 -0500
Message-Id: <1520308967-16965-2-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520308967-16965-1-git-send-email-denys@ti.com>
References: <1520308967-16965-1-git-send-email-denys@ti.com>
Subject: [rocko/master][PATCH 2/2] external-linaro-toolchain: update custom linux-libc-headers to 4.14.24
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
X-List-Received-Date: Tue, 06 Mar 2018 04:03:33 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/meta/external-linaro-toolchain.bbappend              | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
index 0120c12..fa3210b 100644
--- a/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
+++ b/meta-arago-distro/recipes-core/meta/external-linaro-toolchain.bbappend
@@ -3,8 +3,8 @@
 # on linux-libc-headers creates circular dependencies now. Mostly
 # duplication of code from corresponding recipe.
 
-BRANCH = "ti-lsk-linux-4.9.y"
-SRCREV = "1c74e8801cf58a30394ae92236895599f2c77253"
+BRANCH = "ti-lsk-linux-4.14.y"
+SRCREV = "57341df0b46c6be612d7487fb0a1df8b056449d8"
 
 KERNEL_GIT_URI = "git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git"
 KERNEL_GIT_PROTOCOL = "git"
-- 
2.7.4


