Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id 6277E52A19
	for <meta-arago@arago-project.org>;
	Thu,  1 Jun 2017 18:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 33FEB20B7A;
	Thu,  1 Jun 2017 18:43:08 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id p0T-Rj0UczHz; Thu,  1 Jun 2017 18:43:08 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 136B7202B6;
	Thu,  1 Jun 2017 18:43:07 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 929DC1624DB;
	Thu,  1 Jun 2017 14:43:06 -0400 (EDT)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Thu,  1 Jun 2017 14:43:06 -0400
Message-Id: <1496342586-121308-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [oe-layersetup][PATCH] arago-morty*: switch meta-browser to master
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
X-List-Received-Date: Thu, 01 Jun 2017 18:43:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/arago-morty-config.txt      | 2 +-
 configs/arago-morty-next-config.txt | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/arago-morty-config.txt b/configs/arago-morty-config.txt
index af42c22..59de4ed 100644
--- a/configs/arago-morty-config.txt
+++ b/configs/arago-morty-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,morty,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
diff --git a/configs/arago-morty-next-config.txt b/configs/arago-morty-next-config.txt
index 5ab5a8b..46485ba 100644
--- a/configs/arago-morty-next-config.txt
+++ b/configs/arago-morty-next-config.txt
@@ -3,7 +3,7 @@
 
 bitbake,git://git.openembedded.org/bitbake,1.32,HEAD,layers=
 meta-arago,git://arago-project.org/git/meta-arago.git,morty-next,HEAD,layers=meta-arago-distro:meta-arago-extras
-meta-browser,git://github.com/OSSystems/meta-browser.git,morty,HEAD,layers=
+meta-browser,git://github.com/OSSystems/meta-browser.git,master,HEAD,layers=
 meta-openamp,git://github.com/OpenAMP/meta-openamp.git,morty,HEAD,layers=
 meta-qt5,git://github.com/meta-qt5/meta-qt5.git,morty,HEAD,layers=
 meta-openembedded,git://git.openembedded.org/meta-openembedded,morty,HEAD,layers=meta-networking:meta-ruby:meta-python:meta-oe:meta-gnome
-- 
2.7.4


