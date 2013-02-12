Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f51.google.com (mail-oa0-f51.google.com
	[209.85.219.51])
	by arago-project.org (Postfix) with ESMTPS id C795552A1D
	for <meta-arago@arago-project.org>;
	Tue, 12 Feb 2013 00:46:44 +0000 (UTC)
Received: by mail-oa0-f51.google.com with SMTP id h2so6931013oag.38
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 16:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=S7t3r3kbfv6VdyycB5lH7/nkyuhLiHck6dblRJRSvCY=;
	b=v7JmlHLoziflz8AEuY8ZJQyEx0X1pjwK5tO64g4m2UfG4It4T6nf+gH+c//B/NgVFC
	NwY2FOD/NTsUDlDJ6F/sHOkhSXWjueIKsWzs7IL5wIRLavyWGqBtm013cetVcwbluwOd
	EUhFbSxcjg/bdzzV5cwzNaWEMiWUdk6Gb5ZD9Wvq+eNLxrgmTo14avAcOQUAB0O21Vhw
	3ZTge2+3kHjwmpQWBwtY/KmVsrBcDVm1UzxORbTXh4zsN4dHXZfpqtmYySxuZVydiCAW
	iRKWx4VYo/74l9+M8lkC7bvvmNQbXGTbfn1izs1AzaWrfNcfnnXR7bJ2e4j0Ak5Io/4J
	8IAg==
X-Received: by 10.60.171.175 with SMTP id av15mr11952026oec.75.1360630004161; 
	Mon, 11 Feb 2013 16:46:44 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id b6sm52434322oee.3.2013.02.11.16.46.42
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 16:46:43 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Mon, 11 Feb 2013 18:46:11 -0600
Message-Id: <1360629979-24789-10-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1360629979-24789-1-git-send-email-fcooper@ti.com>
References: <1360629979-24789-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 10/18] arago-amsdk-image: Set SECONDARY_BOOTLOADER_NAME to empty string for omapl138
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
X-List-Received-Date: Tue, 12 Feb 2013 00:46:45 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* The secondary bootloader for omapl138 devices aren't built via oe.
* Set to an empty string so SDK image doesn't fail during the secondary
  bootloader copy stage.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-core/images/arago-amsdk-image.bb       |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
index 4e4345d..08b460e 100644
--- a/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
+++ b/meta-arago-distro/recipes-core/images/arago-amsdk-image.bb
@@ -12,6 +12,8 @@ COMPATIBLE_MACHINE = "omap3|omapl138|ti33x"
 HOST_CLEANUP_PACKAGES = ""
 TOOLCHAIN_CLEANUP_PACKAGES = "libgnutls-dev libgnutls-extra26 libgnutls-openssl27 libtasn1-dev"
 
+SECONDARY_BOOTLOADER_NAME_omapl138 = ""
+
 # List of target side images to build for the SDK
 TARGET_IMAGES = "arago-base-tisdk-image tisdk-rootfs-image"
 
-- 
1.7.0.4


