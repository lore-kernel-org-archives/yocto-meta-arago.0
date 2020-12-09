Return-Path: <c-robey@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 14DE152968
	for <meta-arago@arago-project.org>;
	Wed,  9 Dec 2020 19:18:23 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JIHPk077167
	for <meta-arago@arago-project.org>; Wed, 9 Dec 2020 13:18:17 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607541497;
	bh=6ABzoxSFT/MJVpxHw6yKGVnOPL4wqf2mTWa1jCLvXjk=;
	h=From:To:CC:Subject:Date;
	b=ut5FtgcDR+z0scgifsj57gnRBwUVWjXao4fdxnj78l/ynp2yvGNqCVrGP1BvmVex2
	tW1Gi+5lqQMltyrtmHUehJqzitJrXmTSs34C/EnG+jLhXIsY73l729IA2KT39lz2l+
	ADfAocchxvkR7rq9CbuXc5Gu8EFHiyhuDI1BvBH4=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0B9JIH9A076405
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 9 Dec 2020 13:18:17 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 9 Dec 2020 13:18:17 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 9 Dec 2020 13:18:16 -0600
Received: from fllv0103.dal.design.ti.com (fllv0103.dal.design.ti.com
	[10.247.120.73])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0B9JIGDV116783;
	Wed, 9 Dec 2020 13:18:16 -0600
Received: from localhost ([10.250.64.178])
	by fllv0103.dal.design.ti.com (8.14.7/8.14.7) with ESMTP id
	0B9JIGP0071392; Wed, 9 Dec 2020 13:18:16 -0600
From: Caleb Robey <c-robey@ti.com>
To: <meta-arago@arago-project.org>
Date: Wed, 9 Dec 2020 13:18:15 -0600
Message-ID: <20201209191815.22466-1-c-robey@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Thu, 10 Dec 2020 12:42:13 +0000
Cc: a0232989 <a0232989@ti.com>, a0132237 <a0132237@ti.com>
Subject: [PATCH] [meta-ti][dunfell/master][PATCH] set serverip after dhcp
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
X-List-Received-Date: Wed, 09 Dec 2020 19:18:23 -0000
Content-Type: text/plain

From: a0232989 <a0232989@ti.com>

There is a documented issue where the u-boot dhcp command,
when autoboot is set to "no", will reset serverip to the
gateway ip address. This is a workaround that should not
have any negative affect on these scripts and will prevent
this issue for occuring.

Issue:
https://stackoverflow.com/questions/13975468/in-u-boot-can-the-dhcp-command-automatically-set-the-serverip-environment-varia

Note: we display this behavior in older scripts, but dropped
the nomenclature lately and default NFS setups do not work
out of the box as a result.

Signed-off-by: Caleb Robey <c-robey@ti.com>
---
 setup-uboot-env-am335x.sh     | 4 ++--
 setup-uboot-env-am43x.sh      | 2 +-
 setup-uboot-env-am57xx-evm.sh | 2 +-
 setup-uboot-env-am65x.sh      | 5 ++---
 4 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/setup-uboot-env-am335x.sh b/setup-uboot-env-am335x.sh
index f129875..687461b 100644
--- a/setup-uboot-env-am335x.sh
+++ b/setup-uboot-env-am335x.sh
@@ -189,7 +189,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
@@ -198,7 +198,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv bootfile $kernelimage\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv ip_method none\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no; dhcp ; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run init_console; run getuenv; setenv autoload no; dhcp ;setenv serverip $ip; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run args_mmc; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	fi
diff --git a/setup-uboot-env-am43x.sh b/setup-uboot-env-am43x.sh
index 24bc58a..8b8254b 100644
--- a/setup-uboot-env-am43x.sh
+++ b/setup-uboot-env-am43x.sh
@@ -144,7 +144,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv devtype mmc\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'setenv devnum \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip; tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
diff --git a/setup-uboot-env-am57xx-evm.sh b/setup-uboot-env-am57xx-evm.sh
index 323c134..dfd9486 100644
--- a/setup-uboot-env-am57xx-evm.sh
+++ b/setup-uboot-env-am57xx-evm.sh
@@ -156,7 +156,7 @@ if [ "$kernel" -eq "1" ]; then
 		do_expect "\"$prompt\"" "send \"setenv ip_method dhcp\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv nfsopts 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"setenv getuenv 'mmc dev \${mmcdev}; if mmc rescan; then if run loadbootenv; then run importbootenv; fi; fi;'\"" $cwd/setupBoard.minicom
-		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
+		do_expect "\"$prompt\"" "send setenv bootcmd 'run findfdt; run getuenv; setenv autoload no;dhcp ;setenv serverip $ip;tftp \${loadaddr} $kernelimage; tftp \${fdtaddr} \${fdtfile}; run netargs; bootz \${loadaddr} - \${fdtaddr}'" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 		do_expect "\"$prompt\"" "send \"boot\"" $cwd/setupBoard.minicom
 	else
diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index b6e043b..60045ae 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -144,14 +144,13 @@ do_expect "\"$prompt\"" "send \"reset\"" $cwd/setupBoard.minicom
 do_expect "\"stop autoboot:\"" "send \" \"" $cwd/setupBoard.minicom
 
 # Configurable settings
-do_expect "\"$prompt\"" "send \"setenv serverip $ip\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv nfs_root $rootpath\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 
 # General macros
 do_expect "\"$prompt\"" "send \"setenv bootcmd 'run findfdt; run envboot; run setup_\${kern_boot}; run init_\${rootfs_boot}; run get_kern_\${kern_boot}; run get_fdt_\${kern_boot}; run get_overlay_\${kern_boot}; run run_kern'\"" $cwd/setupBoard.minicom
 
-do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp; setenv serverip $ip'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs console=\${console} \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
@@ -159,7 +158,7 @@ do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};
 
 do_expect "\"$prompt\"" "send \"setenv nfs_options 'nolock,v3,tcp,rsize=4096,wsize=4096'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv setup_mmc ''\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv setup_net 'setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv setup_net 'setenv autoload no; dhcp; setenv serverip $ip'\"" $cwd/setupBoard.minicom
 
 
 
-- 
2.17.1


