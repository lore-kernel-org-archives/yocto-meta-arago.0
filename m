Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web12.298.1645733099741983053
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 24 Feb 2022 12:05:00 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id B211140C86;
	Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OSt5rDqmPi6t; Thu, 24 Feb 2022 20:04:58 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 9D05840C22;
	Thu, 24 Feb 2022 20:04:57 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id 156591747B1;
	Thu, 24 Feb 2022 15:04:56 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: [master][PATCH 2/3] tisdk-bundle: update comment referencing renamed variable
Date: Thu, 24 Feb 2022 20:04:54 +0000
Message-Id: <20220224200455.2601205-2-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220224200455.2601205-1-denis@denix.org>
References: <20220224200455.2601205-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

As BB_ENV_EXTRAWHITE has been renamed to BB_ENV_PASSTHROUGH_ADDITIONS.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/classes/tisdk-bundle.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arago-distro/classes/tisdk-bundle.bbclass b/meta-arago-=
distro/classes/tisdk-bundle.bbclass
index 0e5d2391..5ab9f875 100644
--- a/meta-arago-distro/classes/tisdk-bundle.bbclass
+++ b/meta-arago-distro/classes/tisdk-bundle.bbclass
@@ -46,7 +46,7 @@ TARGET_IMAGE_TYPES ?=3D "tar.xz tar.gz ubi wic.gz wic.x=
z"
 # of that directory will be added to the SDK using the same directory
 # structure found inside of the EXTRA_TISDK_FILES directory.
 # This can be set in the recipe or from the command line as long as
-# the variable is in the BB_ENV_EXTRAWHITE list.
+# the variable is in the BB_ENV_PASSTHROUGH_ADDITIONS list.
 EXTRA_TISDK_FILES ?=3D ""
=20
 # Variable to specify the name of SPL
--=20
2.25.1

