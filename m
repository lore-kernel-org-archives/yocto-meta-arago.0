Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3521C4829E
	for <webhook@archiver.kernel.org>; Thu, 15 Feb 2024 14:46:27 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.15607.1708008378386132235
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 15 Feb 2024 06:46:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=wL4NAGk+;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 41FEkEMc020771;
	Thu, 15 Feb 2024 08:46:14 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1708008374;
	bh=qVv6wUzTPp8SnD6vcnFdt9BV6L9zB0ZtX//T2uarNA4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=wL4NAGk+no5Qv5B0yJsgE5tSwpp1J1XUGRIIFvTfNtg/mfHe0G/B67B9QXbRFd27o
	 aksJPsF+n6SETEJq14N6I7fg5bg8D9HLKV1U1GLkNgXgcaDZIkcCcGAMvGaKP7VaW/
	 9GaF9kZR9OIf4omjca3qVd6KdMXOzCmX2fo5Z1SQ=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 41FEkEgi043256
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 15 Feb 2024 08:46:14 -0600
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 15
 Feb 2024 08:46:14 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 15 Feb 2024 08:46:14 -0600
Received: from [10.249.39.53] ([10.249.39.53])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 41FEkEiZ096122;
	Thu, 15 Feb 2024 08:46:14 -0600
Message-ID: <87325179-66c0-4839-ad66-50c1c00619c4@ti.com>
Date: Thu, 15 Feb 2024 08:46:14 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][kirkstone][PATCH 1/2] weston: backport patches
 related to plane positioning
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>, <rs@ti.com>
CC: <detheridge@ti.com>, <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>, <j-choudhary@ti.com>
References: <20240215010123.3432540-1-rs@ti.com>
 <20240215010123.3432540-2-rs@ti.com> <20240215012734.GB1572@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20240215012734.GB1572@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 15 Feb 2024 14:46:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15192


Yes.  We need to get into the habit of adding the Upstream-Status to 
these patches, even if kirkstone does not require them.  Master and 
scarthgap do, so let's get into the habit.


