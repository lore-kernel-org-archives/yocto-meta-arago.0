Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id C36805299A
	for <meta-arago@arago-project.org>;
	Tue, 30 May 2017 17:59:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id AF95D208B1;
	Tue, 30 May 2017 17:59:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id ctSqB7xtnrDM; Tue, 30 May 2017 17:59:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 8E985207AF;
	Tue, 30 May 2017 17:59:48 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id F10421624D2;
	Tue, 30 May 2017 13:59:47 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Tue, 30 May 2017 13:59:47 -0400
Message-Id: <1496167187-3521-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-morty*: add meta-openamp layer
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
X-List-Received-Date: Tue, 30 May 2017 17:59:50 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-morty-config.txt      | 1 +
 configs/arago-morty-next-config.txt | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
index 699886c..af42c22 100644
--- a/configs/arago-morty-config.txt
+++ b/configs/arago-morty-config.txt
@@ -4,6 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,morty,HEAD,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty,HEAD,layers=
diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-config.txt
index 7365d06..5ab5a8b 100644
--- a/configs/arago-morty-next-config.txt
+++ b/configs/arago-morty-next-config.txt
@@ -4,6 +4,7 @@
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
 meta-browser,git://github.com/OSSystems/meta-browser.git,morty,HEAD,layers=
+meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
 meta-ti,git://git.yoctoproject.org/meta-ti,morty-next,HEAD,layers=
-- 
2.7.4


