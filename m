Return-Path: <h-gou@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id DC9F152983
	for <meta-arago@arago-project.org>;
	Mon,  8 Jan 2018 23:34:00 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w08NXsjR027263
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:54 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1515454434;
	bh=35z/r7pLwPS+Qb5DhdLXXTBSlJgdGBLaKZCpIXpR8kc=;
	h=From:To:CC:Subject:Date;
	b=LWWZ+MOvwsOG6MyBDUQvWihbCMbNkFjnqUgLVr0QO1qsKl3RuNS70zBq4vCjCpxg2
	PByE198jkCyzj1jAxaHKa1cG10TZXeHqCwFPHrXeuGytd9UE4yoQhA9PTawRT89uFV
	3jPg+XdOUQCX4XjdxDskhlXqLbkEOUS4MIYyERsM=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXsP4004779
	for <meta-arago@arago-project.org>; Mon, 8 Jan 2018 17:33:54 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 8 Jan 2018 17:33:54 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 8 Jan 2018 17:33:54 -0600
Received: from uda0271529.am.dhcp.ti.com (ileax41-snat.itg.ti.com
	[10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w08NXrh5019194;
	Mon, 8 Jan 2018 17:33:54 -0600
From: Hongmei Gou <a0271529@ti.com>
To: <meta-arago@arago-project.org>
Date: Mon, 8 Jan 2018 18:33:28 -0500
Message-ID: <1515454420-19972-1-git-send-email-a0271529@ti.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Hongmei Gou <a0271529@ti.com>
Subject: [meta-processor-sdk 00/12] Remove recipes-bsp which have been upstreamed to meta-ti
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
X-List-Received-Date: Mon, 08 Jan 2018 23:34:02 -0000
Content-Type: text/plain

Hongmei Gou (12):
  pruss-lld: upstreamed to meta-ti
  board-rtos: upstreamed to meta-ti
  common-csl-ip: upstreamed to meta-ti
  fatfs-rtos: upstreamed to meta-ti
  gpio-lld-rtos: upstreamed to meta-ti
  i2c-lld-rtos: upstreamed to meta-ti
  mmcsd-lld-rtos: upstreamed to meta-ti
  osal: upstreamed to meta-ti
  pm-lld-rtos: upstreamed to meta-ti
  spi-lld-rtos: upstreamed to meta-ti
  starterware: upstreamed to meta-ti
  uart-lld-rtos: upstreamed to meta-ti

 recipes-bsp/board-rtos/board-rtos_git.bbappend            |  7 -------
 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc       |  5 -----
 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend |  4 ----
 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend      |  1 -
 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend            |  5 -----
 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend           |  5 -----
 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend             |  5 -----
 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend         |  5 -----
 recipes-bsp/osal/osal-1.0.0.9.inc                         |  6 ------
 recipes-bsp/osal/osal-rtos_git.bbappend                   |  2 +-
 recipes-bsp/osal/osal-test_git.bbappend                   |  2 --
 recipes-bsp/osal/osal_git.bbappend                        |  2 --
 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend               | 11 -----------
 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc               |  5 -----
 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend         |  1 -
 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend         |  1 -
 recipes-bsp/pruss-lld/pruss-lld_git.bbappend              |  1 -
 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend             |  5 -----
 recipes-bsp/starterware/starterware-2.1.1.5.inc           |  5 -----
 recipes-bsp/starterware/starterware-rtos_git.bbappend     |  1 -
 recipes-bsp/starterware/starterware_git.bbappend          |  1 -
 recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend           |  5 -----
 22 files changed, 1 insertion(+), 84 deletions(-)
 delete mode 100644 recipes-bsp/board-rtos/board-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-3.3.0.9.inc
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip-rtos_git.bbappend
 delete mode 100644 recipes-bsp/common-csl-ip/common-csl-ip_git.bbappend
 delete mode 100644 recipes-bsp/fatfs-rtos/fatfs-rtos_git.bbappend
 delete mode 100644 recipes-bsp/gpio-lld/gpio-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/i2c-lld/i2c-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/mmcsd-lld/mmcsd-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal-1.0.0.9.inc
 delete mode 100644 recipes-bsp/osal/osal-test_git.bbappend
 delete mode 100644 recipes-bsp/osal/osal_git.bbappend
 delete mode 100644 recipes-bsp/pm-lld/pm-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-1.0.0.8.inc
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld-test_git.bbappend
 delete mode 100644 recipes-bsp/pruss-lld/pruss-lld_git.bbappend
 delete mode 100644 recipes-bsp/spi-lld/spi-lld-rtos_git.bbappend
 delete mode 100644 recipes-bsp/starterware/starterware-2.1.1.5.inc
 delete mode 100644 recipes-bsp/starterware/starterware-rtos_git.bbappend
 delete mode 100644 recipes-bsp/starterware/starterware_git.bbappend
 delete mode 100644 recipes-bsp/uart-lld/uart-lld-rtos_git.bbappend

-- 
1.9.1


