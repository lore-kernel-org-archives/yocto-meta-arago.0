Return-Path: <afd@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 6D42F529DC
	for <meta-arago@arago-project.org>;
	Thu,  6 Feb 2020 15:47:33 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 016FjdKv083215;
	Thu, 6 Feb 2020 09:45:39 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1581003939;
	bh=5JNw81hC30ATgskpjcEwvjR0eaju06lh3tDjOt+eAQ0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=YhUNEVCOgQUvbbNoeVMo0nAqFFRRynoJvFvYbP34sHUaDpf5moBztTF+mTraNntvO
	a216QPSxiCEpiFKYHRfGoXEyuJqLmRWvuD5CYg/3t37ZbbbMeyLNG4Sf9gtJp1Xypo
	zSMoxMLcejZcGRZHpJgZVTdxyWN0ii159/cnD3Ss=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 016FjdTH109153
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 6 Feb 2020 09:45:39 -0600
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Thu, 6 Feb 2020 09:45:38 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Thu, 6 Feb 2020 09:45:38 -0600
Received: from [10.250.72.167] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 016FjcQS083344;
	Thu, 6 Feb 2020 09:45:38 -0600
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1580944160-32892-1-git-send-email-denis@denix.org>
From: "Andrew F. Davis" <afd@ti.com>
Message-ID: <f4c7cb67-b55d-3b27-cb6b-0cda1e19a025@ti.com>
Date: Thu, 6 Feb 2020 10:45:37 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1580944160-32892-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Scott Murray <scott.murray@konsulko.com>
Subject: Re: [zeus/master][PATCH] Revert "HACK: weston: revert EGL_KHR_partial_update changes that require EGL 1.5"
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
X-List-Received-Date: Thu, 06 Feb 2020 15:47:33 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 2/5/20 6:09 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
> 
> Now, that our SGX DDK UM libs support EGL 1.5, these can be dropped.
> 
> This reverts commit 5ab873a1b06648286711ec2b9acb849b07a5443c.
> 
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Reported-by: Scott Murray <scott.murray@konsulko.com>
> Cc: Andrew F. Davis <afd@ti.com>


Acked-by: Andrew F. Davis <afd@ti.com>

You can also drop this other weston patch for the same reason:
"Allow visual_id to be 0"

Andrew


