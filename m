Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ye0-f175.google.com (mail-ye0-f175.google.com
	[209.85.213.175])
	by arago-project.org (Postfix) with ESMTPS id 7BD2452A8D
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 22:53:31 +0000 (UTC)
Received: by mail-ye0-f175.google.com with SMTP id q7so908623yen.20
	for <meta-arago@arago-project.org>;
	Sun, 17 Feb 2013 14:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=zMqzRY0Rf6VRm4tkE47cM1n+1Jik5aJIucCwFdwNSOk=;
	b=djH3320wSQv/Kkkac1wW9HTSDUw2Qjq3zuccvOrmuZWZvhDgtQ78uVqviyIRlVorRS
	vmGImlu7/up6g6UXe1Tbbs5aTJEoJ+ChbJjwBVxymjeS8NcCPfS1svPRp0OYs4adpW6G
	XWCxc1x3f79u2hFSl9b1gqyS21/4OqNqP+BQcHTB9dTtsG4cArrQdboDJe9WgV8Rcgbu
	M+sDUdtZfLnPamQnZhg2YmHb4eZzOWTv4VQ1wydxkazevpIiNh3TAIsJ+QE6gkw7P+M1
	T+SUoJYyos3TP/7bn+OkKxwiuSfsx3pY/lEmRtSED/SWnE+27jAqqb8vAZCvDiIVyqyu
	Eh6Q==
X-Received: by 10.236.138.42 with SMTP id z30mr16924961yhi.101.1361141611118; 
	Sun, 17 Feb 2013 14:53:31 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id s74sm3456861yhh.5.2013.02.17.14.53.28
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 17 Feb 2013 14:53:29 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Sun, 17 Feb 2013 16:53:00 -0600
Message-Id: <1361141595-1687-5-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1361141595-1687-1-git-send-email-fcooper@ti.com>
References: <1361141595-1687-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 05/20] arago-source-ipk: Enable CREATE_SRCIPK for linux-omapl138-psp recipe
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
X-List-Received-Date: Sun, 17 Feb 2013 22:53:31 -0000

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


