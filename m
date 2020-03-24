Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D7EB952A58
	for <meta-arago@arago-project.org>;
	Tue, 24 Mar 2020 15:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2DC0040BEF;
	Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id meYmcxuuX7RC; Tue, 24 Mar 2020 15:47:02 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EC2D840BCC;
	Tue, 24 Mar 2020 15:47:00 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id AC8B01718E8;
	Tue, 24 Mar 2020 11:47:00 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 24 Mar 2020 11:46:59 -0400
Message-Id: <1585064820-39907-3-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1585064820-39907-1-git-send-email-denys@ti.com>
References: <1585064820-39907-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 3/4] packagegroup-arago-tisdk-opencl: drop python-pyopencl python bindings
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
X-List-Received-Date: Tue, 24 Mar 2020 15:49:13 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
index c357f9c..0217705 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-opencl.bb
@@ -13,7 +13,6 @@ MAIN_PKGS = " \
 "
 
 EXTRA_PKGS = " \
-    python-pyopencl \
 "
 
 #    ti-fftw-examples
-- 
2.7.4


