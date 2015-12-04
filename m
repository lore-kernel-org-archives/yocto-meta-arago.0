Return-Path: <jake@udc0866934>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 159BD52AC3
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 15:01:17 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4F1GLR011667
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:16 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1GUq003149
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 09:01:16 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 09:01:15 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4F1FcP012987;
	Fri, 4 Dec 2015 09:01:15 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1a4rrH-0001eS-CM; Fri, 04 Dec 2015 10:01:15 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 4 Dec 2015 10:01:09 -0500
Message-ID: <1449241270-6294-5-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 4/5] setup-tftp: Copy pmmc-firmware if available
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
X-List-Received-Date: Fri, 04 Dec 2015 15:01:18 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-tftp.sh | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/setup-tftp.sh b/setup-tftp.sh
index 714968f..d675ba4 100644
--- a/setup-tftp.sh
+++ b/setup-tftp.sh
@@ -159,6 +159,9 @@ copy_to_tftproot "$uboot_gph_files"
 monfiles=`cd $prebuiltimagesdir;ls -1 skern*.bin 2> /dev/null`
 copy_to_tftproot "$monfiles"
 
+pmmcfiles=`cd $prebuiltimagesdir;ls -1 pmmc*.bin 2> /dev/null`
+copy_to_tftproot "$pmmcfiles"
+
 echo
 if [ -f $tftpcfg ]; then
     echo "$tftpcfg already exists.."
-- 
1.9.1


