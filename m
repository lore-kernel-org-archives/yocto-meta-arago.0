Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id BFACE52968
	for <meta-arago@arago-project.org>;
	Thu,  6 Dec 2018 20:48:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 8ED6F409A0;
	Thu,  6 Dec 2018 20:47:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id Jis7J9hU0gfD; Thu,  6 Dec 2018 20:47:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 49C8F40020;
	Thu,  6 Dec 2018 20:47:51 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id B13201671CE;
	Thu,  6 Dec 2018 15:47:50 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  6 Dec 2018 15:47:48 -0500
Message-Id: <1544129268-55362-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [master][PATCH] arm-compute-library: also un-hardcode ARM64 toolchain
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
X-List-Received-Date: Thu, 06 Dec 2018 20:48:04 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/arm-compute-library/arm-compute-library_git.bb       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
index a8904cf..b82d618 100644
--- a/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
+++ b/meta-arago-extras/recipes-support/arm-compute-library/arm-compute-library_git.bb
@@ -30,6 +30,7 @@ S = "${WORKDIR}/git"
 
 do_compile_prepend() {
     sed -i 's/arm-linux-gnueabihf-/${TOOLCHAIN_SYS}-/' SConstruct
+    sed -i 's/aarch64-linux-gnu-/${TOOLCHAIN_SYS}-/' SConstruct
     sed -i "s#env.Append(LINKFLAGS = \['-fopenmp'\])#env.Append(LINKFLAGS = \['-fopenmp','--sysroot=${STAGING_DIR_TARGET}'\])#" SConstruct
     unset CC CXX
 }
-- 
2.7.4


