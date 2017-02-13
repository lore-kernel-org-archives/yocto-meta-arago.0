Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id E006E52999
	for <meta-arago@arago-project.org>;
	Mon, 13 Feb 2017 23:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EA49C20B52;
	Mon, 13 Feb 2017 23:52:52 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id JHViZNghdqjs; Mon, 13 Feb 2017 23:52:52 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id C8D33209A4;
	Mon, 13 Feb 2017 23:52:51 +0000 (UTC)
Received: from gimli.denix (pippin [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 059CB162325;
	Mon, 13 Feb 2017 18:52:51 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Mon, 13 Feb 2017 18:52:50 -0500
Message-Id: <1487029970-104658-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.7.4
Subject: [tisdk-build-scripts][PATCH] farm/arago-morty-next: add morty-next config
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
X-List-Received-Date: Mon, 13 Feb 2017 23:52:53 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 configs/farm/{arago-morty.txt => arago-morty-next.txt} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 copy configs/farm/{arago-morty.txt => arago-morty-next.txt} (99%)

diff --git a/configs/farm/arago-morty.txt b/configs/farm/arago-morty-next.txt
similarity index 99%
copy from configs/farm/arago-morty.txt
copy to configs/farm/arago-morty-next.txt
index b419b20..58a1eba 100644
--- a/configs/farm/arago-morty.txt
+++ b/configs/farm/arago-morty-next.txt
@@ -59,7 +59,7 @@ SCRIPTS_ROOT="$PWD"
 #       - BUILD_ROOT/arm9-1/arago-tmp
 #       - BUILD_ROOT/cortex-1/arago-tmp
 #       - BUILD_ROOT/cortex-2/arago-tmp
-BUILD_ROOT="/OE/farm-arago-morty"
+BUILD_ROOT="/OE/farm-arago-morty-next"
 
 # This variable points to the base location where files will be extracted for
 # testing purposes.  This should not be confused with the NFS root which
@@ -123,7 +123,7 @@ CLEAN_ALL="false"
 
 # This is the configuration file to use in the oe-layertool-setup.sh script
 # to configure the build.
-CONFIG_FILE="${BUILD_ROOT}/configs/arago-morty-config.txt"
+CONFIG_FILE="${BUILD_ROOT}/configs/arago-morty-next-config.txt"
 
 # This directory will contain the log files for the various parts of the build.
 # This includes:
-- 
2.7.4


