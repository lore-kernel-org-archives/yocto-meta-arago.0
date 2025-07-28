Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638FEC83F17
	for <webhook@archiver.kernel.org>; Mon, 28 Jul 2025 19:18:39 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.90208.1753730318406363645
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 28 Jul 2025 12:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=VfKNQDRc;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: reatmon@ti.com)
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 56SJIZwM2794719;
	Mon, 28 Jul 2025 14:18:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1753730315;
	bh=ZjbH/H/RYNcTYcdHwoVQZB4mlBVsT+lUOwV3rb8e/3k=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=VfKNQDRcMEk6IMupdUhcNFJhV369X91jOkde4nBeR+fh507Vyl78+LXP2Sj72DWKL
	 +fbR1V2l0o+9e1MQCowiyu2V3H3JOz9E7TYxBH1o4G+MepgvrvrHVwxRUAxnuOm9yc
	 gnpC8S+fHUHBWVeuZbAhxJaBqfrwsgl1wSOEf08E=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 56SJIZIe1898878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 28 Jul 2025 14:18:35 -0500
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 28
 Jul 2025 14:18:35 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 28 Jul 2025 14:18:35 -0500
Received: from [10.249.37.202] ([10.249.37.202])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 56SJIZ2J2544797;
	Mon, 28 Jul 2025 14:18:35 -0500
Message-ID: <796ec4ab-26c1-4ad0-84e2-758af03e2507@ti.com>
Date: Mon, 28 Jul 2025 14:18:35 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH] recipes-graphics: Move
 weston fix for SGX to meta-ti
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denys@konsulko.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250728173156.575486-1-afd@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20250728173156.575486-1-afd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 28 Jul 2025 19:18:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/16335

As glimpse to the upcoming checks here is the results for this patch:



meta-arago / na / 20250728173156.575486-1-afd

PRC Results: FAIL

-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
   check-yocto-patches: PASS
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
Patches
----------------------------------------
All patches passed



-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
   apply-yocto-patch: FAIL
-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
scarthgap
=====================
Summary:
- Patch Series: [meta-arago][scarthgap/master][PATCH] recipes-graphics: 
Move weston fix for SGX to meta-ti
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Mon, 28 Jul 2025 12:31:56 -0500
-Date: Thu, 6 Jul 2023 01:48:41 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 
94311fba9f85cd36bd26c3bbb6b479c5d7274103

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: scarthgap-wip
- Commit Author: Andrew Davis <afd@ti.com>
- Commit Subject: packagegroup-arago-tisdk-multimedia: Remove OMAP5-EVM 
appends
- Commit SHA: 216afc8545480531a2419deae0bb47bc8856b530

Patches
----------------------------------------
All patches applied

master
=====================
Summary:
- Patch Series: [meta-arago][scarthgap/master][PATCH] recipes-graphics: 
Move weston fix for SGX to meta-ti
- Submitter: From: Andrew Davis <afd@ti.com>
-From: Denys Dmytriyenko <denys@konsulko.com>
- Date: Date: Mon, 28 Jul 2025 12:31:56 -0500
-Date: Thu, 6 Jul 2023 01:48:41 +0000
- Num Patches: 1
- Mailing List (public inbox) Commit SHA: 
94311fba9f85cd36bd26c3bbb6b479c5d7274103

Applied to:
- Repository: lcpd-prc-meta-arago
- Base Branch: master
- Commit Author: LCPD Automation Script <lcpdbld@list.ti.com>
- Commit Subject: CI/CD Auto-Merger: cicd.master.202507240100
- Commit SHA: e6222168663149d337d6abf5fc7f324faaac2024

Patches
----------------------------------------
FAIL - [meta-arago][scarthgap/master][PATCH] recipes-graphics: Move 
weston fix for SGX to meta-ti
     Applying: recipes-graphics: Move weston fix for SGX to meta-ti
     Patch failed at 0001 recipes-graphics: Move weston fix for SGX to 
meta-ti
     error: patch failed: 
meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch:1
     error: 
meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch: 
patch does not apply
     error: 
meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend: does 
not exist in index








Fails to apply on master.















