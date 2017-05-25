Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C32F652A8C
	for <meta-arago@arago-project.org>;
	Thu, 25 May 2017 19:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 03ABF20BFD;
	Thu, 25 May 2017 19:03:09 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id F6IIJP7RGWui; Thu, 25 May 2017 19:03:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id DE04A20BAF;
	Thu, 25 May 2017 19:03:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 7D5DE161A52;
	Thu, 25 May 2017 15:03:07 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu, 25 May 2017 15:03:04 -0400
Message-Id: <1495738985-4472-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH 1/2] coresdk-2017.00: lock down bitbake commit
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
X-List-Received-Date: Thu, 25 May 2017 19:03:09 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/coresdk/coresdk-2017.00-config.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/coresdk/coresdk-2017.00-config.txt b/configs/coresdk/coresdk-2017.00-config.txt
index 7acc0b5..6210bbf 100644
--- a/configs/coresdk/coresdk-2017.00-config.txt
+++ b/configs/coresdk/coresdk-2017.00-config.txt
@@ -1,7 +1,7 @@
 # This file takes repo entries in the format
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
-bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
+bitbake,git://git.openembedded.org/bitbake,1.32,bdf7a362ecdafd47f309b7a21feac4b94624f287,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,ti2017.00,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,morty,7d37ae2adec5cc5ea27367ce125bc7bce2310ca1,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,3601fd2c5306ac6d5d0d536e0be8cbb90da9b4c1,layers=
-- 
2.7.4


