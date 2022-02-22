Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web10.9167.1645504921733298035
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 21 Feb 2022 20:42:01 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 2E85840A28
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:42:01 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TPCw5D0a9k7e for <meta-arago@lists.yoctoproject.org>;
	Tue, 22 Feb 2022 04:42:01 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net [100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D4EEF40C98
	for <meta-arago@lists.yoctoproject.org>; Tue, 22 Feb 2022 04:41:51 +0000 (UTC)
Received: from thorin.denix (thorin.denix [192.168.30.9])
	by mail.denix.org (Postfix) with ESMTP id BD787174774
	for <meta-arago@lists.yoctoproject.org>; Mon, 21 Feb 2022 23:41:51 -0500 (EST)
From: "Denys Dmytriyenko" <denis@denix.org>
To: meta-arago@lists.yoctoproject.org
Subject: [PATCH 16/23] arago.conf: drop custom class for image checksums
Date: Tue, 22 Feb 2022 04:41:44 +0000
Message-Id: <20220222044151.2844138-17-denis@denix.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220222044151.2844138-1-denis@denix.org>
References: <20220222044151.2844138-1-denis@denix.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: Denys Dmytriyenko <denys@konsulko.com>

Use new CONVERSION facility to generate md5sum checksums for images.

Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
---
 meta-arago-distro/classes/image_types_md5.bbclass | 9 ---------
 meta-arago-distro/conf/distro/arago.conf          | 3 +--
 2 files changed, 1 insertion(+), 11 deletions(-)
 delete mode 100644 meta-arago-distro/classes/image_types_md5.bbclass

diff --git a/meta-arago-distro/classes/image_types_md5.bbclass b/meta-ara=
go-distro/classes/image_types_md5.bbclass
deleted file mode 100644
index 16324ca5..00000000
--- a/meta-arago-distro/classes/image_types_md5.bbclass
+++ /dev/null
@@ -1,9 +0,0 @@
-inherit image_types
-
-COMPRESSIONTYPES +=3D "gz.md5"
-COMPRESS_CMD:gz.md5 =3D "${COMPRESS_CMD_gz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.gz > ${IMAGE_NAME}.rootfs.${type}.gz.md5"
-IMAGE_TYPES +=3D "tar.gz.md5"
-
-COMPRESSIONTYPES +=3D "xz.md5"
-COMPRESS_CMD:xz.md5 =3D "${COMPRESS_CMD_xz}; md5sum ${IMAGE_NAME}.rootfs=
.${type}.xz > ${IMAGE_NAME}.rootfs.${type}.xz.md5"
-IMAGE_TYPES +=3D "tar.xz.md5"
diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro=
/conf/distro/arago.conf
index b06c2782..ade66ea7 100644
--- a/meta-arago-distro/conf/distro/arago.conf
+++ b/meta-arago-distro/conf/distro/arago.conf
@@ -33,8 +33,7 @@ SDK_NAME =3D "${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH_REAL =3D "/usr/local/${SDK_NAME_PREFIX}-${SDK_VERSION}"
 SDKPATH =3D "${@"/tmp/"+"x"*96+"/"+"y"*96}"
=20
-#IMAGE_CLASSES +=3D "image_types_md5"
-#IMAGE_FSTYPES +=3D "tar.xz.md5"
+IMAGE_FSTYPES +=3D "tar.xz.md5sum"
=20
 # FIT image for legacy secure devices
 KERNEL_CLASSES:append:am335x-hs-evm =3D " kernel-fitimage-legacyhs"
--=20
2.25.1

