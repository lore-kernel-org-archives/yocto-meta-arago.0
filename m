Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 74DE652AA4
	for <meta-arago@arago-project.org>;
	Mon, 13 Nov 2017 17:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 67A4E20B52;
	Mon, 13 Nov 2017 17:06:22 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ivda6Zf7guow; Mon, 13 Nov 2017 17:06:22 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 4893A20B4C;
	Mon, 13 Nov 2017 17:06:21 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id E080C16270B;
	Mon, 13 Nov 2017 12:06:20 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Nov 2017 12:06:20 -0500
Message-Id: <1510592780-4338-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] configs: pin meta-browser in morty/rocko due to chromium-wayland
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
X-List-Received-Date: Mon, 13 Nov 2017 17:06:22 -0000

From: Denys Dmytriyenko <denys@ti.com>

master removed old/existing version of chromium-wayland in preparation to upgrade

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-morty-config.txt          | 2 +-
 configs/arago-morty-next-config.txt     | 2 +-
 configs/arago-morty-next-rel-config.txt | 2 +-
 configs/arago-rocko-config.txt          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
index 59de4ed..f4014fd 100644
--- a/configs/arago-morty-config.txt
+++ b/configs/arago-morty-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-config.txt
index 46485ba..a855352 100644
--- a/configs/arago-morty-next-config.txt
+++ b/configs/arago-morty-next-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
diff --git a/configs/arago-morty-next-rel-config.txt b/configs/arago-morty-next-rel-config.txt
index 26ee079..dfd6f47 100644
--- a/configs/arago-morty-next-rel-config.txt
+++ b/configs/arago-morty-next-rel-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty-next-rel,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
diff --git a/configs/arago-rocko-config.txt b/configs/arago-rocko-config.txt
index 8ce7fff..2008c77 100644
--- a/configs/arago-rocko-config.txt
+++ b/configs/arago-rocko-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.36,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,master,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,26d50665e2f7223c5f4ad7481a8d2431e7cb55fb,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,rocko,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,rocko,HEAD,layers=meta-networking:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,master,HEAD,layers=
-- 
2.7.4


