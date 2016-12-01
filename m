Return-Path: <jake@udc0866934>
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by arago-project.org (Postfix) with ESMTPS id 0ED2852AD2
	for <meta-arago@arago-project.org>;
	Thu,  1 Dec 2016 12:29:58 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id uB1CTwMU025000
	for <meta-arago@arago-project.org>; Thu, 1 Dec 2016 06:29:58 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB1CTwdq025071
	for <meta-arago@arago-project.org>; Thu, 1 Dec 2016 06:29:58 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 1 Dec 2016 06:29:58 -0600
Received: from udc0866934 (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id uB1CTuiH015550;
	Thu, 1 Dec 2016 06:29:57 -0600
Received: from jake by udc0866934 with local (Exim 4.82)	(envelope-from
	<jake@udc0866934>)	id 1cCQUt-0004qJ-UT; Thu, 01 Dec 2016 07:29:55 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
To: <meta-arago@arago-project.org>
Date: Thu, 1 Dec 2016 07:29:52 -0500
Message-ID: <1480595392-18576-2-git-send-email-j-stiffler@ti.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
References: <1480595392-18576-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
Subject: [tisdk-setup-scripts][PATCH 2/2] setup-uboot-env-k2g-evm.sh: update for latest default env
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
X-List-Received-Date: Thu, 01 Dec 2016 12:30:01 -0000
Content-Type: text/plain

* We now need to call "findfdt" so that "name_fdt" is defined.

Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
---
 setup-uboot-env-k2g-evm.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/setup-uboot-env-k2g-evm.sh b/setup-uboot-env-k2g-evm.sh
index f41d278..c80e506 100755
--- a/setup-uboot-env-k2g-evm.sh
+++ b/setup-uboot-env-k2g-evm.sh
@@ -187,7 +187,7 @@ do_expect "\"$prompt\"" "send \"setenv name_ubi $ubifsimage\"" $cwd/setupBoard.m
 do_expect "\"$prompt\"" "send \"setenv name_kern $kernelimage\"" $cwd/setupBoard.minicom
 do_expect "\"$prompt\"" "send \"setenv name_uboot $ubootimage\"" $cwd/setupBoard.minicom
 
-do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_fdt_\${kern_mode} get_mon_\${kern_mode} get_kern_\${kern_mode} run_mon run_kern'\"" $cwd/setupBoard.minicom
+do_expect "\"$prompt\"" "send \"setenv bootcmd 'run envboot; run init_\${fs_mode} get_pmmc_\${kern_mode} run_pmmc get_mon_\${kern_mode} run_mon findfdt get_fdt_\${kern_mode} get_kern_\${kern_mode} run_kern'\"" $cwd/setupBoard.minicom
 
 do_expect "\"$prompt\"" "send \"saveenv\"" $cwd/setupBoard.minicom
 
-- 
1.9.1


