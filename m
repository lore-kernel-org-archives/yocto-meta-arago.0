Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A251FC64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 23:57:53 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web11.9612.1677628665306951112
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 15:57:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=nblWNuFB;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31SNveUA067122;
	Tue, 28 Feb 2023 17:57:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677628660;
	bh=96tgjfU+xAjWkM0HEVKeVN/QkXWpOgOcb41elNUOPWE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=nblWNuFBA6qxnpP/oDcamTXu2y5ec2WRBYjTPWvzBqBcwt4zCwnxUvxgRdCo6B/sc
	 ihQ2r7ejJzJJY1Orx2hLxkJeyPXWxKJ8orYfzSPqr9dKu1u1gOFjkRkoUmGddOAWe4
	 kea4Y+CbqAd9fn+Q93VQTsHk1jUg6lGQgTRZcPmQ=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31SNvem8079255
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 28 Feb 2023 17:57:40 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 28
 Feb 2023 17:57:40 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 28 Feb 2023 17:57:40 -0600
Received: from [10.250.33.59] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31SNvebL024785;
	Tue, 28 Feb 2023 17:57:40 -0600
Message-ID: <654a4a43-ece4-feb2-85ac-b0ce5cf38211@ti.com>
Date: Tue, 28 Feb 2023 17:57:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [meta-arago] [master/kirkstone][PATCH 2/2] weston: drop patch
 reverting GL_EXT_unpack_subimage requirement
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>
References: <20230224101240.4132411-1-denis@denix.org>
 <20230224101240.4132411-2-denis@denix.org>
 <a328ae4f-51af-000d-17d8-8e2889462ee2@ti.com>
 <20230228232943.GM22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230228232943.GM22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 28 Feb 2023 23:57:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14238

On 2/28/23 5:29 PM, Denys Dmytriyenko wrote:
> On Fri, Feb 24, 2023 at 08:16:25AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> On 2/24/23 4:12 AM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> With the updated graphics recipes in meta-ti this hack is no longer needed.
>>
>> Did you test that? What board and with what program?
> 
> If I remember correctly, there was a build failure in the past with newer
> Weston complaining that the extenstion does not exist in the old binary DDK.
> Since I haven't seen this failure with the updated Mesa-based graphics stack,
> I assumed that is now resolved.
> 
> My testing was mostly with Rogue and I see in the commit log that this is
> specific to SGX, which currently builds full software-rendering stack w/o any
> HW acceleration.
> 
> Is this extension a pure software implementation in Mesa or does it require
> corresponding HW support? If the latter, then we definitely still need this
> revert and my patch removing it can be dropped.
> 

Unfortunately it needs to be handled in the GPU driver on the UM side, so
not something Mesa can fix for us. And the error only shows up as a runtime
issue when you try to start Weston and it sees the extension is not available.

We will need to keep this patch until someone can add the software emulation
of this function inside the SGX UM driver. It is on my todo list for someday..

Andrew

