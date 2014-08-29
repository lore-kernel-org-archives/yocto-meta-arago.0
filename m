Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 9B97E52992
	for <meta-arago@arago-project.org>;
	Fri, 29 Aug 2014 17:16:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s7THG2A6027091
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:16:03 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THG2bj002551
	for <meta-arago@arago-project.org>; Fri, 29 Aug 2014 12:16:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 29 Aug 2014 12:16:01 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s7THG1TS020681;
	Fri, 29 Aug 2014 12:16:01 -0500
Date: Fri, 29 Aug 2014 13:16:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Karthik Ramanan <a0393906@ti.com>
Message-ID: <20140829171600.GJ18620@edge>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<1408713923-25284-3-git-send-email-a0393906@ti.com>
MIME-Version: 1.0
In-Reply-To: <1408713923-25284-3-git-send-email-a0393906@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, nikhil.nd@ti.com
Subject: Re: [PATCH 2/2] wayland: adding support for weston 1.3.0 for DRM backend
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
X-List-Received-Date: Fri, 29 Aug 2014 17:16:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Karthik,

Few comments:

1. Please overlay the original 1.3.0 version of weston from oe-core/dora as is 
in a separate patch, before patching it with own changes.
2. And in the description please mention it's weston (even though it's in the 
same wayland directory) as well as it's an initial overlay of original recipe 
from oe-core/dora that will be patched separately.
3. It looks like weston.desktop and weston.png files below got corrupted, 
please fix.

Thanks.

-- 
Denys


