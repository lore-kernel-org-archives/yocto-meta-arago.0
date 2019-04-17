Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 3718152A2B
	for <meta-arago@arago-project.org>;
	Wed, 17 Apr 2019 00:26:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 5C42A40BC1;
	Wed, 17 Apr 2019 00:26:26 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id v6Spn-NzYxQZ; Wed, 17 Apr 2019 00:26:26 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 44FFB40A2D;
	Wed, 17 Apr 2019 00:26:25 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 917F5169DEC;
	Tue, 16 Apr 2019 20:26:19 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 16 Apr 2019 20:26:19 -0400
Message-Id: <1555460779-51470-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-thud: add meta-filesystems and meta-virtualization layers
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
X-List-Received-Date: Wed, 17 Apr 2019 00:26:49 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-thud-config.txt      | 3 ++-
 configs/arago-thud-next-config.txt | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/configs/arago-thud-config.txt b/configs/arago-thud-config.txt
index a837758..2811b3b 100644
--- a/configs/arago-thud-config.txt
+++ b/configs/arago-thud-config.txt
@@ -5,7 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,thud,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
diff --git a/configs/arago-thud-next-config.txt b/configs/arago-thud-next-config.txt
index efa0a4a..1f6cf33 100644
--- a/configs/arago-thud-next-config.txt
+++ b/configs/arago-thud-next-config.txt
@@ -5,7 +5,8 @@ bitbake,git://git.openembedded.org/bitbake,1.40,HEAD
 meta-arago,git://arago-project.org/git/meta-arago.git,thud-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,thud,HEAD,layers=
-meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
+meta-virtualization,git://git.yoctoproject.org/meta-virtualization,thud,HEAD,layers=
+meta-openembedded,git://git.openembedded.org/meta-openembedded,thud,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome:meta-filesystems
 meta-ti,git://git.yoctoproject.org/meta-ti,thud-next,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,thud,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,thud,HEAD,layers=meta
-- 
2.7.4


