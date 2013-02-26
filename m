Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by arago-project.org (Postfix) with ESMTPS id D6FC952A9C
	for <meta-arago@arago-project.org>;
	Tue, 26 Feb 2013 03:33:12 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id m1so4414642oag.26
	for <meta-arago@arago-project.org>;
	Mon, 25 Feb 2013 19:33:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zMqzRY0Rf6VRm4tkE47cM1n+1Jik5aJIucCwFdwNSOk=;
	b=I1xRvw+slyvykni4Q+RaVjLjGI3vnNTs6dcAu/T//A6FbL7Eh/jVGkgX21k2/dpxKN
	bfqDlbPGY/7Ij6iecHNR+PrAI971SUVKwo3Ec0itq8b7xx4PEb6prpuhZpuLAoHp2QxN
	vVRj7CvVqp0MQlJX9sT9ncPmTnsMKIxgRpm6TUXnZ8miziDIzpy2sj6l96bnQsCFhqHc
	OVejtV7B7YpUR6aPyF4eYwfyqsZWc7bBfKt1S3hd2FO9sl41vJIDCw8iZ7sNNK84VgYm
	dlHkI/Hd59tsGGYVfc82bBmgIRkzKz/hrD1soj09SAAdzxiI99C98XIn0WxdiC66zHnG
	HruA==
X-Received: by 10.182.123.49 with SMTP id lx17mr9936550obb.63.1361849592467;
	Mon, 25 Feb 2013 19:33:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id p2sm17587176obb.6.2013.02.25.19.33.10
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 25 Feb 2013 19:33:11 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 25 Feb 2013 21:32:51 -0600
Message-Id: <1361849574-7710-7-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361849574-7710-1-git-send-email-fcooper@ti.com>
References: <1361849574-7710-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 07/10] arago-source-ipk: Enable CREATE_SRCIPK for linux-omapl138-psp recipe
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
X-List-Received-Date: Tue, 26 Feb 2013 03:33:13 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../conf/distro/arago-source-ipk.conf              |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago-source-ipk.conf b/meta-arago-distro/conf/distro/arago-source-ipk.conf
index d23e564..bc5ff59 100644
--- a/meta-arago-distro/conf/distro/arago-source-ipk.conf
+++ b/meta-arago-distro/conf/distro/arago-source-ipk.conf
@@ -112,6 +112,10 @@ SRCIPK_INSTALL_DIR_pn-x-load = "board-support/x-load-${XVER}-psp${PSPREL}"
 SRCIPK_INSTALL_DIR_pn-x-load_beagleboard = "board-support/${P}"
 SRCIPK_PACKAGE_ARCH_pn-x-load = "${MACHINE_ARCH}"
 
+CREATE_SRCIPK_pn-linux-omapl138-psp = "1"
+SRCIPK_INSTALL_DIR_pn-linux-omapl138-psp = "board-support/linux-${KVER}-psp${PSPREL}"
+SRCIPK_PACKAGE_ARCH_pn-linux-omapl138-psp = "${MACHINE_ARCH}"
+
 CREATE_SRCIPK_pn-linux-omap3 = "1"
 SRCIPK_INSTALL_DIR_pn-linux-omap3 = "board-support/linux-${KVER}-psp${PSPREL}"
 SRCIPK_PACKAGE_ARCH_pn-linux-omap3 = "${MACHINE_ARCH}"
-- 
1.7.0.4