On Fri, Aug 22, 2014 at 06:55:23PM +0530, Karthik Ramanan wrote:
> On devices where the backend is chosen as DRM, as in the case
> of dra7xx, there are some addition patches that are specific
> to the omapdrm which are needed for basic functionality and
> some bug fixes.
> 
> * This will full enable multiple display support
> * Handle screensavers more efficient
> * Be compatible with libgbm, TI adaptation of libgbm
> 
> Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> ---
>  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
>  ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
>  ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
>  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
>  .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
>  .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 bytes
>  meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
>  .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 bytes
>  .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
>  .../recipes-graphics/wayland/weston.png            |  147 +++++++++++++++++++
>  .../recipes-graphics/wayland/weston_1.3.0.bb       |  148 ++++++++++++++++++++
>  11 files changed, 578 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
>  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enable-weston-1.3.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable-multiple-displays.patch
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/pattern.png
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/profile
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/terminal.png
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.desktop
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.png
>  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> new file mode 100755
> index 0000000..cd0581a
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> @@ -0,0 +1,26 @@
> +From 5f655cb89813e39d6410493b4725e447212ea3a3 Mon Sep 17 00:00:00 2001
> +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +Date: Tue, 24 Sep 2013 19:13:50 +0530
> +Subject: [PATCH] compositor-drm: Change path of gbm.h to gbm/gbm.h
> +
> +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +---
> + src/compositor-drm.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> +index f055118..7a59872 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -35,7 +35,7 @@
> + #include <xf86drmMode.h>
> + #include <drm_fourcc.h>
> + 
> +-#include <gbm.h>
> ++#include <gbm/gbm.h>
> + #include <libbacklight.h>
> + #include <libudev.h>
> + 
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch b/meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch
> new file mode 100755
> index 0000000..557373d
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch
> @@ -0,0 +1,47 @@
> +From c8b6fe71ad0231c4787836f4156e604cedfe45a8 Mon Sep 17 00:00:00 2001
> +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +Date: Thu, 3 Jul 2014 15:06:31 +0530
> +Subject: [PATCH] Makefile change to search for correct drm headers
> +
> +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> +---
> + src/Makefile.am   | 3 ++-
> + tests/Makefile.am | 1 +
> + 2 files changed, 3 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/Makefile.am b/src/Makefile.am
> +index 749c074..a6e44e7 100644
> +--- a/src/Makefile.am
> ++++ b/src/Makefile.am
> +@@ -2,6 +2,7 @@ bin_PROGRAMS = weston				\
> + 	$(weston_launch)
> + 
> + AM_CPPFLAGS =					\
> ++        $(DRM_COMPOSITOR_CFLAGS)                \
> + 	-I$(top_srcdir)/shared			\
> + 	-DDATADIR='"$(datadir)"'		\
> + 	-DMODULEDIR='"$(moduledir)"'		\
> +@@ -9,7 +10,7 @@ AM_CPPFLAGS =					\
> + 	-DIN_WESTON
> + 
> + weston_LDFLAGS = -export-dynamic
> +-weston_CFLAGS = $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS)
> ++weston_CFLAGS = $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLAGS) 
> + weston_LDADD = $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
> + 	$(DLOPEN_LIBS) -lm ../shared/libshared.la
> + 
> +diff --git a/tests/Makefile.am b/tests/Makefile.am
> +index 5be52c6..42ebd2b 100644
> +--- a/tests/Makefile.am
> ++++ b/tests/Makefile.am
> +@@ -47,6 +47,7 @@ AM_CPPFLAGS =					\
> + 	-I$(top_srcdir)/shared			\
> + 	-I$(top_builddir)/src			\
> + 	-DUNIT_TEST				\
> ++	$(DRM_COMPOSITOR_CFLAGS)                \
> + 	$(COMPOSITOR_CFLAGS)
> + 
> + surface_global_test_la_SOURCES = surface-global-test.c
> +-- 
> +2.0.1
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patch b/meta-arago-extras/recipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patch
> new file mode 100644
> index 0000000..74e82fb
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patch
> @@ -0,0 +1,34 @@
> +From cdd9043580e0f0a6c60c21b955f1966c78b2098b Mon Sep 17 00:00:00 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Mon, 2 Dec 2013 15:52:41 +0530
> +Subject: [PATCH] input source: prevent input disable during repaint
> +
> +Under certain race conditions, the input source was getting
> +disabled which was preventing the evdev events from keyboard or
> +mouse to reach Weston. The side effect of this issue was
> +that after the screen gets locked, it was not possible to
> +come to Weston desktop without killing Weston.
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor.c |    4 ----
> + 1 files changed, 0 insertions(+), 4 deletions(-)
> +
> +diff --git a/src/compositor.c b/src/compositor.c
> +index 0e0835f..ced3883 100644
> +--- a/src/compositor.c
> ++++ b/src/compositor.c
> +@@ -1084,10 +1084,6 @@ weston_output_schedule_repaint(struct weston_output *output)
> + 	wl_event_loop_add_idle(loop, idle_repaint, output);
> + 	output->repaint_scheduled = 1;
> + 
> +-	if (compositor->input_loop_source) {
> +-		wl_event_source_remove(compositor->input_loop_source);
> +-		compositor->input_loop_source = NULL;
> +-	}
> + }
> + 
> + WL_EXPORT void
> +-- 
> +1.7.0.4
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enable-weston-1.3.patch
> new file mode 100644
> index 0000000..0c860b3
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enable-weston-1.3.patch
> @@ -0,0 +1,33 @@
> +From 518fe5aea452a4660e07855716349a0c84e59b14 Mon Sep 17 00:00:00 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Tue, 21 Jan 2014 11:48:19 +0000
> +Subject: [PATCH] temp-hack: to enable weston 1.3
> +
> +This patch resolves the issue with the black display seen
> +when running weston 1.3 version on the dra7xx target.
> +
> +Known issues:
> +1. simple-egl application does not work
> +2. weston on multiple displays does not work
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor-drm.c |    2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> +index 0ac5efa..dd28f0f 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -616,7 +616,7 @@ drm_output_repaint(struct weston_output *output_base,
> + 			.request.sequence = 1,
> + 		};
> + 
> +-		if ((!s->current && !s->next) ||
> ++		if ((!s->current && !s->next) &&
> + 		    !drm_sprite_crtc_supported(output_base, s->possible_crtcs))
> + 			continue;
> + 
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable-multiple-displays.patch
> new file mode 100644
> index 0000000..abc4295
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable-multiple-displays.patch
> @@ -0,0 +1,43 @@
> +From dce69cadd858bd959dd41edf82860cd370ca1fa8 Mon Sep 17 00:00:00 2001
> +From: Karthik Ramanan <a0393906@ti.com>
> +Date: Fri, 14 Mar 2014 18:55:12 +0530
> +Subject: [PATCH] weston-drm: Enable multiple displays
> +
> +We are currently seeing an issue with missing VBlanks for LCD and
> +HDMI connectors which leads to display not getting refreshed.
> +This patch can be considered as a workaround.
> +
> +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> +---
> + src/compositor-drm.c |    8 +++++++-
> + 1 file changed, 7 insertions(+), 1 deletion(-)
> +
> +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> +index 79dcc6c..ef2fbd2 100644
> +--- a/src/compositor-drm.c
> ++++ b/src/compositor-drm.c
> +@@ -709,6 +709,7 @@ page_flip_handler(int fd, unsigned int frame,
> + {
> + 	struct drm_output *output = (struct drm_output *) data;
> + 	uint32_t msecs;
> ++	uint32_t bail;
> + 
> + 	/* We don't set page_flip_pending on start_repaint_loop, in that case
> + 	 * we just want to page flip to the current buffer to get an accurate
> +@@ -721,7 +722,12 @@ page_flip_handler(int fd, unsigned int frame,
> + 
> + 	output->page_flip_pending = 0;
> + 
> +-	if (!output->vblank_pending) {
> ++	if (output->vblank_pending) {
> ++		weston_log("VBlank is pending for connector = %d, frame = %d\n", output->connector_id, frame);
> ++		bail = 1;
> ++	}
> ++
> ++	if (!output->vblank_pending || bail) {
> + 		msecs = sec * 1000 + usec / 1000;
> + 		weston_output_finish_frame(&output->base, msecs);
> + 
> +-- 
> +1.7.9.5
> +
> diff --git a/meta-arago-extras/recipes-graphics/wayland/pattern.png b/meta-arago-extras/recipes-graphics/wayland/pattern.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..5ac8986d6721b4c19794f1d24e513af7015aa395
> GIT binary patch
> literal 1846
> zcmV-62g&$}P)<h;3K|Lk000e1NJLTq0027x001Hg0ssI2Zk{%`00009a7bBm000XU
> z000XU0RWnu7ytkO2XskIMF-pg859yTWl~)@000KnNkl<ZSi`MY+mh=l4h1B@j?;Vp
> z>r~C#{PdYlVhp;R2PK4doYbCEL-j*f%te=_#S;EM|Na*MoK7bnf^%-$wyhNBoO5nj
> z&Vb;K#()3%%Y7VqnsUyszpKdi_jjM8s&(5wpVddJZC!8Zy+19B_x`?1&cTOuy*cN$
> zt(<WAutf+V=Lr#f2u$2st+jT`4wr1(X8+9dDW+%^hY-x%Qc8+3035nn%Icg8IZxeO
> z8!^QgqjQdks8L_A-fs8*Rh@Gw=jD8kDOz#>VVdW8KHcNdnoS!A6Prsh#+agW&U-)4
> zr_<@a%6oskUh7tO3x)Z1yV-^zMtpT>nrCxkU2no{v1zSYgj8gnPt&w_)x4di*}UrL
> z8cx05_n)S5$rw~sEoHrYf4AD0n2Ad%*Xxy;Z30?^cEfugW308R>h*d}Ik(oFbJSYS
> zIRG3c&PK|Ks1cEcGw19>XtkBHT99Ilhll=fPsEV<I`G{Z#Arv3(dvm7W>x3CJ2V|J
> z5|MMR)+e&ZukL>w-ur&^fyKfc0A4fhoI^xaE$eC__uhZ~`t>>u0Gx9WK%L4<35NFp
> zW}-f)FZAB0n6`Q^S!}gg5%dbXTrTf+1i;$>snhA0Nr=fg$HG&dYO5k*{#%@0E3(%m
> zJuLRlr<j<@`w$UjSc0Xj0HG(>hk%HEW%oFyq^d03%>{r%24&*<pfFX<F^OvMzP8G$
> zMw)=jE{Aoi+g5gof)2USVpY9dE_s?#O18^<I*ox0AuQ*!eG-0J!_3#q1rYn$s>(!t
> zp(WILAH28xu++W~V+=m1Q&pwbM(}v=5pjp(4(0oYt(3ZLF-9xx<$M<AM#MyjvD*{?
> z#tbm?Xy2Y~hJ_Zh>@zd7u!wZef7A(J2mxNI*`RD|!}x0m;2wZu7GYLZQE~sLp{lC#
> z4#&<pQBl>y31*3^qS-o4bFV*PzFx0SA`{6e8H0|+;hak;h44fhGmCKN#M)~1xibS1
> zHENx6Vodf)M2MP^kBEo}F{Q`XZf<RNmc$XJHu`<oXJ0NCGi%%h0H%5VQ7Z`M#^|uB
> zGBW^(-0>4*oFCV+a}FHD6!Q=!RV8XE<<W*G4b1atG*_5KB!n>jsH#LnL;#pl>Je?V
> z9mpeqoTq!)Ik(lVQ7c>N3>9NKT(vCA0MS51Wh=GT9ixXGLj{0ezki><z7DyTs7>>n
> zAFANpMS4$&54F`X*iQmERDuAez>LcqHRIE9lTWwwA^eRQa?U9wVF}^*Y@5cyotVZr
> zG4neq8~|KvyVFMyf3lb!RRRDhWz#V|Jl^{c0=zzM)M=ViP6oDhUCk4sW<UP3fhzK<
> zq*TO8K7?R;pM~qTSv4>*F&(xTrb{iNd78Rq0pPSOb}<nV6MybFQc8#sBdQ1ycircl
> z3$-0o&$_M;<#4adoKj~%K-fyTU9Yc=MsK>j_dA!o_w$2Wtefado_&LA2w_>y(>!BD
> zQw=f2^Ve7B&``Hce%@PUU5#{8N~7M`rILugzrV}6n(l73UB17&F6}k6r;%wgD3^7$
> zWNxLb>zz-%_sjX9;j`AxxD`#a&-2MrP)cc!sCOd!Fb);4d3c=e7|knd7Y0GX81Ws_
> zdVh7jUeFfwerD8b9~zB6k>1A>LI40O!S(`3Gu?Y1AiR<wAb9W5^oJ?hKh)hLibm;;
> zfZqFl6(7*0st@6ij{yQT>hS0!^UCyhc8eJ8q#mRXp(;bm88I@ms+yebyw+;nrFbjl
> z5I<%Iv-CV8;-R^A;TtL>#;0Vl{=_cfu|0V_8kC*hKP)m4DeF24kKQ=$+Au)eU7w?(
> z_|appYu9dJgh5aAy55+R4*>$OurTkCXL9x@mVh51skJimG|g7~7;&CYqh(|2$IWlI
> zYyA1nBFsc|SM&%Ne+vE_6PY@G+#|2$g@AC>y;|>Jn*H8xTrVMnlyb@`rik$uHDV@a
> z9#fxE9>dXEbM3eug1!iLy~}6){GK3(?^LR<k{l5`|Eq}kBk~U$1!R%h+DN@y-8!Gg
> zl;Y!gp;5DjOjTK#g@Iwm*^OwVofzXZO`V&|x{gV!TkT=)CEFWee6WHkxb~2p_z3G=
> zaE*kzEXxQcK+v4WlDBC6Y!;r8v$w$UWpanHQr6b0Ro+<5({#V02fc<lXLHzU4q9uq
> zRr~9V6OKB>X`V-NP}N$uvh4{35qCUeVsO`WGIQNFYHb<bSGTPka;v=tJ~}O?Kh)i(
> zj|Uhu7E#qkt=4KAI_CiQI(9yte*ONvoX`03$<n<%l*7C3=6Qp#@H<uhR(Br>|HFO$
> kxK|L<X!fG_PKy%J-z0HV3sWdKrT_o{07*qoM6N<$g6D&ck^lez
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/profile b/meta-arago-extras/recipes-graphics/wayland/profile
> new file mode 100644
> index 0000000..69564f2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/profile
> @@ -0,0 +1,9 @@
> +if test -z "${XDG_RUNTIME_DIR}"; then
> +    export XDG_RUNTIME_DIR=/tmp/${UID}-runtime-dir
> +    if ! test -d "${XDG_RUNTIME_DIR}"; then
> +        mkdir "${XDG_RUNTIME_DIR}"
> +        chmod 0700 "${XDG_RUNTIME_DIR}"
> +    fi
> +else 
> +   echo "Doing nothing"
> +fi
> diff --git a/meta-arago-extras/recipes-graphics/wayland/terminal.png b/meta-arago-extras/recipes-graphics/wayland/terminal.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..3c02dd2100aa31389ace70cbf649215a982674b2
> GIT binary patch
> literal 1005
> zcmV<J0}}j+P)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00004b3#c}2nYxW
> zd<bNS00009a7bBm000fw000fw0YWI7cmMzZ8FWQhbW?9;ba!ELWdL_~cP?peYja~^
> zaAhuUa%Y?FJQ@H101k9TSaeirbZlh+RAq8)X>MU`)%&240000NbVXQnL3MO!Z*l-k
> zVQ_CCLt$)TZDDR?a%E}Xks2xh001d;MObu1WpiV4X>fFDZ*BlWVRL0<Aa7<MN?~ht
> zVjxp=Wod3@awl^jcW-iQC(|dH0008`Nkl<ZNQu3aJ#QRk6osGnV|J6^*!u-G4F<Ug
> z73p`8V);klAd!Ls(I5)`1_h!-6i7fpD&z<uf-S*+NEDPHAt8hViDO&q-I;gh{kRnS
> z;ay^&@P;$G(u_27&fIg)dzFarETNw%`~M+e0p5A{?XO~t+lwSN#@zh$lh3YOfEeTU
> z`|o`~mSs<swRY~_7(<K^@BOqw2y@R>Rq@fsA8rFv0hCf)+uB;l-~X_;M~o2|Ta;2_
> zlBOq*9!+1=TBDSr_j-@UN`pMldGPZC9_~M+exXjU+rv3Wzu#v#95NgZao&?sBBgY;
> zz)E9<8*kmfImgbeTPOvqt7~YjP(~v_tJCJyD_6L@vW&470HrlbE8OAHoPZu#bShAJ
> z&*xu$!E0Bqa{Kmopf!S!JICY42joS8HimZRd5WSSAD43l!#oE-M2PWk9Zb+{wdi%b
> zbh};d+`Y@%i)&=H8UpwfXm#4GzqC%RUPD9(DG^g7N+OC-xRP1Ur!4XzaCm&o8*g66
> z2T!Nn=43FS@}9$^Bed2mEiEw^4souaC>(j7PiHXcU`}AxqGq$n{{B7}FJ0m}qj_ax
> zgLbn;?s5(epU`P{u(b>ku(cXljMUQw;+W7C?re*uGYB4wV3c5#;pO#p8jU8-72Laj
> zA8if&lRm!klvPDpI*L4}sz&GG%nnkDGbw6}4wSW6W4QCvJrqz@6{|0-l4TjuXcCYy
> z`o`Fd7y=;#PLBIyfthnKYmxUAGIN~_1{h;7#!&hSS32T2hA~EB3{&#p{eP$E^71m7
> zwU{i!&a4M*G+OIvLQ)(FOo*fR_z?K>_dotUMP*r%M6iIU)3RE@*pehdNRbc&A&mEt
> z_xP&%rx~0I{PxSQoELKfN-4Fubq#=Tc6QE9J`tFmL6%ZtcW;->W(yJUVYKj+QpN(c
> zs;qw8-TQuXA?#y_$hUx1z(rsK*aQrq&dUvW;A`MOjY(@jeF5YXB%lC-5)qVAYJubv
> bh=|Bv8b1-Z;i*mk00000NkvXXu0mjftX;i`
> 
> literal 0
> HcmV?d00001
> 
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.desktop b/meta-arago-extras/recipes-graphics/wayland/weston.desktop
> new file mode 100644
> index 0000000..8d4dca8
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston.desktop
> @@ -0,0 +1,91 @@
> +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> +<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
> +<head>
> +<title>poky - Poky Build Tool and Metadata</title>
> +<meta name='generator' content='cgit v0.9.1'/>
> +<meta name='robots' content='index, nofollow'/>
> +<link rel='stylesheet' type='text/css' href='/cgit/cgit.css'/>
> +<link rel='shortcut icon' href='/favicon.ico'/>
> +<link rel='alternate' title='Atom feed' href='http://git.yoctoproject.org/cgit/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/weston.desktop?h=master' type='application/atom+xml'/>
> +</head>
> +<body>
> +<div id='cgit'><table id='header'>
> +<tr>
> +<td class='logo' rowspan='2'><a href='/cgit/cgit.cgi/'><img src='/cgit/yocto-project-transp.png' alt='cgit logo'/></a></td>
> +<td class='main'><a href='/cgit/cgit.cgi/'>index</a> : <a title='poky' href='/cgit/cgit.cgi/poky/'>poky</a></td><td class='form'><form method='get' action=''>
> +<select name='h' onchange='this.form.submit();'>
> +<option value='1.1_M1'>1.1_M1</option>
> +<option value='1.1_M2'>1.1_M2</option>
> +<option value='1.1_M3'>1.1_M3</option>
> +<option value='1.1_M4'>1.1_M4</option>
> +<option value='1.2_M1'>1.2_M1</option>
> +<option value='1.2_M2'>1.2_M2</option>
> +<option value='1.2_M3'>1.2_M3</option>
> +<option value='1.2_M4'>1.2_M4</option>
> +<option value='1.3_M1'>1.3_M1</option>
> +<option value='1.3_M2'>1.3_M2</option>
> +<option value='1.3_M3'>1.3_M3</option>
> +<option value='1.3_M4'>1.3_M4</option>
> +<option value='1.3_M5'>1.3_M5</option>
> +<option value='1.3_beta'>1.3_beta</option>
> +<option value='1.4_M1'>1.4_M1</option>
> +<option value='1.4_M3'>1.4_M3</option>
> +<option value='1.4_M4'>1.4_M4</option>
> +<option value='1.4_M5'>1.4_M5</option>
> +<option value='bernard'>bernard</option>
> +<option value='blinky'>blinky</option>
> +<option value='clyde'>clyde</option>
> +<option value='danny'>danny</option>
> +<option value='danny-next'>danny-next</option>
> +<option value='denzil'>denzil</option>
> +<option value='dylan'>dylan</option>
> +<option value='edison'>edison</option>
> +<option value='elroy'>elroy</option>
> +<option value='green'>green</option>
> +<option value='laverne'>laverne</option>
> +<option value='master' selected='selected'>master</option>
> +<option value='master-next'>master-next</option>
> +<option value='pinky'>pinky</option>
> +<option value='purple'>purple</option>
> +</select> <input type='submit' name='' value='switch'/></form></td></tr>
> +<tr><td class='sub'>Poky Build Tool and Metadata</td><td class='sub right'>git repository hosting</td></tr></table>
> +<table class='tabs'><tr><td>
> +<a href='/cgit/cgit.cgi/poky/'>summary</a><a href='/cgit/cgit.cgi/poky/refs/'>refs</a><a href='/cgit/cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.desktop'>log</a><a class='active' href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.desktop'>tree</a><a href='/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/weston/weston.desktop'>commit</a><a href='/cgit/cgit.cgi/poky/diff/meta/recipes-graphics/wayland/weston/weston.desktop'>diff</a><a href='/cgit/cgit.cgi/poky/stats/meta/recipes-graphics/wayland/weston/weston.desktop'>stats</a></td><td class='form'><form class='right' method='get' action='/cgit/cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.desktop'>
> +<select name='qt'>
> +<option value='grep'>log msg</option>
> +<option value='author'>author</option>
> +<option value='committer'>committer</option>
> +<option value='range'>range</option>
> +</select>
> +<input class='txt' type='text' size='10' name='q' value=''/>
> +<input type='submit' value='search'/>
> +</form>
> +</td></tr></table>
> +<div class='path'>path: <a href='/cgit/cgit.cgi/poky/tree/'>root</a>/<a href='/cgit/cgit.cgi/poky/tree/meta'>meta</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics'>recipes-graphics</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland'>wayland</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'>weston</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.desktop'>weston.desktop</a></div><div class='content'>blob: 1086ae8bf6558c06fe9a498bd093a24613fa5507 (<a href='/cgit/cgit.cgi/poky/plain/meta/recipes-graphics/wayland/weston/weston.desktop'>plain</a>)
> +<table summary='blob content' class='blob'>
> +<tr><td class='linenumbers'><pre><a class='no' id='n1' name='n1' href='#n1'>1</a>
> +<a class='no' id='n2' name='n2' href='#n2'>2</a>
> +<a class='no' id='n3' name='n3' href='#n3'>3</a>
> +<a class='no' id='n4' name='n4' href='#n4'>4</a>
> +<a class='no' id='n5' name='n5' href='#n5'>5</a>
> +<a class='no' id='n6' name='n6' href='#n6'>6</a>
> +<a class='no' id='n7' name='n7' href='#n7'>7</a>
> +<a class='no' id='n8' name='n8' href='#n8'>8</a>
> +<a class='no' id='n9' name='n9' href='#n9'>9</a>
> +</pre></td>
> +<td class='lines'><pre><code>[Desktop Entry]
> +Encoding=UTF-8
> +Type=Application
> +Name=Weston
> +Comment=Wayland Compostitor
> +Exec=weston
> +Icon=weston
> +Terminal=false
> +Categories=Utility;
> +</code></pre></td></tr></table>
> +</div> <!-- class=content -->
> +<div class='footer'>generated  by cgit v0.9.1 at 2013-09-17 12:41:43 (GMT)</div>
> +</div> <!-- id=cgit -->
> +</body>
> +</html>
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.png b/meta-arago-extras/recipes-graphics/wayland/weston.png
> new file mode 100644
> index 0000000..1c01c90
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston.png
> @@ -0,0 +1,147 @@
> +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> +<html xmlns='http://www.w3.org/1999/xhtml' xml:lang='en' lang='en'>
> +<head>
> +<title>poky - Poky Build Tool and Metadata</title>
> +<meta name='generator' content='cgit v0.9.1'/>
> +<meta name='robots' content='index, nofollow'/>
> +<link rel='stylesheet' type='text/css' href='/cgit/cgit.css'/>
> +<link rel='shortcut icon' href='/favicon.ico'/>
> +<link rel='alternate' title='Atom feed' href='http://git.yoctoproject.org/cgit/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/weston.png?h=master' type='application/atom+xml'/>
> +</head>
> +<body>
> +<div id='cgit'><table id='header'>
> +<tr>
> +<td class='logo' rowspan='2'><a href='/cgit/cgit.cgi/'><img src='/cgit/yocto-project-transp.png' alt='cgit logo'/></a></td>
> +<td class='main'><a href='/cgit/cgit.cgi/'>index</a> : <a title='poky' href='/cgit/cgit.cgi/poky/'>poky</a></td><td class='form'><form method='get' action=''>
> +<select name='h' onchange='this.form.submit();'>
> +<option value='1.1_M1'>1.1_M1</option>
> +<option value='1.1_M2'>1.1_M2</option>
> +<option value='1.1_M3'>1.1_M3</option>
> +<option value='1.1_M4'>1.1_M4</option>
> +<option value='1.2_M1'>1.2_M1</option>
> +<option value='1.2_M2'>1.2_M2</option>
> +<option value='1.2_M3'>1.2_M3</option>
> +<option value='1.2_M4'>1.2_M4</option>
> +<option value='1.3_M1'>1.3_M1</option>
> +<option value='1.3_M2'>1.3_M2</option>
> +<option value='1.3_M3'>1.3_M3</option>
> +<option value='1.3_M4'>1.3_M4</option>
> +<option value='1.3_M5'>1.3_M5</option>
> +<option value='1.3_beta'>1.3_beta</option>
> +<option value='1.4_M1'>1.4_M1</option>
> +<option value='1.4_M3'>1.4_M3</option>
> +<option value='1.4_M4'>1.4_M4</option>
> +<option value='1.4_M5'>1.4_M5</option>
> +<option value='bernard'>bernard</option>
> +<option value='blinky'>blinky</option>
> +<option value='clyde'>clyde</option>
> +<option value='danny'>danny</option>
> +<option value='danny-next'>danny-next</option>
> +<option value='denzil'>denzil</option>
> +<option value='dylan'>dylan</option>
> +<option value='edison'>edison</option>
> +<option value='elroy'>elroy</option>
> +<option value='green'>green</option>
> +<option value='laverne'>laverne</option>
> +<option value='master' selected='selected'>master</option>
> +<option value='master-next'>master-next</option>
> +<option value='pinky'>pinky</option>
> +<option value='purple'>purple</option>
> +</select> <input type='submit' name='' value='switch'/></form></td></tr>
> +<tr><td class='sub'>Poky Build Tool and Metadata</td><td class='sub right'>git repository hosting</td></tr></table>
> +<table class='tabs'><tr><td>
> +<a href='/cgit/cgit.cgi/poky/'>summary</a><a href='/cgit/cgit.cgi/poky/refs/'>refs</a><a href='/cgit/cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.png'>log</a><a class='active' href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.png'>tree</a><a href='/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/weston/weston.png'>commit</a><a href='/cgit/cgit.cgi/poky/diff/meta/recipes-graphics/wayland/weston/weston.png'>diff</a><a href='/cgit/cgit.cgi/poky/stats/meta/recipes-graphics/wayland/weston/weston.png'>stats</a></td><td class='form'><form class='right' method='get' action='/cgit/cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.png'>
> +<select name='qt'>
> +<option value='grep'>log msg</option>
> +<option value='author'>author</option>
> +<option value='committer'>committer</option>
> +<option value='range'>range</option>
> +</select>
> +<input class='txt' type='text' size='10' name='q' value=''/>
> +<input type='submit' value='search'/>
> +</form>
> +</td></tr></table>
> +<div class='path'>path: <a href='/cgit/cgit.cgi/poky/tree/'>root</a>/<a href='/cgit/cgit.cgi/poky/tree/meta'>meta</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics'>recipes-graphics</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland'>wayland</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'>weston</a>/<a href='/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.png'>weston.png</a></div><div class='content'>blob: ea8b7e0e233c86301a88e5bc925f09b3de2f9dec (<a href='/cgit/cgit.cgi/poky/plain/meta/recipes-graphics/wayland/weston/weston.png'>plain</a>)
> +<table summary='blob content' class='bin-blob'>
> +<tr><th>ofs</th><th>hex dump</th><th>ascii</th></tr><tr><td class='right'>0000</td><td class='hex'> 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48 44 52    00 00 00 25 00 00 00 30 08 06 00 00 00 96 85 b3 </td><td class='hex'>.PNG........IHDR...%...0........</td></tr>
> +<tr><td class='right'>0020</td><td class='hex'> 2b 00 00 00 04 67 41 4d 41 00 00 b1 8f 0b fc 61    05 00 00 00 01 73 52 47 42 00 ae ce 1c e9 00 00 </td><td class='hex'>+....gAMA......a.....sRGB.......</td></tr>
> +<tr><td class='right'>0040</td><td class='hex'> 00 20 63 48 52 4d 00 00 7a 26 00 00 80 84 00 00    fa 00 00 00 80 e8 00 00 75 30 00 00 ea 60 00 00 </td><td class='hex'>..cHRM..z&amp;..............u0...`..</td></tr>
> +<tr><td class='right'>0060</td><td class='hex'> 3a 98 00 00 17 70 9c ba 51 3c 00 00 00 06 62 4b    47 44 00 ff 00 ff 00 ff a0 bd a7 93 00 00 00 09 </td><td class='hex'>:....p..Q&lt;....bKGD..............</td></tr>
> +<tr><td class='right'>0080</td><td class='hex'> 70 48 59 73 00 00 06 5a 00 00 06 5a 01 60 79 c1    63 00 00 08 1f 49 44 41 54 58 c3 ed 98 59 6c 5c </td><td class='hex'>pHYs...Z...Z.`y.c....IDATX...Yl\</td></tr>
> +<tr><td class='right'>00a0</td><td class='hex'> 57 19 c7 7f e7 de 59 6c 8f 77 3b b6 53 37 4e 42    52 a2 38 4d 23 a5 01 b7 d0 36 05 85 b6 34 05 5a </td><td class='hex'>W.....Yl.w;.S7NBR.8M#....6...4.Z</td></tr>
> +<tr><td class='right'>00c0</td><td class='hex'> a4 aa 08 85 4d e2 05 89 07 88 04 3c a0 96 b2 54    42 28 b4 f0 50 40 55 29 12 95 8a 04 88 48 28 11 </td><td class='hex'>....M......&lt;...TB(..P@U).....H(.</td></tr>
> +<tr><td class='right'>00e0</td><td class='hex'> 4e 1a 53 4a 5d 96 94 24 34 4d 4b 63 37 bb e3 24    8e b7 f1 78 16 cf 9d 7b 0f 0f df 5d 67 ee c4 15 </td><td class='hex'>N.SJ]..$4MKc7..$...x...{...]g...</td></tr>
> +<tr><td class='right'>0100</td><td class='hex'> 52 79 ca 27 8d e6 de 73 cf f9 be ff f9 7f cb 59    e0 3d 16 ad b5 f7 6b d7 5a 9b 5a eb 65 c7 a8 ff </td><td class='hex'>Ry.'...s.......Y.=....k.Z.Z.e...</td></tr>
> +<tr><td class='right'>0120</td><td class='hex'> 07 a8 88 41 f5 9e 9b bc 2e d7 e5 ba fc cf 52 93    9f cb a5 b0 3e e4 3f 36 00 3d 40 3f d0 07 34 03 </td><td class='hex'>...A..........R.....&gt;.?6.=@?..4.</td></tr>
> +<tr><td class='right'>0140</td><td class='hex'> 06 50 00 a6 81 09 e0 32 90 03 50 3b 7c dd 69 c0    02 9c 7a e5 21 d2 ea 0e 5a 07 b4 01 47 c3 a0 f4 </td><td class='hex'>.P.....2..P;|.i...z.!...Z...G...</td></tr>
> +<tr><td class='right'>0160</td><td class='hex'> 01 a0 40 92 26 36 a2 b8 07 83 ed c0 20 9a 2e a0    09 45 c2 d5 67 03 45 20 0b bc 03 fc 1d a3 71 98 </td><td class='hex'>..@.&amp;6...........E..g.E.......q.</td></tr>
> +<tr><td class='right'>0180</td><td class='hex'> d6 6d 47 50 e6 22 5b 5f 4a 02 15 40 03 19 d7 de    19 20 e7 d9 52 5a eb 04 e0 b8 3f 80 0f b8 b3 7b </td><td class='hex'>.mGP."[_J..@........RZ....?....{</td></tr>
> +<tr><td class='right'>01a0</td><td class='hex'> 1b 58 05 ac c0 5e b4 98 fc e5 6a a6 f6 3e 88 93    bf 1f cc 3e f2 6f 2a d0 d0 b0 06 54 12 ac 29 58 </td><td class='hex'>.X...^....j..&gt;.....&gt;.o*....T..)X</td></tr>
> +<tr><td class='right'>01c0</td><td class='hex'> 9a 8c f7 47 b2 33 8b d1 30 4a 69 f2 59 14 07 d8    b2 af 48 f7 ce 15 c0 93 c0 7d c0 b7 81 67 3c 12 </td><td class='hex'>...G.3..0Ji.Y.....H......}...g&lt;.</td></tr>
> +<tr><td class='right'>01e0</td><td class='hex'> 94 d6 fa 71 e0 37 c0 c9 10 7b 1a b8 09 78 9e 4a    6e 8e e3 9f 9a a3 74 f6 01 9c 72 0b 66 0b 24 da </td><td class='hex'>...q.7...{...x.Jn.....t...r.f.$.</td></tr>
> +<tr><td class='right'>0200</td><td class='hex'> 60 f1 b8 cc 23 dd 0f 2a 01 d6 2c 58 d3 d7 88 12    0d 90 07 f6 b2 c4 13 dc af d7 02 7f 70 c3 60 0f </td><td class='hex'>`...#..*..,X................p.`.</td></tr>
> +<tr><td class='right'>0220</td><td class='hex'> f0 0d 0f 54 02 78 0d 98 f4 1a 74 10 54 9f 06 86    30 12 36 a9 5e 98 7d c9 0c 74 87 1c 5f 38 5d 15 </td><td class='hex'>...T.x....t.T...0.6.^.}..t.._8].</td></tr>
> +<tr><td class='right'>0240</td><td class='hex'> 08 0a d2 7d 50 9e 06 6d 79 81 e1 7d cc 00 bb 48    b1 85 4b bf 1e 67 e5 e7 d3 6e fb 54 78 0a 06 70 </td><td class='hex'>...}P..my..}...H..K..g...n.Tx..p</td></tr>
> +<tr><td class='right'>0260</td><td class='hex'> 30 ec 4f 46 57 81 52 e0 2c ad 97 1e 8d 26 03 5f    33 49 f7 05 c6 c3 91 e8 bf 2b 30 1a 85 b5 28 90 </td><td class='hex'>0.OFW.R.,....&amp;._3I.......+0...(.</td></tr>
> +<tr><td class='right'>0280</td><td class='hex'> 38 d9 4c f9 f2 43 a1 18 f4 49 f1 40 59 80 a1 b5    96 cc 5a ba 08 2f b2 8d 99 e1 bb 7c 15 2d b7 42 </td><td class='hex'>8.L..C...I.@Y.....Z../.....|.-.B</td></tr>
> +<tr><td class='right'>02a0</td><td class='hex'> d7 bd b5 76 74 88 a2 d4 0a 68 be 19 94 01 4b 97    40 57 ea 43 52 40 b2 cb 9b 5a 19 f4 64 58 b9 01 </td><td class='hex'>...vt....h....K.@W.CR@...Z..dX..</td></tr>
> +<tr><td class='right'>02c0</td><td class='hex'> 98 2e ad 9e a5 55 c0 93 2c be f1 fe 40 49 02 7a    3f 03 4d eb 43 8a 4d 68 bf 0d da 86 dc 98 9a 86 </td><td class='hex'>.....U..,...@I.z?.M.C.Mh........</td></tr>
> +<tr><td class='right'>02e0</td><td class='hex'> dc 51 70 96 58 56 cc 26 68 18 90 67 67 c9 20 77    6c 15 28 f4 fc ab 3e 28 1b 58 64 44 01 a4 80 6f </td><td class='hex'>.Qp.XV.&amp;h..gg..wl.(...&gt;(.XdD...o</td></tr>
> +<tr><td class='right'>0300</td><td class='hex'> 01 77 52 3c 1d 75 41 eb ad 90 ec 0c c5 94 09 f6    22 e4 ff 23 ac 68 07 b4 ed 4e b5 51 12 c0 9f 80 </td><td class='hex'>.wR&lt;.uA........."..#.h...N.Q....</td></tr>
> +<tr><td class='right'>0320</td><td class='hex'> 01 66 63 c0 6e 66 33 b4 6c 95 77 6b 26 cd a9 47    bf c2 b0 ea e7 c8 76 19 ae 94 82 11 e5 99 ba 07 </td><td class='hex'>.fc.nf3.l.wk&amp;..G......v.........</td></tr>
> +<tr><td class='right'>0340</td><td class='hex'> d8 05 40 e9 1c d8 f9 40 71 a2 13 56 ee 82 96 2d    ee 0c cb 90 3b 01 95 6c 2d 13 ba 2c d9 e8 bf 6b </td><td class='hex'>..@....@q..V...-....;..l-..,...k</td></tr>
> +<tr><td class='right'>0360</td><td class='hex'> 70 ac e0 bd eb 5e 48 76 c9 f3 ec 08 cc be 38 44    92 2f a3 2b 4a 1f 12 a6 7c 2e 80 af 22 85 13 96 </td><td class='hex'>p....^Hv......8D./.+J...|..."...</td></tr>
> +<tr><td class='right'>0380</td><td class='hex'> 2e 44 0d 2a 13 7a 1e 86 44 73 6d 06 fa 2f 6e 83    b6 c1 29 4a fd 6a 1b 02 23 1d c4 58 b2 0d 3a 3f </td><td class='hex'>.D.*.z..Dsm../n...)J.j..#..X..:?</td></tr>
> +<tr><td class='right'>03a0</td><td class='hex'> e6 f6 b3 60 66 3f 38 96 02 be 04 0c 02 18 a1 65    63 3b 70 87 af df 9a 95 80 0d 8b 53 82 d2 c5 5a </td><td class='hex'>...`f?8........ec;p........S...Z</td></tr>
> +<tr><td class='right'>03c0</td><td class='hex'> 66 1a d7 c1 4d 7b 60 e0 eb 02 c0 17 1b 0a ef 08    73 ca 14 c5 99 8d d0 bc 49 3e 97 af 42 ee 75 af </td><td class='hex'>f...M{`.........s.......I&gt;..B.u.</td></tr>
> +<tr><td class='right'>03e0</td><td class='hex'> f3 6a e0 11 2f a6 40 82 fd 21 c2 01 6f e7 a1 32    57 15 a0 ad 01 ed 9e 18 0d b0 ee 07 30 b0 1b d6 </td><td class='hex'>.j../.@..!..o..2W...........0...</td></tr>
> +<tr><td class='right'>0400</td><td class='hex'> 3e 06 1d 1f 11 26 55 52 fe ad 19 89 37 65 4a 42    b4 dd 01 89 0e 17 d4 65 59 09 02 c6 77 02 37 78 </td><td class='hex'>&gt;....&amp;UR....7eJB.......eY...w.7x</td></tr>
> +<tr><td class='right'>0420</td><td class='hex'> a0 fa 7d 96 82 40 90 58 a8 06 90 ec 88 74 21 d5    2b 25 03 a4 d2 f7 7d 0e cc 06 c9 54 23 25 ec 18 </td><td class='hex'>..}..@.X.....t!.+%....}....T#%..</td></tr>
> +<tr><td class='right'>0440</td><td class='hex'> 0d 02 d2 6c 86 8e a0 d2 50 18 83 ca 42 d8 c2 06    e0 76 af d2 0d 02 37 46 31 d9 a0 ab d2 db 6c 10 </td><td class='hex'>...l....P...B....v....7F1.....l.</td></tr>
> +<tr><td class='right'>0460</td><td class='hex'> 10 61 69 bf 13 1a d7 04 ef 6d b7 4b e6 e5 df 16    d4 89 56 c8 6c 12 40 9d 1f 85 f6 bb 83 be d9 c3 </td><td class='hex'>.ai......m.K......V.l.@.........</td></tr>
> +<tr><td class='right'>0480</td><td class='hex'> e0 54 c2 4c 65 80 bb 3c a6 36 02 8d 11 63 2a 29    b4 47 a9 0a ea 0b 40 22 23 f5 4b 25 83 b6 86 7e </td><td class='hex'>.T.Le..&lt;.6...c*).G....@"#.K%...~</td></tr>
> +<tr><td class='right'>04a0</td><td class='hex'> 61 ce 63 b9 92 83 85 c3 30 f7 67 64 dd 6c 91 76    6b 0e b2 7f 23 46 b6 7a a0 d6 d6 7e 73 c4 e7 d5 </td><td class='hex'>a.c.....0.gd.l.vk...#F.z...~s...</td></tr>
> +<tr><td class='right'>04c0</td><td class='hex'> d2 b8 5e 96 21 8d 18 6f ff b0 db bd 2c d9 aa 52    d0 fb 48 50 97 d0 c2 7a b2 13 da 6e 8b ba ae 30 </td><td class='hex'>..^.!..o....,..R..HP...z...n...0</td></tr>
> +<tr><td class='right'>04e0</td><td class='hex'> 16 77 c8 5b 6d c8 f4 e9 8e b0 61 34 4a 65 8e ab    41 4d 1b 82 d9 76 7d 1c 12 ed f2 3c b3 0f 2e fc </td><td class='hex'>.w.[m.....a4Je..AM...v}....&lt;....</td></tr>
> +<tr><td class='right'>0500</td><td class='hex'> 54 9e 3b ee 86 d6 6d 41 e9 d0 40 db 87 c4 8d 9e    e4 4f 40 65 3e 8e a9 4e 0f 54 e0 ba e6 4d b2 86 </td><td class='hex'>T.;...mA..@......O@e&gt;..N.T...M..</td></tr>
> +<tr><td class='right'>0520</td><td class='hex'> d5 5b 4f 9b d6 41 fa 46 48 f7 40 d7 7d d2 66 2f    c2 c4 33 b0 70 54 6a 4f b2 13 fa 3e 0b 86 19 8c </td><td class='hex'>.[O..A.FH.@.}.f/..3.pTjO...&gt;....</td></tr>
> +<tr><td class='right'>0540</td><td class='hex'> 6b fd a0 04 bc 27 c5 d3 b5 89 e4 06 80 e1 ce 23    28 b7 95 05 28 8c bb 33 b4 6b 87 24 7b 84 89 ee </td><td class='hex'>k....'.........#(...(..3.k.${...</td></tr>
> +<tr><td class='right'>0560</td><td class='hex'> 4f 06 f5 26 fb 0f c8 8e 42 71 5c b6 2c 00 dd 0f    08 ab 1a 30 d3 d0 7c 4b 54 4f dd bd 17 96 b7 eb </td><td class='hex'>O..&amp;....Bq\.,......0..|KTO......</td></tr>
> +<tr><td class='right'>0580</td><td class='hex'> 0c fc 54 3a 17 7c 2e 5f a9 1d a2 0c 58 fb a8 fb    ec 06 f8 f4 7e a8 e4 a1 78 4a c0 f5 3c 2c 19 d8 </td><td class='hex'>..T:.|._....X.......~...xJ..&lt;,..</td></tr>
> +<tr><td class='right'>05a0</td><td class='hex'> bd 13 16 df 82 f4 0d 90 19 0c 74 54 b2 90 7f ab    1e a8 9c c7 d4 f9 d8 cf a5 b3 f1 ab 7e aa 4f 7e </td><td class='hex'>..........tT................~.O~</td></tr>
> +<tr><td class='right'>05c0</td><td class='hex'> 1e b3 0b af b9 6e 5c 82 ab 7f 74 97 14 05 2b bf    08 4d ef 83 96 6d e2 72 df ec bf 21 77 bc de 4d </td><td class='hex'>.....n\...t...+..M...m.r...!w..M</td></tr>
> +<tr><td class='right'>05e0</td><td class='hex'> c6 84 57 a7 4e 22 9b f9 44 e4 73 f1 94 04 63 75    6d 0a 4b f9 52 94 dd dc 31 71 4d aa 4f 96 94 0d </td><td class='hex'>..W.N"..D.s...cum.K.R...1qM.O...</td></tr>
> +<tr><td class='right'>0600</td><td class='hex'> 4f 4b 05 37 52 51 b6 53 5d 50 5c 88 d3 f8 a6 57    12 4e 00 57 a3 6e 02 4a 13 02 ec 5a 32 f7 57 d9 </td><td class='hex'>OK.7RQ.S]P\....W.N.W.n.J...Z2.W.</td></tr>
> +<tr><td class='right'>0620</td><td class='hex'> 18 a6 7b e5 67 5d 0d e2 0a 25 c9 d0 36 14 1d 93    d9 28 07 8e da 38 b7 80 51 0f d4 59 e0 58 4d 97 </td><td class='hex'>..{.g]...%..6....(...8..Q..Y.XM.</td></tr>
> +<tr><td class='right'>0640</td><td class='hex'> 4a 16 b2 ff ac 0f 48 db 12 43 5a bb c5 b6 ec ae    99 b3 d7 1e 73 fe 29 98 7f 35 ce 7d 13 61 50 05 </td><td class='hex'>J.....H..CZ.........s.)..5.}.aP.</td></tr>
> +<tr><td class='right'>0660</td><td class='hex'> 60 1f c1 31 4b 24 d5 27 d5 d8 2e c4 1b a8 64 65    81 4e 75 09 ab d6 9c 80 ca 1d bd 06 b5 0a a9 42 </td><td class='hex'>`..1K$.'......de.Nu............B</td></tr>
> +<tr><td class='right'>0680</td><td class='hex'> 4e dc c7 97 81 31 43 ed f0 1b f6 03 d1 94 70 8a    e2 3e 6b 2a 5e 7f ee 08 5c f9 9d 6c 69 0c 53 ea </td><td class='hex'>N....1C.......p..&gt;k*^...\..li.S.</td></tr>
> +<tr><td class='right'>06a0</td><td class='hex'> 90 46 36 6e 4e 31 7e 4c 79 52 4a 47 ed 1e 7e 01    78 01 b0 c2 9b bc f3 c0 af 90 ed b1 cb c4 bc 2c </td><td class='hex'>.F6nN1~LyRJG..~.x..............,</td></tr>
> +<tr><td class='right'>06c0</td><td class='hex'> 05 c5 b3 75 40 bd 2e 0c d9 79 99 bd 4a 08 11 0b    87 65 9b 5c e3 3a 07 ce fd 18 ae fc 36 4e db 7e </td><td class='hex'>...u@....y..J....e.\.:......6N.~</td></tr>
> +<tr><td class='right'>06e0</td><td class='hex'> 60 14 97 47 42 6c 3d 0f fc 25 d2 d5 ca c2 ec c1    18 1d 0e 14 42 86 b5 25 95 1d a0 3c 05 33 c3 b5 </td><td class='hex'>`..GBl=..%..........B..%...&lt;.3..</td></tr>
> +<tr><td class='right'>0700</td><td class='hex'> 43 f2 c7 61 e6 4f 71 95 fc 3c f0 14 72 dc 8f 6c    87 41 32 f0 bb 48 c0 05 32 73 50 32 2c 2c 76 b1 </td><td class='hex'>C..a.Oq..&lt;..r..l.A2..H..2sP2,,v.</td></tr>
> +<tr><td class='right'>0720</td><td class='hex'> 7e 66 6a c4 78 78 6d 73 8a 70 6e 0f e4 4f 56 07    78 09 f8 11 72 28 46 ed 08 81 0a b1 f5 0a f0 18 </td><td class='hex'>~fj.xxms.pn..OV.x...r(F.........</td></tr>
> +<tr><td class='right'>0740</td><td class='hex'> 5e 95 57 48 e0 9e f9 7e 74 43 66 4d 8b eb e2 44    21 6e 0f 7f 9f 1f 85 e9 7d d5 80 6c e0 17 48 d8 </td><td class='hex'>^.WH...~tCfM...D!n......}..l..H.</td></tr>
> +<tr><td class='right'>0760</td><td class='hex'> f8 18 22 4c 55 b9 f1 3b 3e 30 34 4c 3e 07 e3 bb    83 42 99 3b 22 ec d5 bb ec b5 e6 a1 e0 5e 4f d8 </td><td class='hex'>.."LU..;&gt;04L&gt;....B.;"........^O.</td></tr>
> +<tr><td class='right'>0780</td><td class='hex'> 39 98 f8 99 84 42 20 15 e0 39 e0 7b 40 21 64 bb    c6 7d 1e b0 0a f0 34 b0 1b f7 48 8d b6 04 d8 f1 </td><td class='hex'>9....B...9.{@!d..}....4...H.....</td></tr>
> +<tr><td class='right'>07a0</td><td class='hex'> 07 e1 ec 13 12 b0 76 89 ba e2 94 61 6e 44 fe 2f    3e 2b ee 0c 26 90 07 7e 02 7c 13 98 0b 03 f2 88 </td><td class='hex'>......v....anD./&gt;+..&amp;..~.|......</td></tr>
> +<tr><td class='right'>07c0</td><td class='hex'> 8e 15 f7 94 a3 90 53 ce e3 c8 1e de 8c 3f 5e d5    91 e4 0a d9 d8 cd bf 12 8e af 31 e0 87 c8 4d 4f </td><td class='hex'>......S......?^...........1...MO</td></tr>
> +<tr><td class='right'>07e0</td><td class='hex'> a9 1a d0 b2 aa 43 c7 af 1e e0 0b c8 d9 6c 43 1c    c3 f5 95 f8 56 2e 01 bf 07 7e 8e dc 7d e9 38 40 </td><td class='hex'>.....C.......lC.....V....~..}.8@</td></tr>
> +<tr><td class='right'>0800</td><td class='hex'> b1 a0 42 d7 8b 41 d9 1d f1 ae 55 18 00 3e e1 fe    6e 41 76 ac 89 78 d5 38 48 41 1c 03 0e 00 7b 81 </td><td class='hex'>..B..A....U..&gt;..nAv..x.8HA....{.</td></tr>
> +<tr><td class='right'>0820</td><td class='hex'> 37 80 4a 3d 30 cb 81 52 40 17 30 07 d8 fe 15 e3    21 df 5c 86 d6 cd 9b 28 9e d9 80 bd b8 06 39 a2 </td><td class='hex'>7.J=0..R@.0.....!.\....(......9.</td></tr>
> +<tr><td class='right'>0840</td><td class='hex'> b5 ba 13 59 04 ae 00 a7 91 85 7e dc d5 a3 97 03    f3 6e 98 f2 af c8 6a 2e 63 a5 4f 02 b0 a9 cc 6b </td><td class='hex'>...Y......~......n....j.c.O....k</td></tr>
> +<tr><td class='right'>0860</td><td class='hex'> 5e ee f0 16 34 45 e8 aa f2 dd 82 58 16 54 0c b0    30 c0 7a 61 5e 5d a2 bd 33 97 55 d5 ae 42 3f 07 </td><td class='hex'>^...4E.....X.T..0.za^]..3.U..B?.</td></tr>
> +<tr><td class='right'>0880</td><td class='hex'> d0 71 37 c4 f5 e2 01 c4 1d 83 c8 55 f4 12 e2 96    0b 40 27 72 ed dc 8a 14 bf 02 70 8e 60 4b dd 84 </td><td class='hex'>.q7........U.....@'r......p.`K..</td></tr>
> +<tr><td class='right'>08a0</td><td class='hex'> 64 ea 2c f0 af 90 be 0c 70 b3 3b b6 1b 18 76 c7    d6 c8 7f 01 68 32 fd 92 51 5f 34 1b 00 00 00 25 </td><td class='hex'>d.,.....p.;...v.....h2..Q_4....%</td></tr>
> +<tr><td class='right'>08c0</td><td class='hex'> 74 45 58 74 64 61 74 65 3a 63 72 65 61 74 65 00    32 30 31 33 2d 30 31 2d 31 36 54 31 32 3a 31 31 </td><td class='hex'>tEXtdate:create.2013-01-16T12:11</td></tr>
> +<tr><td class='right'>08e0</td><td class='hex'> 3a 33 34 2b 30 30 3a 30 30 e9 0b 13 43 00 00 00    25 74 45 58 74 64 61 74 65 3a 6d 6f 64 69 66 79 </td><td class='hex'>:34+00:00...C...%tEXtdate:modify</td></tr>
> +<tr><td class='right'>0900</td><td class='hex'> 00 32 30 31 33 2d 30 31 2d 31 36 54 31 32 3a 31    31 3a 33 31 2b 30 30 3a 30 30 ca 6e 84 58 00 00 </td><td class='hex'>.2013-01-16T12:11:31+00:00.n.X..</td></tr>
> +<tr><td class='right'>0920</td><td class='hex'> 00 19 74 45 58 74 53 6f 66 74 77 61 72 65 00 77    77 77 2e 69 6e 6b 73 63 61 70 65 2e 6f 72 67 9b </td><td class='hex'>..tEXtSoftware.www.inkscape.org.</td></tr>
> +<tr><td class='right'>0940</td><td class='hex'> ee 3c 1a 00 00 00 00 49 45 4e 44 ae 42 60 82 </td><td class='hex'>.&lt;.....IEND.B`.</td></tr>
> +</table>
> +</div> <!-- class=content -->
> +<div class='footer'>generated  by cgit v0.9.1 at 2013-09-17 12:41:48 (GMT)</div>
> +</div> <!-- id=cgit -->
> +</body>
> +</html>
> diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> new file mode 100644
> index 0000000..61735e2
> --- /dev/null
> +++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> @@ -0,0 +1,148 @@
> +SUMMARY = "Weston, a Wayland compositor"
> +DESCRIPTION = "Weston is the reference implementation of a Wayland compositor"
> +HOMEPAGE = "http://wayland.freedesktop.org"
> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://COPYING;md5=275efac2559a224527bd4fd593d38466 \
> +                    file://src/compositor.c;endline=23;md5=aa98a8db03480fe7d500d0b1f4b8850c"
> +
> +SRC_URI = "git://anongit.freedesktop.org/wayland/weston;protocol=git \
> +           file://weston.png \
> +           file://weston.desktop \
> +           file://terminal.png \
> +           file://pattern.png \
> +           file://profile \
> +           file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch \
> +           file://0002-Makefile-Include-option-to-search-in-include-drm.patch \
> +	   file://0003-input-source-prevent-input-disable-during-repaint.patch \
> +	   file://0005-temp-hack-to-enable-weston-1.3.patch \
> +	   file://0006-weston-drm-Enable-multiple-displays.patch "
> +          
> +
> +SRCREV = "95659c03219b057d9d703b04cf89bc0329ce947a" 
> +
> +S = "${WORKDIR}/git"
> +
> +PR = "r3"
> +
> +inherit autotools pkgconfig useradd
> +
> +DEPENDS = "xkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg mtdev libpam"
> +DEPENDS += "wayland libgbm omap5-sgx-ddk-um-linux pango"
> +
> +
> +EXTRA_OECONF = "--disable-android-compositor \
> +                 --disable-simple-egl-clients \
> +                 --enable-fbdev-compositor \
> +                --enable-setuid-install \
> +                --disable-tablet-shell \
> +                --disable-xwayland \
> +                --enable-simple-clients \
> +                --enable-clients \
> +                --disable-libunwind \
> +                --disable-rpi-compositor \
> +                --disable-rdp-compositor \
> +                --prefix=${STAGING_DIR_TARGET} \
> +                --with-libtool-sysroot=${STAGING_DIR_TARGET}"
> +
> +
> +PACKAGECONFIG ??= "${@base_contains('DISTRO_FEATURES', 'wayland', 'kms wayland', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'gles', '', d)} \
> +                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch', '', d)} \
> +                  "
> +#
> +# Compositor choices
> +#
> +# Weston on KMS
> +PACKAGECONFIG[kms] = "--enable-drm-compositor,--disable-drm-compositor,drm udev libgbm mtdev"
> +# Weston on Wayland (nested Weston)
> +PACKAGECONFIG[wayland] = "--enable-wayland-compositor,--disable-wayland-compositor,libgbm"
> +# Weston on X11
> +PACKAGECONFIG[x11] = "--enable-x11-compositor,--disable-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo"
> +# Headless Weston
> +PACKAGECONFIG[headless] = "--enable-headless-compositor,--disable-headless-compositor"
> +# Weston on framebuffer
> +PACKAGECONFIG[fbdev] = "--enable-fbdev-compositor,--disable-fbdev-compositor,udev mtdev"
> +# weston-launch
> +PACKAGECONFIG[launch] = "--enable-weston-launch,--disable-weston-launch,libpam"
> +# Use cairo-gl or cairo-glesv2
> +PACKAGECONFIG[gles] = "--with-cairo-glesv2,,virtual/libgles2"
> +
> +
> +
> +do_install_append() {
> +	# Weston doesn't need the .la files to load modules, so wipe them
> +	rm -f ${D}/${libdir}/weston/*.la
> +
> +	for feature in ${DISTRO_FEATURES}; do
> +		# If X11, ship a desktop file to launch it
> +		if [ "$feature" = "x11" ]; then
> +			install -d ${D}${datadir}/applications
> +			install ${WORKDIR}/weston.desktop ${D}${datadir}/applications
> +
> +			install -d ${D}${datadir}/icons/hicolor/48x48/apps
> +			install ${WORKDIR}/weston.png ${D}${datadir}/icons/hicolor/48x48/apps
> +                fi
> +	done
> +        install ${WORKDIR}/terminal.png ${D}${datadir}/icons/hicolor/48x48/apps
> +        install ${WORKDIR}/pattern.png ${D}${datadir}/icons/hicolor/48x48/apps
> +
> +        mkdir -p ${D}/usr/bin/weston-clients
> +        cp ${S}/clients/weston-calibrator ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-clickdot ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-cliptest ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-dnd ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-editor ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-eventdemo ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-flower ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-fullscreen ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-image ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-keyboard ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-multi-resource ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-resizor ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-egl ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-im ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-shm ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-simple-touch ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-smoke ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-subsurfaces ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-desktop-shell ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-info ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-screenshooter ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-tablet-shell ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-terminal ${D}/usr/bin/weston-clients/
> +        cp ${S}/clients/weston-transformed ${D}/usr/bin/weston-clients/
> +
> +        mkdir -p ${D}/usr/libexec
> +        cp ${S}/clients/weston-desktop-shell ${D}/usr/libexec/
> +        cp ${S}/clients/weston-screenshooter ${D}/usr/libexec/
> +        cp ${S}/clients/weston-tablet-shell ${D}/usr/libexec/
> +
> +	mkdir -p ${D}/home/root
> +        mkdir -p ${D}/home/root/.config
> +        cp ${S}/weston.ini ${D}/home/root/.config/
> +        cp ${WORKDIR}/profile ${D}/home/root/.profile
> +
> +}
> +
> +do_configure() {
> +	aclocal -I ${STAGING_DIR_TARGET}/usr/share/aclocal
> +        ./autogen.sh --prefix=/usr --host=arm-linux --with-libtool-sysroot=${STAGING_DIR_TARGET} --enable-weston-launch
> +}
> +
> +PACKAGES += "${PN}-examples"
> +
> +FILES_${PN} = "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir} ${datadir} ${libdir}/weston/* /home/root/.profile /home/root/.config/* /usr/libexec/weston-desktop-shell /usr/libexec/weston-screenshooter /usr/libexec/weston-tablet-shell" 
> +FILES_${PN}-examples = "${bindir}/*"
> +
> +FILES_${PN}-dbg += "${bindir}/weston-clients/.debug"
> +
> +RDEPENDS_${PN} += "xkeyboard-config"
> +RRECOMMENDS_${PN} = "liberation-fonts"
> +
> +USERADD_PACKAGES = "${PN}"
> +GROUPADD_PARAM_${PN} = "--system weston-launch"
> +
> +INSANE_SKIP_weston += "dev-deps"
> +
> +FILESEXTRAPATHS_prepend := "${THISDIR}:"
> -- 
> 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

