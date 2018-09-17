Return-Path: <jake@udc0866934>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 7B935529CA
	for <meta-arago@arago-project.org>;
	Mon, 17 Sep 2018 14:00:01 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8HDxrRj032387
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:59:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537192793;
	bh=shZ8ceOX5OqO0kiw3jL8/Icg98YqnnLgn0+AixCtV2s=;
	h=From:To:CC:Subject:Date;
	b=uPw/4dNg0VLC8gvOu9U3a/KkvIOv2BQmoM7jPnT2+umh6pc7WE415slkNeqyuhcpV
	ShzbTpFjx+RxhQwuxEBW2ozhBpEs5wotIXxQsYO54VKTJsavVJhgQ7bm4Q3TBHDgZ0
	Rzq5AWEtkKyU77YliB/HjRkQ+ZUx7deKxR83KtqQ=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDxrMA026961
	for <meta-arago@arago-project.org>; Mon, 17 Sep 2018 08:59:53 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 17 Sep 2018 08:59:53 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 17 Sep 2018 08:59:53 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8HDxqII000616;
	Mon, 17 Sep 2018 08:59:52 -0500
Received: from jake by udc0866934 with local (Exim 4.82)
	(envelope-from <jake@udc0866934>)
	id 1g1u48-00052l-5l; Mon, 17 Sep 2018 09:59:52 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 17 Sep 2018 09:59:50 -0400
Message-ID: <1537192790-19355-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am335x: run init_console while booting
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
X-List-Received-Date: Mon, 17 Sep 2018 14:00:01 -0000
Content-Type: text/plain

* Running the init_console routine is needed as all am335x boards do
  not use the same console.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-am335x.sh | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index 6950caf..80b0a52 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -189,7 +189,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -198,7 +198,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
@@ -211,7 +211,7 @@ else
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'setenv autoload no; mmc rescan; run findfdt; run init_console; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	    else
@@ -219,7 +219,7 @@ else
 		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv bootfile zImage\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'mmc rescan; run findfdt; run init_console; run getuenv; setenv devtype mmc; run loadimage; run loadfdt; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 
-- 
1.9.1