> ---
>  ...renderer-Add-EGL_EXT_partial_update-query.patch | 47 --------------------
>  ...l-renderer-Support-EGL_KHR_partial_update.patch | 51 ----------------------
>  .../recipes-graphics/wayland/weston_7.0.0.bbappend |  7 +--
>  3 files changed, 2 insertions(+), 103 deletions(-)
>  delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
>  delete mode 100644 meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch
> 
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
> deleted file mode 100644
> index 556440e..0000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch
> +++ /dev/null
> @@ -1,47 +0,0 @@
> -From e9ce4695a1ea78434b7244705ef3fd2af7b360f7 Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Thu, 12 Sep 2019 21:03:18 -0400
> -Subject: [PATCH] Revert "gl-renderer: Add EGL_EXT_partial_update query"
> -
> -This reverts commit 0a86a81cc251330b15e213fde8434f291e35bf88.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - libweston/renderer-gl/gl-renderer.c | 7 -------
> - 1 file changed, 7 deletions(-)
> -
> -diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> -index 6c2a56d..590ef09 100644
> ---- a/libweston/renderer-gl/gl-renderer.c
> -+++ b/libweston/renderer-gl/gl-renderer.c
> -@@ -233,8 +233,6 @@ struct gl_renderer {
> - 	bool has_egl_image_external;
> - 
> - 	bool has_egl_buffer_age;
> --	bool has_egl_partial_update;
> --	PFNEGLSETDAMAGEREGIONKHRPROC set_damage_region;
> - 
> - 	bool has_configless_context;
> - 
> -@@ -3515,8 +3513,6 @@ gl_renderer_setup_egl_extensions(struct weston_compositor *ec)
> - 		(void *) eglGetProcAddress("eglUnbindWaylandDisplayWL");
> - 	gr->query_buffer =
> - 		(void *) eglGetProcAddress("eglQueryWaylandBufferWL");
> --	gr->set_damage_region =
> --		(void *) eglGetProcAddress("eglSetDamageRegionKHR");
> - 
> - 	extensions =
> - 		(const char *) eglQueryString(gr->egl_display, EGL_EXTENSIONS);
> -@@ -3539,9 +3535,6 @@ gl_renderer_setup_egl_extensions(struct weston_compositor *ec)
> - 	if (weston_check_egl_extension(extensions, "EGL_EXT_buffer_age"))
> - 		gr->has_egl_buffer_age = true;
> - 
> --	if (weston_check_egl_extension(extensions, "EGL_KHR_partial_update"))
> --		gr->has_egl_partial_update = true;
> --
> - 	for (i = 0; i < ARRAY_LENGTH(swap_damage_ext_to_entrypoint); i++) {
> - 		if (weston_check_egl_extension(extensions,
> - 				swap_damage_ext_to_entrypoint[i].extension)) {
> --- 
> -2.7.4
> -
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch b/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch
> deleted file mode 100644
> index f6fd845..0000000
> --- a/meta-arago-distro/recipes-graphics/wayland/weston/0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch
> +++ /dev/null
> @@ -1,51 +0,0 @@
> -From c4e7764e9062729a320d2a81f4b4f1a2392454cb Mon Sep 17 00:00:00 2001
> -From: Denys Dmytriyenko <denys@ti.com>
> -Date: Thu, 12 Sep 2019 21:20:01 -0400
> -Subject: [PATCH] Revert "gl-renderer: Support EGL_KHR_partial_update"
> -
> -This reverts commit df2095fa35fe84e4ebc30754dd9f25e50bd1aa47.
> -
> -Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ----
> - libweston/renderer-gl/gl-renderer.c | 18 ++----------------
> - 1 file changed, 2 insertions(+), 16 deletions(-)
> -
> -diff --git a/libweston/renderer-gl/gl-renderer.c b/libweston/renderer-gl/gl-renderer.c
> -index 590ef09..a95e873 100644
> ---- a/libweston/renderer-gl/gl-renderer.c
> -+++ b/libweston/renderer-gl/gl-renderer.c
> -@@ -1531,8 +1531,8 @@ gl_renderer_repaint_output(struct weston_output *output,
> - 
> - 	/* In fan debug mode, redraw everything to make sure that we clear any
> - 	 * fans left over from previous draws on this buffer.
> --	 * This precludes the use of EGL_EXT_swap_buffers_with_damage and
> --	 * EGL_KHR_partial_update, since we damage the whole area. */
> -+	 * This precludes the use of EGL_EXT_swap_buffers_with_damage, since
> -+	 * we damage the whole area. */
> - 	if (gr->fan_debug) {
> - 		pixman_region32_t undamaged;
> - 		pixman_region32_init(&undamaged);
> -@@ -1560,20 +1560,6 @@ gl_renderer_repaint_output(struct weston_output *output,
> - 	pixman_region32_union(&total_damage, &previous_damage, output_damage);
> - 	border_status |= go->border_status;
> - 
> --	if (gr->has_egl_partial_update && !gr->fan_debug) {
> --		int n_egl_rects;
> --		EGLint *egl_rects;
> --
> --		/* For partial_update, we need to pass the region which has
> --		 * changed since we last rendered into this specific buffer;
> --		 * this is total_damage. */
> --		pixman_region_to_egl_y_invert(output, &total_damage,
> --					      &egl_rects, &n_egl_rects);
> --		gr->set_damage_region(gr->egl_display, go->egl_surface,
> --				      egl_rects, n_egl_rects);
> --		free(egl_rects);
> --	}
> --
> - 	repaint_views(output, &total_damage);
> - 
> - 	pixman_region32_fini(&total_damage);
> --- 
> -2.7.4
> -
> diff --git a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
> index fc448b4..c2f4ef3 100644
> --- a/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
> +++ b/meta-arago-distro/recipes-graphics/wayland/weston_7.0.0.bbappend
> @@ -1,15 +1,12 @@
>  PACKAGECONFIG[kms] = "-Dbackend-drm=true,-Dbackend-drm=false,drm udev virtual/libgbm mtdev"
>  
> -PR_append = ".arago0"
> +PR_append = ".arago1"
>  
>  FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>  
>  RDEPENDS_${PN} += "weston-conf"
>  
> -SRC_URI += " \
> -        file://0001-Revert-gl-renderer-Add-EGL_EXT_partial_update-query.patch \
> -        file://0001-Revert-gl-renderer-Support-EGL_KHR_partial_update.patch \
> -"
> +#SRC_URI += " \
>  #        file://0002-weston-Allow-visual_id-to-be-0.patch \
>  #        file://0003-weston-Fix-virtual-keyboard-display-issue-for-QT5-ap.patch \
>  #        file://0004-weston-Fix-touch-screen-crash-issue.patch \
> 

