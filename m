Return-Path: <jake@udc0866934>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 354C152090
	for <meta-arago@arago-project.org>;
	Mon, 27 Mar 2017 13:42:33 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2RDgXVE012687
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:42:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490622153;
	bh=i34PGLnI0NfbpxEH3070Y7QGzBoNv7Ea9+/iILUB+JM=;
	h=From:To:CC:Subject:Date;
	b=sWI5rv0g7mhpIuvngEqP6M/T9rDdRWq8mUoNgsmbMH70cjV5tfCIotUUNixUy9KEF
	j3+NJXAp4wqb8lk+kxTv4fclxafBHa9XQ4qF4/4KmsgyAGFbOffnLv5FsLEHOQKG50
	b92qIPRfQ8RkElp/kg1r7hKf/LFGaNP7kyTg78iM=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDgWFx010351
	for <meta-arago@arago-project.org>; Mon, 27 Mar 2017 08:42:33 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 27 Mar 2017 08:42:32 -0500
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2RDgW5H000898;
	Mon, 27 Mar 2017 08:42:32 -0500
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1csUul-0000qP-Tu; Mon, 27 Mar 2017 09:42:31 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 27 Mar 2017 09:42:29 -0400
Message-ID: <1490622150-3213-1-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] setup-uboot-env-k2g-evm: add set_name_pmmc to bootcmd
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
X-List-Received-Date: Mon, 27 Mar 2017 13:42:33 -0000
Content-Type: text/plain

* set_name_pmmc must be called to set the filename of the pmmc
  firmware.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-k2g-evm.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
index c80e506..4944f99 100755
--- a/setup-uboot-env-k2g-evm.sh
+++ b/setup-uboot-env-k2g-evm.sh
@@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.m
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 
-do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} set_name_pmmc get_pmmc_\${kern_mode} run_pmmc get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
 
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
-- 
1.9.1


