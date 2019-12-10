Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 68ADF52988
	for <meta-arago@arago-project.org>;
	Tue, 10 Dec 2019 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0B50540BFB;
	Tue, 10 Dec 2019 19:14:49 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id BI53v-iqNsL1; Tue, 10 Dec 2019 19:14:49 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D894D4087C;
	Tue, 10 Dec 2019 19:14:46 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 912D217434B;
	Tue, 10 Dec 2019 14:14:46 -0500 (EST)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 10 Dec 2019 14:14:44 -0500
Message-Id: <1576005284-14624-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: [tisdk-setup-scripts][PATCH] setup-uboot-env-am65x: pass console to u-boot bootargs for NFS boot
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
X-List-Received-Date: Tue, 10 Dec 2019 19:16:23 -0000

U-boot default bootargs was missing console setting, resulting in duplicate
kernel logs.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
Suggested-by: Andreas Dannenberg <dannenberg@ti.com>
---
 setup-uboot-env-am65x.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-uboot-env-am65x.sh b/setup-uboot-env-am65x.sh
index e17f700..b6e043b 100644
--- a/setup-uboot-env-am65x.sh
+++ b/setup-uboot-env-am65x.sh
@@ -152,7 +152,7 @@ do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard
 do_expect "\"$prompt\"" "send \"setenv bootcmd 'run findfdt; run envboot; run setup_\${kern_boot}; run init_\${rootfs_boot}; run get_kern_\${kern_boot}; run get_fdt_\${kern_boot}; run get_overlay_\${kern_boot}; run run_kern'\"" $cwd/setupBoard.minicom
 
 do_expect "\"$prompt\"" "send \"setenv init_net 'run args_all args_net; setenv autoload no; dhcp'\"" $cwd/setupBoard.minicom
-do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv args_net 'setenv bootargs console=\${console} \${optargs} rootfstype=nfs root=/dev/nfs rw nfsroot=\${serverip}:\${nfs_root},\${nfs_options} ip=dhcp'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_kern_net 'tftp \${loadaddr} \${name_kern}'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_fdt_net 'tftp \${fdtaddr} \${name_fdt}'\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv get_overlay_net 'fdt address \${fdtaddr};fdt resize 0x100000;for overlay in \${overlay_files};do;tftp \${overlayaddr} \${overlay};fdt apply \${overlayaddr}; done'\"" $cwd/setupBoard.minicom
-- 
2.7.4


