Return-Path: <denis@denix.org>
Received: from vms173017pub.verizon.net (vms173017pub.verizon.net
	[206.46.173.17])
	by arago-project.org (Postfix) with ESMTPS id 3B8DE52A5F
	for <meta-arago@arago-project.org>;
	Wed,  9 Mar 2016 21:57:10 +0000 (UTC)
Received: from vz-proxy-l006.mx.aol.com ([64.236.82.154])
	by vms173017.mailsrvcs.net
	(Oracle Communications Messaging Server 7.0.5.32.0 64bit (built Jul 16
	2014)) with ESMTPA id <0O3S0037JKYKWW40@vms173017.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 09 Mar 2016 15:56:44 -0600 (CST)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.1 cv=EdU1O6SC c=1 sm=1 tr=0	a=Ut/DdBcw22SB5hFy08yqCQ==:117
	a=7OsogOcEt9IA:10 a=sozttTNsAAAA:8	a=HihYlcsHAAAA:8
	a=vBzV7GtnN3rv2l87i28A:9
Received: by 100.15.86.14 with SMTP id 73ffc6ad; Wed, 09 Mar 2016 21:56:44 GMT
Received: from localhost.localdomain (elrond [192.168.0.7])
	by gandalf.denix.org (Postfix) with ESMTP id B9CDB161EE8;	Wed,
	9 Mar 2016 16:56:43 -0500 (EST)
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Date: Wed, 09 Mar 2016 16:56:43 -0500
Message-id: <1457560603-17590-1-git-send-email-denis@denix.org>
X-Mailer: git-send-email 2.2.0
Subject: [PATCH] arago.conf: don't use --prefer-arch-to-version flag
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
X-List-Received-Date: Wed, 09 Mar 2016 21:57:10 -0000

From: Denys Dmytriyenko <denys@ti.com>

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index d175de3..a967577 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -4,6 +4,8 @@ DISTRO_VERSION = "2016.03"
 DISTRO_FEED_URI ?= "http://gtautoftp.gt.design.ti.com"
 FEEDURIPREFIX ?= "lcpd/core-sdk/nightly/deploy/ipk/"
 
+OPKG_ARGS_remove = "--prefer-arch-to-version"
+
 MIRRORS += " \
 ftp://.*/.*       http://arago-project.org/files/sources/ \n \
 https?$://.*/.*   http://arago-project.org/files/sources/ \n \
-- 
2.2.0


