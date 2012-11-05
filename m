Return-Path: <fcooperjr27@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by arago-project.org (Postfix) with ESMTPS id CBFB052094
	for <meta-arago@arago-project.org>;
	Mon,  5 Nov 2012 01:54:25 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id lz20so4802582obb.38
	for <meta-arago@arago-project.org>;
	Sun, 04 Nov 2012 17:54:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=iVPcdNHFYfd8B3n7Y21WD3fO57kJJE/4K0+CQfMQi+Y=;
	b=Zt/lAfrBa5h3QOqpyKuOIzlsq1elgWLeB2dHq2X1h6IFuHBlfjvZ4y05DVwygQB7K7
	XrbgicVT5kQNLz84uile9BQk1NP+c2/U9khJoEBzjMjv10McBCvzx6DNz8CJk3A6dTie
	jHslCaE6fOumkbw38oMj0/dFmvT0DEEsg+spPFmZdtXUb4e6/fx3NC+nrzoeok85c8WN
	iFLGuUcwPy53XW9qfkS2imM9pEUzObyy7FN2h0U6fanUx6aBijDANtk2Ga0FFNnbjzLU
	LPYKh1gKUU8SfD9x7Yq4amXUch37C3E9QgMWlUs9oT1dMw73My4O9cOpTyCFTQCXG9J/
	D0fA==
Received: by 10.182.86.225 with SMTP id s1mr6593360obz.91.1352080465547;
	Sun, 04 Nov 2012 17:54:25 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id v6sm12820300oeh.13.2012.11.04.17.54.24
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 04 Nov 2012 17:54:25 -0800 (PST)
From: "Franklin S. Cooper Jr" <fcooperjr27@gmail.com>
To: meta-arago@arago-project.org
Date: Sun,  4 Nov 2012 19:53:29 -0600
Message-Id: <1352080417-9792-32-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1352080417-9792-1-git-send-email-fcooper@ti.com>
References: <1352080417-9792-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 34/42] arago.conf: Set the new PSP kernel as the preferred version
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
X-List-Received-Date: Mon, 05 Nov 2012 01:54:26 -0000

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 meta-arago-distro/conf/distro/arago.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
index 84d0050..1378255 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -53,7 +53,7 @@ PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
 
 # Use the SDK supported kernel and kernel version
 PREFERRED_PROVIDER_virtual/kernel_am335x-evm = "linux-am335x"
-PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp04.06.00.08"
+PREFERRED_VERSION_virtual/kernel_am335x-evm = "3.2.0-psp05.06.00.00"
 
 # Use the SDK supported u-boot version
 PREFERRED_VERSION_u-boot_am335x-evm = "2011.09-psp04.06.00.08"
-- 
1.7.0.4


