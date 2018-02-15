Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 011A352986
	for <meta-arago@arago-project.org>;
	Thu, 15 Feb 2018 17:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id CE86420B48;
	Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ZJBUTxHj2JTY; Thu, 15 Feb 2018 17:13:38 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 72B3320B64;
	Thu, 15 Feb 2018 17:13:37 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 830FD1632B2;
	Thu, 15 Feb 2018 12:13:35 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 15 Feb 2018 12:13:33 -0500
Message-Id: <1518714813-23100-12-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1518714813-23100-1-git-send-email-denys@ti.com>
References: <1518714813-23100-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 12/12] voxelsdk: don't depend on python-dev, which python RPROVIDES
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
X-List-Received-Date: Thu, 15 Feb 2018 17:13:59 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
index fe27c16..ee20aee 100644
--- a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
+++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
@@ -32,7 +32,7 @@ EXTRA_OECMAKE += "-DDISTROFEATURE=ExcludePCL -DCMAKE_BUILD_TYPE=Debug -DPYTHON_I
 
 inherit pkgconfig cmake pythonnative python-dir
 
-DEPENDS = "libusb1 udev opencv boost python python-dev swig swig-native"
+DEPENDS = "libusb1 udev opencv boost python swig swig-native"
 
 RDEPENDS_${PN} = "libusb1 udev opencv"
 
-- 
2.7.4


