Return-Path: <jake@udc0866934>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 0E38952A52
	for <meta-arago@arago-project.org>;
	Fri,  9 Oct 2015 14:34:20 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t99EYKJK004109
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:34:20 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EYJiP027928
	for <meta-arago@arago-project.org>; Fri, 9 Oct 2015 09:34:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 9 Oct 2015 09:34:20 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t99EYJE6012228;
	Fri, 9 Oct 2015 09:34:19 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1ZkYkV-0001BS-Jb; Fri, 09 Oct 2015 10:34:19 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Fri, 9 Oct 2015 10:34:15 -0400
Message-ID: <1444401255-4511-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1444401255-4511-1-git-send-email-j-stiffler@ti.com>
References: <1444401255-4511-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-am43x: Set "devtype" to "mmc" for all boot methods
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
X-List-Received-Date: Fri, 09 Oct 2015 14:34:26 -0000
Content-Type: text/plain

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am43x.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 329e3d7..502af43 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -139,6 +139,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
@@ -148,6 +149,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"U-Boot#\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
+		do_expect "\"U-Boot#\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run mmcargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"U-Boot#\"" "send \"saveenv\"" $cwd/setupBoard.minicom
-- 
1.9.1