On 2/14/2024 7:27 PM, Denys Dmytriyenko wrote:
> Missing Upstream-Status?
> 
> On Wed, Feb 14, 2024 at 07:01:22PM -0600, Randolph Sapp via lists.yoctoproject.org wrote:
>> From: Randolph Sapp <rs@ti.com>
>>
>> Backport some sanity patches related to plane ordering and positioning.
>> These are all mandatory for display subsystems that allow primary and
>> overlay mutable zpos.
>>
>> Otherwise Weston will attempt to place sprite/overlay planes above
>> whatever active primary plane it chooses for scanout, running into
>> issues if the primary plane is above zpos 0 and there isn't enough
>> headroom.
>>
>> They have all already been accepted upstream already and are only
>> necessary for Kirkstone's version of Weston.
>>
>> Signed-off-by: Randolph Sapp <rs@ti.com>
>> ---
>>   ...kend-drm-Pre-sort-plane-list-by-zpos.patch | 48 +++++++++++++++
>>   .../0002-backend-drm-fix-plane-sorting.patch  | 38 ++++++++++++
>>   ...mber-to-set-the-zpos-for-the-scanout.patch | 33 +++++++++++
>>   ...Assign-plane_idx-by-plane-list-order.patch | 58 +++++++++++++++++++
>>   4 files changed, 177 insertions(+)
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Pre-sort-plane-list-by-zpos.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0002-backend-drm-fix-plane-sorting.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch
>>   create mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch
>>
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Pre-sort-plane-list-by-zpos.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Pre-sort-plane-list-by-zpos.patch
>> new file mode 100644
>> index 00000000..04ae08f5
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0001-backend-drm-Pre-sort-plane-list-by-zpos.patch
>> @@ -0,0 +1,48 @@
>> +From 9d2fda2a77cfa0932b2cef9af59033c187ec21d7 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stone <daniels@collabora.com>
>> +Date: Tue, 7 Dec 2021 15:55:42 +0000
>> +Subject: [PATCH 1/3] backend-drm: Pre-sort plane list by zpos
>> +
>> +Rather than constructing a zpos-sorted list every time, just have
>> +plane_list be pre-sorted.
>> +
>> +Backport: 6609840479934a1145372e8a850592eeffbdaf83
>> +
>> +Signed-off-by: Daniel Stone <daniels@collabora.com>
>> +---
>> + libweston/backend-drm/drm.c | 12 ++++++++++--
>> + 1 file changed, 10 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
>> +index 42787702..102fa2d7 100644
>> +--- a/libweston/backend-drm/drm.c
>> ++++ b/libweston/backend-drm/drm.c
>> +@@ -760,7 +760,7 @@ init_pixman(struct drm_backend *b)
>> + static struct drm_plane *
>> + drm_plane_create(struct drm_backend *b, const drmModePlane *kplane)
>> + {
>> +-	struct drm_plane *plane;
>> ++	struct drm_plane *plane, *tmp;
>> + 	drmModeObjectProperties *props;
>> + 	uint64_t *zpos_range_values;
>> +
>> +@@ -817,7 +817,15 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane)
>> + 		goto err_props;
>> +
>> + 	weston_plane_init(&plane->base, b->compositor, 0, 0);
>> +-	wl_list_insert(&b->plane_list, &plane->link);
>> ++
>> ++	wl_list_for_each(tmp, &b->plane_list, link) {
>> ++		if (tmp->zpos_max > plane->zpos_max) {
>> ++			wl_list_insert(tmp->link.prev, &plane->link);
>> ++			break;
>> ++		}
>> ++	}
>> ++	if (plane->link.next == NULL)
>> ++		wl_list_insert(b->plane_list.prev, &plane->link);
>> +
>> + 	return plane;
>> +
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0002-backend-drm-fix-plane-sorting.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0002-backend-drm-fix-plane-sorting.patch
>> new file mode 100644
>> index 00000000..cd9a8c5e
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0002-backend-drm-fix-plane-sorting.patch
>> @@ -0,0 +1,38 @@
>> +From 450987334af6546b62aa8f5cce8a4c1b07fe5a5e Mon Sep 17 00:00:00 2001
>> +From: Michael Olbrich <m.olbrich@pengutronix.de>
>> +Date: Tue, 30 Aug 2022 17:10:27 +0200
>> +Subject: [PATCH 2/3] backend-drm: fix plane sorting
>> +
>> +The planes in the plane_list must be sorted from largest zpos_max to smallest.
>> +
>> +Currently the plane order is only correct when the planes are already ordered
>> +and added starting with the smallest zpos_max. This works accidentally in most
>> +cases because the primary plane is usually first and there is often only one
>> +overlay plane or the zpos is sufficiantly configurable.
>> +
>> +To fix this, insert a new plane before the first plane with a smaller zpos_max.
>> +And if none is found, insert it at the end of the list.
>> +
>> +Backport: 4cde507be6a116b3828f3a86a0e97639f04d9046
>> +
>> +Signed-off-by: Michael Olbrich <m.olbrich@pengutronix.de>
>> +---
>> + libweston/backend-drm/drm.c | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
>> +index 102fa2d7..4c18f76c 100644
>> +--- a/libweston/backend-drm/drm.c
>> ++++ b/libweston/backend-drm/drm.c
>> +@@ -819,7 +819,7 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane)
>> + 	weston_plane_init(&plane->base, b->compositor, 0, 0);
>> +
>> + 	wl_list_for_each(tmp, &b->plane_list, link) {
>> +-		if (tmp->zpos_max > plane->zpos_max) {
>> ++		if (tmp->zpos_max < plane->zpos_max) {
>> + 			wl_list_insert(tmp->link.prev, &plane->link);
>> + 			break;
>> + 		}
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch
>> new file mode 100644
>> index 00000000..eaf074e8
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0003-drm-backend-Remember-to-set-the-zpos-for-the-scanout.patch
>> @@ -0,0 +1,33 @@
>> +From 84a7c7a7317b0cfd3a34557351041b560645a002 Mon Sep 17 00:00:00 2001
>> +From: Derek Foreman <derek.foreman@collabora.com>
>> +Date: Tue, 31 Jan 2023 10:11:42 -0600
>> +Subject: [PATCH 3/3] drm-backend: Remember to set the zpos for the scanout
>> + plane
>> +
>> +We can clear this via drm_plane_state_put_back() at the end of
>> +drm_output_propose_state(). We need to set it back to the minimum zpos
>> +when rendering.
>> +
>> +Backport: 58dde0e0c0000f1430624ee2fbf12886774ccd40
>> +
>> +Signed-off-by: Derek Foreman <derek.foreman@collabora.com>
>> +---
>> + libweston/backend-drm/drm.c | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
>> +index 4c18f76c..67d471aa 100644
>> +--- a/libweston/backend-drm/drm.c
>> ++++ b/libweston/backend-drm/drm.c
>> +@@ -404,6 +404,8 @@ drm_output_render(struct drm_output_state *state, pixman_region32_t *damage)
>> + 	scanout_state->dest_w = output->base.current_mode->width;
>> + 	scanout_state->dest_h = output->base.current_mode->height;
>> +
>> ++	scanout_state->zpos = scanout_plane->zpos_min;
>> ++
>> + 	pixman_region32_subtract(&c->primary_plane.damage,
>> + 				 &c->primary_plane.damage, damage);
>> +
>> +--
>> +2.43.0
>> +
>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch
>> new file mode 100644
>> index 00000000..ae76af7f
>> --- /dev/null
>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston/0004-backend-drm-Assign-plane_idx-by-plane-list-order.patch
>> @@ -0,0 +1,58 @@
>> +From af42fc1e336748b4e401e4441729dd79914425e6 Mon Sep 17 00:00:00 2001
>> +From: Daniel Stone <daniels@collabora.com>
>> +Date: Tue, 7 Dec 2021 15:58:49 +0000
>> +Subject: [PATCH] backend-drm: Assign plane_idx by plane list order
>> +
>> +Backport: af42fc1e336748b4e401e4441729dd79914425e6
>> +
>> +Signed-off-by: Daniel Stone <daniels@collabora.com>
>> +---
>> + libweston/backend-drm/drm-internal.h | 1 -
>> + libweston/backend-drm/drm.c          | 5 ++++-
>> + 2 files changed, 4 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/libweston/backend-drm/drm-internal.h b/libweston/backend-drm/drm-internal.h
>> +index 55e9414b..86d7368e 100644
>> +--- a/libweston/backend-drm/drm-internal.h
>> ++++ b/libweston/backend-drm/drm-internal.h
>> +@@ -276,7 +276,6 @@ struct drm_backend {
>> + 	int min_height, max_height;
>> +
>> + 	struct wl_list plane_list;
>> +-	uint32_t next_plane_idx;
>> +
>> + 	void *repaint_data;
>> +
>> +diff --git a/libweston/backend-drm/drm.c b/libweston/backend-drm/drm.c
>> +index 102fa2d7..203b8a4e 100644
>> +--- a/libweston/backend-drm/drm.c
>> ++++ b/libweston/backend-drm/drm.c
>> +@@ -771,7 +771,6 @@ drm_plane_create(struct drm_backend *b, const drmModePlane *kplane)
>> + 	}
>> +
>> + 	plane->backend = b;
>> +-	plane->plane_idx = b->next_plane_idx++;
>> + 	plane->state_cur = drm_plane_state_alloc(NULL, plane);
>> + 	plane->state_cur->complete = true;
>> + 	plane->possible_crtcs = kplane->possible_crtcs;
>> +@@ -919,6 +918,7 @@ create_sprites(struct drm_backend *b)
>> + 	drmModePlane *kplane;
>> + 	struct drm_plane *drm_plane;
>> + 	uint32_t i;
>> ++	uint32_t next_plane_idx = 0;
>> + 	kplane_res = drmModeGetPlaneResources(b->drm.fd);
>> + 	if (!kplane_res) {
>> + 		weston_log("failed to get plane resources: %s\n",
>> +@@ -942,6 +942,9 @@ create_sprites(struct drm_backend *b)
>> + 						      &b->compositor->primary_plane);
>> + 	}
>> +
>> ++	wl_list_for_each (drm_plane, &b->plane_list, link)
>> ++		drm_plane->plane_idx = next_plane_idx++;
>> ++
>> + 	drmModeFreePlaneResources(kplane_res);
>> + }
>> +
>> +--
>> +2.43.0
>> +
>> -- 
>> 2.43.0

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

