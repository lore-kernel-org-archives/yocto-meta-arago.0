Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB982C48BEF
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 17:56:41 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.25173.1708019799160587005
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 09:56:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=lbPavPu5;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FHubDt081145;
	Thu, 15 Feb 2024 11:56:37 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708019797;
	bh=2LqGSs4m+qfHe9w9dgtJNGREA2Iws3mnUkgOg/dpPSo=;
	h=From:To:CC:Subject:Date;
	b=lbPavPu5zOWDO/3IWuuBPEdWpnloIAj3ssU1uqIZLnEVBc+XSTQrmOCA7oqSWMRpK
	 vqzISgIwJZcIIAmrvBvfLUvt9cvMW0G/gabS3S7GTUf55mK+Rrx6b0wEY7olI6sS8M
	 lkMMxjavKRvCBhr2kPUPBFOvR5RIUS47oLNEvFDA=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FHubFi023335
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 11:56:37 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 11:56:37 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 11:56:37 -0600
Received: from rs-desk.dhcp.ti.com (rs-desk.dhcp.ti.com [128.247.81.144])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FHubAj020892;
	Thu, 15 Feb 2024 11:56:37 -0600
From: <rs@ti.com>
To: <detheridge@ti.com>, <reatmon@ti.com>, <denys@konsulko.com>
CC: <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>
Subject: [meta-arago][kirkstone][PATCHv2 0/2] Backport some sanity patches for weston
Date: Thu, 15 Feb 2024 11:56:35 -0600
Message-ID: <20240215175637.3438470-1-rs@ti.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 17:56:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15197

From: Randolph Sapp <rs@ti.com>

Backport some sanity patches from newer versions of Weston that fix issues
related to display systems that have primary and overlay planes with mutable
zpos.

Older versions of Weston never attempted to force primary planes to zpos 0 or
check to make sure overlay planes were ordered in such a way that prevented
z-fighting. These patches are backported from newer versions for use with
Kirkstone's locked version of Weston. They have all already been upstreamed.

v2: Fix the malformed Upstream-Status tags

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