On 7/28/2025 12:31 PM, Andrew Davis wrote:
> This change is needed due to the SGX driver, any distro, not just Arago,
> using a TI SoC with SGX will need this fix, so it should go in meta-ti.
> Remove it from here so it can go into meta-ti without patch conflicts.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>   .../recipes-graphics/wayland/weston-arago.inc |  7 --
>   ...equire-GL_EXT_unpack_subimage-commit.patch | 95 -------------------
>   .../wayland/weston_13.0.%.bbappend            |  4 -
>   3 files changed, 106 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
>   delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>   delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc b/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
> deleted file mode 100644
> index 16518353..00000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston-arago.inc
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -FILESEXTRAPATHS:prepend := "${THISDIR}/weston:"
> -
> -PR:append = ".arago1"
> -
> -SRC_URI += " \
> -        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
> -"
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> deleted file mode 100644
> index ad252030..00000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
> +++ /dev/null
> @@ -1,95 +0,0 @@
> -From 5a05e5b66dd3831a9c9c2b3f64bd42419d9ade2d Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@konsulko.com>
> -Date: Thu, 6 Jul 2023 01:48:41 +0000
> -Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
> -
> -This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
> -
> -That commit removed support for GPU drivers without GL_EXT_unpack_subimage
> -which SGX does not support. Add back support for GPUs without this
> -extension.
> -
> -Upstream-Status: Inappropriate [specific to TI SGX]
> -
> -Signed-off-by: Andrew Davis <afd@ti.com>
> -Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> -
> ----
> - libweston/renderer-gl/gl-renderer-internal.h |  2 ++
> - libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
> - 2 files changed, 26 insertions(+), 5 deletions(-)
> -
> -diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
> -index 5032035..85616c9 100644
> ---- a/libweston/renderer-gl/gl-renderer-internal.h
> -+++ b/libweston/renderer-gl/gl-renderer-internal.h
> -@@ -160,6 +160,8 @@ struct gl_renderer {
> -	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
> -	bool has_platform_base;
> -
> -+	bool has_unpack_subimage;
> -+
> -	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
> -	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
> -	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
> -diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> -index ccb41e6..38a0e0c 100644
> ---- a/libweston/renderer-gl/gl-renderer.c
> -+++ b/libweston/renderer-gl/gl-renderer.c
> -@@ -2106,6 +2106,7 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> - {
> -	const struct weston_testsuite_quirks *quirks =
> -		&surface->compositor->test_data.test_quirks;
> -+	struct gl_renderer *gr = get_renderer(surface->compositor);
> -	struct gl_surface_state *gs = get_surface_state(surface);
> -	struct gl_buffer_state *gb = gs->buffer;
> -	struct weston_paint_node *pnode;
> -@@ -2152,6 +2153,24 @@ gl_renderer_flush_damage(struct weston_surface *surface,
> -
> -	glActiveTexture(GL_TEXTURE0);
> -
> -+	if (!gr->has_unpack_subimage) {
> -+		wl_shm_buffer_begin_access(buffer->shm_buffer);
> -+		for (j = 0; j < gs->buffer->num_textures; j++) {
> -+			glBindTexture(GL_TEXTURE_2D, gs->buffer->textures[j]);
> -+			glTexImage2D(GL_TEXTURE_2D, 0,
> -+				     gs->buffer->gl_format[j],
> -+				     gs->buffer->pitch / pixel_format_hsub(buffer->pixel_format, j),
> -+				     buffer->height / pixel_format_vsub(buffer->pixel_format, j),
> -+				     0,
> -+				     gl_format_from_internal(gs->buffer->gl_format[j]),
> -+				     gs->buffer->gl_pixel_type,
> -+				     data + gs->buffer->offset[j]);
> -+		}
> -+		wl_shm_buffer_end_access(buffer->shm_buffer);
> -+
> -+		goto done;
> -+	}
> -+
> -	if (gb->needs_full_upload || quirks->gl_force_full_upload) {
> -		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
> -		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
> -@@ -4169,11 +4188,9 @@ gl_renderer_setup(struct weston_compositor *ec)
> -	else
> -		ec->read_format = pixel_format_get_info(DRM_FORMAT_ABGR8888);
> -
> --	if (gr->gl_version < gr_gl_version(3, 0) &&
> --	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
> --		weston_log("GL_EXT_unpack_subimage not available.\n");
> --		return -1;
> --	}
> -+	if (gr->gl_version >= gr_gl_version(3, 0) ||
> -+	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
> -+		gr->has_unpack_subimage = true;
> -
> -	if (gr->gl_version >= gr_gl_version(3, 0) ||
> -	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
> -@@ -4268,6 +4285,8 @@ gl_renderer_setup(struct weston_compositor *ec)
> -		   gr_gl_version_minor(gr->gl_version));
> -	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
> -			    ec->read_format->drm_format_name);
> -+	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
> -+			    gr->has_unpack_subimage ? "yes" : "no");
> -	weston_log_continue(STAMP_SPACE "glReadPixels supports y-flip: %s\n",
> -			    yesno(gr->has_pack_reverse));
> -	weston_log_continue(STAMP_SPACE "wl_shm 10 bpc formats: %s\n",
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> deleted file mode 100644
> index c98a62de..00000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_13.0.%.bbappend
> +++ /dev/null
> @@ -1,4 +0,0 @@
> -WESTON_ARAGO = ""
> -WESTON_ARAGO:arago = "weston-arago.inc"
> -
> -require ${WESTON_ARAGO}

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

