Return-Path: <fcooperjr27@gmail.com>
Received: from mail-qa0-f46.google.com (mail-qa0-f46.google.com
	[209.85.216.46])
	by arago-project.org (Postfix) with ESMTPS id 1B96852A47
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 14:02:36 +0000 (UTC)
Received: by mail-qa0-f46.google.com with SMTP id o13so1687907qaj.19
	for <meta-arago@arago-project.org>;
	Mon, 18 Mar 2013 07:02:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=rYOOukmXLlFlnOJs8tnwWqPrHfdjVc9KExvuuWRIYHU=;
	b=eE9AIzXFpro4nvLXRtJksYygT5MS+JG1/0NzudWqj88/k1E2XfqNCuzc36y5aFDiov
	ZVYPphv3Q+u9MAGL576CdU2xFJyBPCgD+r+JnBp27NjODwcW9Mq+sFRo1RIk+Df8k0Aq
	k/f70jsRQHZgklO9RK7pbDCJeWr2wu11bu5U2YVDGp6QRMJ1x0Bw7enynfpBAT86yzVe
	U8FblbiVKm+HoCVK3aq3iiZgr2AmscbTL5ueW2zsKLSFEg7hub86xRWOtmo+2mTnKwKn
	xfaPFxx6Kv8OnaUF1jRuiAV3FpwNnJzaIfaY52pYxenOa3BkJpgR/ehq5hO3pTe+wpzo
	pgAw==
X-Received: by 10.224.178.77 with SMTP id bl13mr20052560qab.13.1363615355650; 
	Mon, 18 Mar 2013 07:02:35 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id t3sm32492548qen.5.2013.03.18.07.02.33
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 18 Mar 2013 07:02:34 -0700 (PDT)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 18 Mar 2013 09:02:23 -0500
Message-Id: <1363615345-6416-2-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1363615345-6416-1-git-send-email-fcooper@ti.com>
References: <1363615345-6416-1-git-send-email-fcooper@ti.com>
Subject: [PATCH 2/4] wl12xx-firmware: update for fetching r5.sp4.01 firmware
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
X-List-Received-Date: Mon, 18 Mar 2013 14:02:38 -0000

From: Eyal Reizer <eyalr@ti.com>

update the recipe for fetching the r5.sp4.01 wlan firmware

Signed-off-by: Eyal Reizer <eyalr@ti.com>
---
 .../wl12xx-firmware/wl12xx-firmware_git.bb         |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
index 5d73038..3bd42af 100644
--- a/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
+++ b/meta-arago-extras/recipes-bsp/wl12xx-firmware/wl12xx-firmware_git.bb
@@ -4,7 +4,7 @@ LIC_FILES_CHKSUM = "file://LICENCE;md5=ba590e1d103f891d0151609046aef9e8"
 
 PACKAGE_ARCH = "all"
 
-PR = "r1+gitr${SRCREV}"
+PR = "r2+gitr${SRCREV}"
 
 # This recipe provides the latest firmware files for wl12xx.
 # Therefore, use the contents of this recipe instead of the contents
@@ -12,7 +12,7 @@ PR = "r1+gitr${SRCREV}"
 RCONFLICTS_${PN} = "linux-firmware-wl12xx"
 RPROVIDES_${PN}  = "linux-firmware-wl12xx"
 
-SRCREV = "ol_R5.SP3.05"
+SRCREV = "ol_R5.SP4.01"
 SRC_URI = "git://github.com/TI-OpenLink/ti-utils.git;protocol=git \
            file://Makefile \
           "
-- 
1.7.0.4


