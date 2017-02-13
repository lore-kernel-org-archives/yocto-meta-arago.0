Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id DD97C52979
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:40:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id C7B7820B52;
	Mon, 13 Feb 2017 23:40:54 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id jkZOHIEgTGMy; Mon, 13 Feb 2017 23:40:54 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id A72CB209A4;
	Mon, 13 Feb 2017 23:40:53 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 3B903162325;
	Mon, 13 Feb 2017 18:40:53 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:40:52 -0500
Message-Id: <1487029252-103710-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-morty-next-config: add config for morty-next
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
X-List-Received-Date: Mon, 13 Feb 2017 23:40:55 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/{arago-morty-config.txt => arago-morty-next-config.txt} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/{arago-morty-config.txt => arago-morty-next-config.txt} (78%)

diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-next-config.txt
similarity index 78%
copy from configs/arago-morty-config.txt
copy to configs/arago-morty-next-config.txt
index f3b1e3a..db8fbf3 100644
--- a/configs/arago-morty-config.txt
+++ b/configs/arago-morty-next-config.txt
@@ -2,10 +2,10 @@
 # repo name,repo uri,repo branch,repo commit[,layers=layer1:layer2...:layern]
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
-meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
+meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe
-meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
+meta-ti,git://git.yoctoproject.org/meta-ti,morty-next,HEAD,layers=
 meta-linaro,git://git.linaro.org/openembedded/meta-linaro.git,morty,HEAD,layers=meta-linaro-toolchain:meta-optee
 oe-core,git://git.openembedded.org/openembedded-core,morty,HEAD,layers=meta
 OECORELAYERCONF=./sample-files/bblayers.conf.sample
-- 
2.7.4