> 
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   ...equire-GL_EXT_unpack_subimage-commit.patch | 90 -------------------
>>>   .../wayland/weston_10.0.2.bbappend            |  1 -
>>>   2 files changed, 91 deletions(-)
>>>   delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>>
>>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>> deleted file mode 100644
>>> index 8b03ddd6..00000000
>>> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-require-GL_EXT_unpack_subimage-commit.patch
>>> +++ /dev/null
>>> @@ -1,90 +0,0 @@
>>> -From 6558a9153cc81199146132041c61023a2c2e1b2e Mon Sep 17 00:00:00 2001
>>> -From: Andrew Davis <afd@ti.com>
>>> -Date: Thu, 6 Oct 2022 15:49:31 -0500
>>> -Subject: [PATCH] Revert require GL_EXT_unpack_subimage commit
>>> -
>>> -This reverts commit 593d5af43a8e2c2a3371088fa7ae430d0517c82d.
>>> -
>>> -That commit removed support for GPU drivers without GL_EXT_unpack_subimage
>>> -which SGX does not support. Add back support for GPUs without this
>>> -extension.
>>> -
>>> -Signed-off-by: Andrew Davis <afd@ti.com>
>>> ----
>>> - libweston/renderer-gl/gl-renderer-internal.h |  2 ++
>>> - libweston/renderer-gl/gl-renderer.c          | 29 ++++++++++++++++----
>>> - 2 files changed, 26 insertions(+), 5 deletions(-)
>>> -
>>> -diff --git a/libweston/renderer-gl/gl-renderer-internal.h b/libweston/renderer-gl/gl-renderer-internal.h
>>> -index 72101b47..7a6e2f48 100644
>>> ---- a/libweston/renderer-gl/gl-renderer-internal.h
>>> -+++ b/libweston/renderer-gl/gl-renderer-internal.h
>>> -@@ -133,6 +133,8 @@ struct gl_renderer {
>>> -	PFNEGLCREATEPLATFORMWINDOWSURFACEEXTPROC create_platform_window;
>>> -	bool has_platform_base;
>>> -
>>> -+	bool has_unpack_subimage;
>>> -+
>>> -	PFNEGLBINDWAYLANDDISPLAYWL bind_display;
>>> -	PFNEGLUNBINDWAYLANDDISPLAYWL unbind_display;
>>> -	PFNEGLQUERYWAYLANDBUFFERWL query_buffer;
>>> -diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
>>> -index a5f5eae4..410ba85c 100644
>>> ---- a/libweston/renderer-gl/gl-renderer.c
>>> -+++ b/libweston/renderer-gl/gl-renderer.c
>>> -@@ -1835,6 +1835,7 @@ gl_renderer_flush_damage(struct weston_surface *surface)
>>> - {
>>> -	const struct weston_testsuite_quirks *quirks =
>>> -		&surface->compositor->test_data.test_quirks;
>>> -+	struct gl_renderer *gr = get_renderer(surface->compositor);
>>> -	struct gl_surface_state *gs = get_surface_state(surface);
>>> -	struct weston_buffer *buffer = gs->buffer_ref.buffer;
>>> -	struct weston_view *view;
>>> -@@ -1872,6 +1873,24 @@ gl_renderer_flush_damage(struct weston_surface *surface)
>>> -
>>> -	glActiveTexture(GL_TEXTURE0);
>>> -
>>> -+	if (!gr->has_unpack_subimage) {
>>> -+		wl_shm_buffer_begin_access(buffer->shm_buffer);
>>> -+		for (j = 0; j < gs->num_textures; j++) {
>>> -+			glBindTexture(GL_TEXTURE_2D, gs->textures[j]);
>>> -+			glTexImage2D(GL_TEXTURE_2D, 0,
>>> -+				     gs->gl_format[j],
>>> -+				     gs->pitch / gs->hsub[j],
>>> -+				     buffer->height / gs->vsub[j],
>>> -+				     0,
>>> -+				     gl_format_from_internal(gs->gl_format[j]),
>>> -+				     gs->gl_pixel_type,
>>> -+				     data + gs->offset[j]);
>>> -+		}
>>> -+		wl_shm_buffer_end_access(buffer->shm_buffer);
>>> -+
>>> -+		goto done;
>>> -+	}
>>> -+
>>> -	if (gs->needs_full_upload || quirks->gl_force_full_upload) {
>>> -		glPixelStorei(GL_UNPACK_SKIP_PIXELS_EXT, 0);
>>> -		glPixelStorei(GL_UNPACK_SKIP_ROWS_EXT, 0);
>>> -@@ -3932,11 +3951,9 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
>>> -	else
>>> -		ec->read_format = PIXMAN_a8b8g8r8;
>>> -
>>> --	if (gr->gl_version < gr_gl_version(3, 0) &&
>>> --	    !weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage")) {
>>> --		weston_log("GL_EXT_unpack_subimage not available.\n");
>>> --		return -1;
>>> --	}
>>> -+	if (gr->gl_version >= gr_gl_version(3, 0) ||
>>> -+	    weston_check_egl_extension(extensions, "GL_EXT_unpack_subimage"))
>>> -+		gr->has_unpack_subimage = true;
>>> -
>>> -	if (gr->gl_version >= gr_gl_version(3, 0) ||
>>> -	    weston_check_egl_extension(extensions, "GL_EXT_texture_type_2_10_10_10_REV"))
>>> -@@ -3977,6 +3994,8 @@ gl_renderer_setup(struct weston_compositor *ec, EGLSurface egl_surface)
>>> -		   gr_gl_version_minor(gr->gl_version));
>>> -	weston_log_continue(STAMP_SPACE "read-back format: %s\n",
>>> -		ec->read_format == PIXMAN_a8r8g8b8 ? "BGRA" : "RGBA");
>>> -+	weston_log_continue(STAMP_SPACE "wl_shm sub-image to texture: %s\n",
>>> -+			    gr->has_unpack_subimage ? "yes" : "no");
>>> -	weston_log_continue(STAMP_SPACE "EGL Wayland extension: %s\n",
>>> -			    gr->has_bind_display ? "yes" : "no");
>>> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
>>> index b1b7d26a..dd893f1e 100644
>>> --- a/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
>>> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_10.0.2.bbappend
>>> @@ -7,5 +7,4 @@ SRC_URI += " \
>>>           file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
>>>           file://0004-weston-Fix-touch-screen-crash-issue.patch \
>>>           file://0001-backend-drm-Select-plane-based-on-current-attached-C.patch \
>>> -        file://0001-Revert-require-GL_EXT_unpack_subimage-commit.patch \
>>>   "

