Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB8C1C48BC3
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 01:01:33 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.3976.1707958885387515979
 for <meta-arago@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 17:01:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=fpj90knd;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41F11OFR067482;
	Wed, 14 Feb 2024 19:01:24 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1707958884;
	bh=IYuXZPmN0vfdkKhWBxnQOlBjXMzrYriy0YyfwdywGGM=;
	h=From:To:CC:Subject:Date;
	b=fpj90kndLU1Ik/6oRlS29HWawT2xpkM+nQvKedi6nPlm+zvIiJGSAe4PRgXZIGBw0
	 E10NeyCcFKw9dpme7/2e2wP1gUYB3zCIxcP8gkmgEtywXLBlRYdyduk7WgUKl8L+KV
	 aQfLKPTY0VgnO578crvzd+YUj2r6T3jzOXHHq8lk=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41F11OB9083750
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 14 Feb 2024 19:01:24 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 14
 Feb 2024 19:01:23 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 14 Feb 2024 19:01:23 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41F11NcB014547;
	Wed, 14 Feb 2024 19:01:23 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone][PATCH 0/2] Backport some sanity patches for weston
Date: Wed, 14 Feb 2024 19:01:21 -0600
Message-ID: <20240215010123.3432540-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 01:01:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15188

From: Randolph Sapp <rs@ti.com>

Backport some sanity patches from newer versions of Weston that fix issues
related to display systems that have primary and overlay planes with mutable
zpos.

Older versions of Weston never attempted to force primary planes to zpos 0 or
check to make sure overlay planes were ordered in such a way that prevented
z-fighting. These patches are backported from newer versions for use with
Kirkstone's locked version of Weston. They have all already been upstreamed.

Randolph Sapp (2):
  weston: backport patches related to plane positioning
  weston: include backported patches in bbappend

 ...kend-drm-Pre-sort-plane-list-by-zpos.patch | 48 +++++++++++++++
 .../0002-backend-drm-fix-plane-sorting.patch  | 38 ++++++++++++
 ...mber-to-set-the-zpos-for-the-scanout.patch | 33 +++++++++++
 ...Assign-plane_idx-by-plane-list-order.patch | 58 +++++++++++++++++++
 .../wayland/weston_10.0.2.bbappend            |  4 ++
 5 files changed, 181 insertions(+)
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Pre-sort-plane-list-by-zpos.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-backend-drm-fix-plane-sorting.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch
 create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch

-- 
2.43.0


