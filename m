Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id C671C52976
	for <meta-arago@arago-project.org>;
	Wed,  3 Sep 2014 17:39:51 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s83Hdmut031441
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 12:39:49 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s83HdjZ6009266
	for <meta-arago@arago-project.org>; Wed, 3 Sep 2014 23:09:47 +0530
Received: from DBDE04.ent.ti.com ([fe80::21ac:d9f:f810:c8e7]) by
	DBDE72.ent.ti.com ([fe80::bd56:32bf:87fd:2763%27]) with mapi id
	14.03.0174.001; Wed, 3 Sep 2014 23:09:45 +0530
From: "R, Karthik" <karthik.ramanan@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Thread-Topic: [meta-arago] [PATCH 2/2] wayland: adding support for weston
	1.3.0 for DRM backend
Thread-Index: AQHPvgz9b6sSp8nZTU+08fPZ4XYkKJvngYEAgAfcvwCAAGG/IQ==
Date: Wed, 3 Sep 2014 17:39:45 +0000
Message-ID: <24B88602B5904F49971CAF899152529B80B3E4@DBDE04.ent.ti.com>
References: <1408713923-25284-1-git-send-email-a0393906@ti.com>
	<1408713923-25284-3-git-send-email-a0393906@ti.com>
	<20140829171600.GJ18620@edge>,<20140903171953.GT18620@edge>
In-Reply-To: <20140903171953.GT18620@edge>
Accept-Language: en-IN, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 03 Sep 2014 18:01:30 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 03 Sep 2014 17:39:52 -0000
Content-Language: en-IN
Content-Type: multipart/alternative;
	boundary="_000_24B88602B5904F49971CAF899152529B80B3E4DBDE04entticom_"

--_000_24B88602B5904F49971CAF899152529B80B3E4DBDE04entticom_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Denys,

This is on my list. Will get it done by this Friday. The other patches have=
 become a priority. Will do it asap.

Regards
Karthik
________________________________
From: Dmytriyenko, Denys
Sent: 03-09-2014 22:49
To: R, Karthik
Cc: meta-arago@arago-project.org; Devshatwar, Nikhil
Subject: Re: [meta-arago] [PATCH 2/2] wayland: adding support for weston 1.=
3.0 for DRM backend

Ping?

On Fri, Aug 29, 2014 at 01:16:00PM -0400, Denys Dmytriyenko wrote:
> Karthik,
>
> Few comments:
>
> 1. Please overlay the original 1.3.0 version of weston from oe-core/dora =
as is
> in a separate patch, before patching it with own changes.
> 2. And in the description please mention it's weston (even though it's in=
 the
> same wayland directory) as well as it's an initial overlay of original re=
cipe
> from oe-core/dora that will be patched separately.
> 3. It looks like weston.desktop and weston.png files below got corrupted,
> please fix.
>
> Thanks.
>
> --
> Denys
>
>
> On Fri, Aug 22, 2014 at 06:55:23PM +0530, Karthik Ramanan wrote:
> > On devices where the backend is chosen as DRM, as in the case
> > of dra7xx, there are some addition patches that are specific
> > to the omapdrm which are needed for basic functionality and
> > some bug fixes.
> >
> > * This will full enable multiple display support
> > * Handle screensavers more efficient
> > * Be compatible with libgbm, TI adaptation of libgbm
> >
> > Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > ---
> >  ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |   26 ++++
> >  ...e-Include-option-to-search-in-include-drm.patch |   47 +++++++
> >  ...urce-prevent-input-disable-during-repaint.patch |   34 +++++
> >  .../0005-temp-hack-to-enable-weston-1.3.patch      |   33 +++++
> >  .../0006-weston-drm-Enable-multiple-displays.patch |   43 ++++++
> >  .../recipes-graphics/wayland/pattern.png           |  Bin 0 -> 1846 by=
tes
> >  meta-arago-extras/recipes-graphics/wayland/profile |    9 ++
> >  .../recipes-graphics/wayland/terminal.png          |  Bin 0 -> 1005 by=
tes
> >  .../recipes-graphics/wayland/weston.desktop        |   91 ++++++++++++
> >  .../recipes-graphics/wayland/weston.png            |  147 ++++++++++++=
+++++++
> >  .../recipes-graphics/wayland/weston_1.3.0.bb       |  148 ++++++++++++=
++++++++
> >  11 files changed, 578 insertions(+)
> >  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0001-com=
positor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> >  create mode 100755 meta-arago-extras/recipes-graphics/wayland/0002-Mak=
efile-Include-option-to-search-in-include-drm.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0003-inp=
ut-source-prevent-input-disable-during-repaint.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0005-tem=
p-hack-to-enable-weston-1.3.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/0006-wes=
ton-drm-Enable-multiple-displays.patch
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/pattern.=
png
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/profile
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/terminal=
.png
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.d=
esktop
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston.p=
ng
> >  create mode 100644 meta-arago-extras/recipes-graphics/wayland/weston_1=
.3.0.bb
> >
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/0001-compositor=
-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/recipes-gr=
aphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch
> > new file mode 100755
> > index 0000000..cd0581a
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/0001-compositor-drm-Ch=
ange-path-of-gbm.h-to-gbm-gbm.h.patch
> > @@ -0,0 +1,26 @@
> > +From 5f655cb89813e39d6410493b4725e447212ea3a3 Mon Sep 17 00:00:00 2001
> > +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > +Date: Tue, 24 Sep 2013 19:13:50 +0530
> > +Subject: [PATCH] compositor-drm: Change path of gbm.h to gbm/gbm.h
> > +
> > +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > +---
> > + src/compositor-drm.c |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> > +index f055118..7a59872 100644
> > +--- a/src/compositor-drm.c
> > ++++ b/src/compositor-drm.c
> > +@@ -35,7 +35,7 @@
> > + #include <xf86drmMode.h>
> > + #include <drm_fourcc.h>
> > +
> > +-#include <gbm.h>
> > ++#include <gbm/gbm.h>
> > + #include <libbacklight.h>
> > + #include <libudev.h>
> > +
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/0002-Makefile-I=
nclude-option-to-search-in-include-drm.patch b/meta-arago-extras/recipes-gr=
aphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.patch
> > new file mode 100755
> > index 0000000..557373d
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/0002-Makefile-Include-=
option-to-search-in-include-drm.patch
> > @@ -0,0 +1,47 @@
> > +From c8b6fe71ad0231c4787836f4156e604cedfe45a8 Mon Sep 17 00:00:00 2001
> > +From: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > +Date: Thu, 3 Jul 2014 15:06:31 +0530
> > +Subject: [PATCH] Makefile change to search for correct drm headers
> > +
> > +Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > +---
> > + src/Makefile.am   | 3 ++-
> > + tests/Makefile.am | 1 +
> > + 2 files changed, 3 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/Makefile.am b/src/Makefile.am
> > +index 749c074..a6e44e7 100644
> > +--- a/src/Makefile.am
> > ++++ b/src/Makefile.am
> > +@@ -2,6 +2,7 @@ bin_PROGRAMS =3D weston                              \
> > +    $(weston_launch)
> > +
> > + AM_CPPFLAGS =3D                                     \
> > ++        $(DRM_COMPOSITOR_CFLAGS)                \
> > +    -I$(top_srcdir)/shared                  \
> > +    -DDATADIR=3D'"$(datadir)"'                \
> > +    -DMODULEDIR=3D'"$(moduledir)"'            \
> > +@@ -9,7 +10,7 @@ AM_CPPFLAGS =3D                                     \
> > +    -DIN_WESTON
> > +
> > + weston_LDFLAGS =3D -export-dynamic
> > +-weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLA=
GS)
> > ++weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBUNWIND_CFLA=
GS)
> > + weston_LDADD =3D $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \
> > +    $(DLOPEN_LIBS) -lm ../shared/libshared.la
> > +
> > +diff --git a/tests/Makefile.am b/tests/Makefile.am
> > +index 5be52c6..42ebd2b 100644
> > +--- a/tests/Makefile.am
> > ++++ b/tests/Makefile.am
> > +@@ -47,6 +47,7 @@ AM_CPPFLAGS =3D                                    \
> > +    -I$(top_srcdir)/shared                  \
> > +    -I$(top_builddir)/src                   \
> > +    -DUNIT_TEST                             \
> > ++  $(DRM_COMPOSITOR_CFLAGS)                \
> > +    $(COMPOSITOR_CFLAGS)
> > +
> > + surface_global_test_la_SOURCES =3D surface-global-test.c
> > +--
> > +2.0.1
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/0003-input-sour=
ce-prevent-input-disable-during-repaint.patch b/meta-arago-extras/recipes-g=
raphics/wayland/0003-input-source-prevent-input-disable-during-repaint.patc=
h
> > new file mode 100644
> > index 0000000..74e82fb
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/0003-input-source-prev=
ent-input-disable-during-repaint.patch
> > @@ -0,0 +1,34 @@
> > +From cdd9043580e0f0a6c60c21b955f1966c78b2098b Mon Sep 17 00:00:00 2001
> > +From: Karthik Ramanan <a0393906@ti.com>
> > +Date: Mon, 2 Dec 2013 15:52:41 +0530
> > +Subject: [PATCH] input source: prevent input disable during repaint
> > +
> > +Under certain race conditions, the input source was getting
> > +disabled which was preventing the evdev events from keyboard or
> > +mouse to reach Weston. The side effect of this issue was
> > +that after the screen gets locked, it was not possible to
> > +come to Weston desktop without killing Weston.
> > +
> > +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > +---
> > + src/compositor.c |    4 ----
> > + 1 files changed, 0 insertions(+), 4 deletions(-)
> > +
> > +diff --git a/src/compositor.c b/src/compositor.c
> > +index 0e0835f..ced3883 100644
> > +--- a/src/compositor.c
> > ++++ b/src/compositor.c
> > +@@ -1084,10 +1084,6 @@ weston_output_schedule_repaint(struct weston_ou=
tput *output)
> > +    wl_event_loop_add_idle(loop, idle_repaint, output);
> > +    output->repaint_scheduled =3D 1;
> > +
> > +-  if (compositor->input_loop_source) {
> > +-          wl_event_source_remove(compositor->input_loop_source);
> > +-          compositor->input_loop_source =3D NULL;
> > +-  }
> > + }
> > +
> > + WL_EXPORT void
> > +--
> > +1.7.0.4
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-=
to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayland/000=
5-temp-hack-to-enable-weston-1.3.patch
> > new file mode 100644
> > index 0000000..0c860b3
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/0005-temp-hack-to-enab=
le-weston-1.3.patch
> > @@ -0,0 +1,33 @@
> > +From 518fe5aea452a4660e07855716349a0c84e59b14 Mon Sep 17 00:00:00 2001
> > +From: Karthik Ramanan <a0393906@ti.com>
> > +Date: Tue, 21 Jan 2014 11:48:19 +0000
> > +Subject: [PATCH] temp-hack: to enable weston 1.3
> > +
> > +This patch resolves the issue with the black display seen
> > +when running weston 1.3 version on the dra7xx target.
> > +
> > +Known issues:
> > +1. simple-egl application does not work
> > +2. weston on multiple displays does not work
> > +
> > +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > +---
> > + src/compositor-drm.c |    2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> > +index 0ac5efa..dd28f0f 100644
> > +--- a/src/compositor-drm.c
> > ++++ b/src/compositor-drm.c
> > +@@ -616,7 +616,7 @@ drm_output_repaint(struct weston_output *output_ba=
se,
> > +                    .request.sequence =3D 1,
> > +            };
> > +
> > +-          if ((!s->current && !s->next) ||
> > ++          if ((!s->current && !s->next) &&
> > +                !drm_sprite_crtc_supported(output_base, s->possible_cr=
tcs))
> > +                    continue;
> > +
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/0006-weston-drm=
-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/waylan=
d/0006-weston-drm-Enable-multiple-displays.patch
> > new file mode 100644
> > index 0000000..abc4295
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/0006-weston-drm-Enable=
-multiple-displays.patch
> > @@ -0,0 +1,43 @@
> > +From dce69cadd858bd959dd41edf82860cd370ca1fa8 Mon Sep 17 00:00:00 2001
> > +From: Karthik Ramanan <a0393906@ti.com>
> > +Date: Fri, 14 Mar 2014 18:55:12 +0530
> > +Subject: [PATCH] weston-drm: Enable multiple displays
> > +
> > +We are currently seeing an issue with missing VBlanks for LCD and
> > +HDMI connectors which leads to display not getting refreshed.
> > +This patch can be considered as a workaround.
> > +
> > +Signed-off-by: Karthik Ramanan <a0393906@ti.com>
> > +---
> > + src/compositor-drm.c |    8 +++++++-
> > + 1 file changed, 7 insertions(+), 1 deletion(-)
> > +
> > +diff --git a/src/compositor-drm.c b/src/compositor-drm.c
> > +index 79dcc6c..ef2fbd2 100644
> > +--- a/src/compositor-drm.c
> > ++++ b/src/compositor-drm.c
> > +@@ -709,6 +709,7 @@ page_flip_handler(int fd, unsigned int frame,
> > + {
> > +    struct drm_output *output =3D (struct drm_output *) data;
> > +    uint32_t msecs;
> > ++  uint32_t bail;
> > +
> > +    /* We don't set page_flip_pending on start_repaint_loop, in that c=
ase
> > +     * we just want to page flip to the current buffer to get an accur=
ate
> > +@@ -721,7 +722,12 @@ page_flip_handler(int fd, unsigned int frame,
> > +
> > +    output->page_flip_pending =3D 0;
> > +
> > +-  if (!output->vblank_pending) {
> > ++  if (output->vblank_pending) {
> > ++          weston_log("VBlank is pending for connector =3D %d, frame =
=3D %d\n", output->connector_id, frame);
> > ++          bail =3D 1;
> > ++  }
> > ++
> > ++  if (!output->vblank_pending || bail) {
> > +            msecs =3D sec * 1000 + usec / 1000;
> > +            weston_output_finish_frame(&output->base, msecs);
> > +
> > +--
> > +1.7.9.5
> > +
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/pattern.png b/m=
eta-arago-extras/recipes-graphics/wayland/pattern.png
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..5ac8986d6721b4c19794f1d=
24e513af7015aa395
> > GIT binary patch
> > literal 1846
> > zcmV-62g&$}P)<h;3K|Lk000e1NJLTq0027x001Hg0ssI2Zk{%`00009a7bBm000XU
> > z000XU0RWnu7ytkO2XskIMF-pg859yTWl~)@000KnNkl<ZSi`MY+mh=3Dl4h1B@j?;Vp
> > z>r~C#{PdYlVhp;R2PK4doYbCEL-j*f%te=3D_#S;EM|Na*MoK7bnf^%-$wyhNBoO5nj
> > z&Vb;K#()3%%Y7VqnsUyszpKdi_jjM8s&(5wpVddJZC!8Zy+19B_x`?1&cTOuy*cN$
> > zt(<WAutf+V=3DLr#f2u$2st+jT`4wr1(X8+9dDW+%^hY-x%Qc8+3035nn%Icg8IZxeO
> > z8!^QgqjQdks8L_A-fs8*Rh@Gw=3DjD8kDOz#>VVdW8KHcNdnoS!A6Prsh#+agW&U-)4
> > zr_<@a%6oskUh7tO3x)Z1yV-^zMtpT>nrCxkU2no{v1zSYgj8gnPt&w_)x4di*}UrL
> > z8cx05_n)S5$rw~sEoHrYf4AD0n2Ad%*Xxy;Z30?^cEfugW308R>h*d}Ik(oFbJSYS
> > zIRG3c&PK|Ks1cEcGw19>XtkBHT99Ilhll=3DfPsEV<I`G{Z#Arv3(dvm7W>x3CJ2V|J
> > z5|MMR)+e&ZukL>w-ur&^fyKfc0A4fhoI^xaE$eC__uhZ~`t>>u0Gx9WK%L4<35NFp
> > zW}-f)FZAB0n6`Q^S!}gg5%dbXTrTf+1i;$>snhA0Nr=3Dfg$HG&dYO5k*{#%@0E3(%m
> > zJuLRlr<j<@`w$UjSc0Xj0HG(>hk%HEW%oFyq^d03%>{r%24&*<pfFX<F^OvMzP8G$
> > zMw)=3DjE{Aoi+g5gof)2USVpY9dE_s?#O18^<I*ox0AuQ*!eG-0J!_3#q1rYn$s>(!t
> > zp(WILAH28xu++W~V+=3Dm1Q&pwbM(}v=3D5pjp(4(0oYt(3ZLF-9xx<$M<AM#MyjvD*{?
> > z#tbm?Xy2Y~hJ_Zh>@zd7u!wZef7A(J2mxNI*`RD|!}x0m;2wZu7GYLZQE~sLp{lC#
> > z4#&<pQBl>y31*3^qS-o4bFV*PzFx0SA`{6e8H0|+;hak;h44fhGmCKN#M)~1xibS1
> > zHENx6Vodf)M2MP^kBEo}F{Q`XZf<RNmc$XJHu`<oXJ0NCGi%%h0H%5VQ7Z`M#^|uB
> > zGBW^(-0>4*oFCV+a}FHD6!Q=3D!RV8XE<<W*G4b1atG*_5KB!n>jsH#LnL;#pl>Je?V
> > z9mpeqoTq!)Ik(lVQ7c>N3>9NKT(vCA0MS51Wh=3DGT9ixXGLj{0ezki><z7DyTs7>>n
> > zAFANpMS4$&54F`X*iQmERDuAez>LcqHRIE9lTWwwA^eRQa?U9wVF}^*Y@5cyotVZr
> > zG4neq8~|KvyVFMyf3lb!RRRDhWz#V|Jl^{c0=3DzzM)M=3DViP6oDhUCk4sW<UP3fhzK<
> > zq*TO8K7?R;pM~qTSv4>*F&(xTrb{iNd78Rq0pPSOb}<nV6MybFQc8#sBdQ1ycircl
> > z3$-0o&$_M;<#4adoKj~%K-fyTU9Yc=3DMsK>j_dA!o_w$2Wtefado_&LA2w_>y(>!BD
> > zQw=3Df2^Ve7B&``Hce%@PUU5#{8N~7M`rILugzrV}6n(l73UB17&F6}k6r;%wgD3^7$
> > zWNxLb>zz-%_sjX9;j`AxxD`#a&-2MrP)cc!sCOd!Fb);4d3c=3De7|knd7Y0GX81Ws_
> > zdVh7jUeFfwerD8b9~zB6k>1A>LI40O!S(`3Gu?Y1AiR<wAb9W5^oJ?hKh)hLibm;;
> > zfZqFl6(7*0st@6ij{yQT>hS0!^UCyhc8eJ8q#mRXp(;bm88I@ms+yebyw+;nrFbjl
> > z5I<%Iv-CV8;-R^A;TtL>#;0Vl{=3D_cfu|0V_8kC*hKP)m4DeF24kKQ=3D$+Au)eU7w?(
> > z_|appYu9dJgh5aAy55+R4*>$OurTkCXL9x@mVh51skJimG|g7~7;&CYqh(|2$IWlI
> > zYyA1nBFsc|SM&%Ne+vE_6PY@G+#|2$g@AC>y;|>Jn*H8xTrVMnlyb@`rik$uHDV@a
> > z9#fxE9>dXEbM3eug1!iLy~}6){GK3(?^LR<k{l5`|Eq}kBk~U$1!R%h+DN@y-8!Gg
> > zl;Y!gp;5DjOjTK#g@Iwm*^OwVofzXZO`V&|x{gV!TkT=3D)CEFWee6WHkxb~2p_z3G=3D
> > zaE*kzEXxQcK+v4WlDBC6Y!;r8v$w$UWpanHQr6b0Ro+<5({#V02fc<lXLHzU4q9uq
> > zRr~9V6OKB>X`V-NP}N$uvh4{35qCUeVsO`WGIQNFYHb<bSGTPka;v=3DtJ~}O?Kh)i(
> > zj|Uhu7E#qkt=3D4KAI_CiQI(9yte*ONvoX`03$<n<%l*7C3=3D6Qp#@H<uhR(Br>|HFO$
> > kxK|L<X!fG_PKy%J-z0HV3sWdKrT_o{07*qoM6N<$g6D&ck^lez
> >
> > literal 0
> > HcmV?d00001
> >
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/profile b/meta-=
arago-extras/recipes-graphics/wayland/profile
> > new file mode 100644
> > index 0000000..69564f2
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/profile
> > @@ -0,0 +1,9 @@
> > +if test -z "${XDG_RUNTIME_DIR}"; then
> > +    export XDG_RUNTIME_DIR=3D/tmp/${UID}-runtime-dir
> > +    if ! test -d "${XDG_RUNTIME_DIR}"; then
> > +        mkdir "${XDG_RUNTIME_DIR}"
> > +        chmod 0700 "${XDG_RUNTIME_DIR}"
> > +    fi
> > +else
> > +   echo "Doing nothing"
> > +fi
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/terminal.png b/=
meta-arago-extras/recipes-graphics/wayland/terminal.png
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..3c02dd2100aa31389ace70c=
bf649215a982674b2
> > GIT binary patch
> > literal 1005
> > zcmV<J0}}j+P)<h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv00004b3#c}2nYxW
> > zd<bNS00009a7bBm000fw000fw0YWI7cmMzZ8FWQhbW?9;ba!ELWdL_~cP?peYja~^
> > zaAhuUa%Y?FJQ@H101k9TSaeirbZlh+RAq8)X>MU`)%&240000NbVXQnL3MO!Z*l-k
> > zVQ_CCLt$)TZDDR?a%E}Xks2xh001d;MObu1WpiV4X>fFDZ*BlWVRL0<Aa7<MN?~ht
> > zVjxp=3DWod3@awl^jcW-iQC(|dH0008`Nkl<ZNQu3aJ#QRk6osGnV|J6^*!u-G4F<Ug
> > z73p`8V);klAd!Ls(I5)`1_h!-6i7fpD&z<uf-S*+NEDPHAt8hViDO&q-I;gh{kRnS
> > z;ay^&@P;$G(u_27&fIg)dzFarETNw%`~M+e0p5A{?XO~t+lwSN#@zh$lh3YOfEeTU
> > z`|o`~mSs<swRY~_7(<K^@BOqw2y@R>Rq@fsA8rFv0hCf)+uB;l-~X_;M~o2|Ta;2_
> > zlBOq*9!+1=3DTBDSr_j-@UN`pMldGPZC9_~M+exXjU+rv3Wzu#v#95NgZao&?sBBgY;
> > zz)E9<8*kmfImgbeTPOvqt7~YjP(~v_tJCJyD_6L@vW&470HrlbE8OAHoPZu#bShAJ
> > z&*xu$!E0Bqa{Kmopf!S!JICY42joS8HimZRd5WSSAD43l!#oE-M2PWk9Zb+{wdi%b
> > zbh};d+`Y@%i)&=3DH8UpwfXm#4GzqC%RUPD9(DG^g7N+OC-xRP1Ur!4XzaCm&o8*g66
> > z2T!Nn=3D43FS@}9$^Bed2mEiEw^4souaC>(j7PiHXcU`}AxqGq$n{{B7}FJ0m}qj_ax
> > zgLbn;?s5(epU`P{u(b>ku(cXljMUQw;+W7C?re*uGYB4wV3c5#;pO#p8jU8-72Laj
> > zA8if&lRm!klvPDpI*L4}sz&GG%nnkDGbw6}4wSW6W4QCvJrqz@6{|0-l4TjuXcCYy
> > z`o`Fd7y=3D;#PLBIyfthnKYmxUAGIN~_1{h;7#!&hSS32T2hA~EB3{&#p{eP$E^71m7
> > zwU{i!&a4M*G+OIvLQ)(FOo*fR_z?K>_dotUMP*r%M6iIU)3RE@*pehdNRbc&A&mEt
> > z_xP&%rx~0I{PxSQoELKfN-4Fubq#=3DTc6QE9J`tFmL6%ZtcW;->W(yJUVYKj+QpN(c
> > zs;qw8-TQuXA?#y_$hUx1z(rsK*aQrq&dUvW;A`MOjY(@jeF5YXB%lC-5)qVAYJubv
> > bh=3D|Bv8b1-Z;i*mk00000NkvXXu0mjftX;i`
> >
> > literal 0
> > HcmV?d00001
> >
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.desktop =
b/meta-arago-extras/recipes-graphics/wayland/weston.desktop
> > new file mode 100644
> > index 0000000..8d4dca8
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/weston.desktop
> > @@ -0,0 +1,91 @@
> > +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> > +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> > +<html xmlns=3D'http://www.w3.org/1999/xhtml' xml:lang=3D'en' lang=3D'e=
n'>
> > +<head>
> > +<title>poky - Poky Build Tool and Metadata</title>
> > +<meta name=3D'generator' content=3D'cgit v0.9.1'/>
> > +<meta name=3D'robots' content=3D'index, nofollow'/>
> > +<link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit/cgit.css'/>
> > +<link rel=3D'shortcut icon' href=3D'/favicon.ico'/>
> > +<link rel=3D'alternate' title=3D'Atom feed' href=3D'http://git.yoctopr=
oject.org/cgit/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/west=
on.desktop?h=3Dmaster' type=3D'application/atom+xml'/>
> > +</head>
> > +<body>
> > +<div id=3D'cgit'><table id=3D'header'>
> > +<tr>
> > +<td class=3D'logo' rowspan=3D'2'><a href=3D'/cgit/cgit.cgi/'><img src=
=3D'/cgit/yocto-project-transp.png' alt=3D'cgit logo'/></a></td>
> > +<td class=3D'main'><a href=3D'/cgit/cgit.cgi/'>index</a> : <a title=3D=
'poky' href=3D'/cgit/cgit.cgi/poky/'>poky</a></td><td class=3D'form'><form =
method=3D'get' action=3D''>
> > +<select name=3D'h' onchange=3D'this.form.submit();'>
> > +<option value=3D'1.1_M1'>1.1_M1</option>
> > +<option value=3D'1.1_M2'>1.1_M2</option>
> > +<option value=3D'1.1_M3'>1.1_M3</option>
> > +<option value=3D'1.1_M4'>1.1_M4</option>
> > +<option value=3D'1.2_M1'>1.2_M1</option>
> > +<option value=3D'1.2_M2'>1.2_M2</option>
> > +<option value=3D'1.2_M3'>1.2_M3</option>
> > +<option value=3D'1.2_M4'>1.2_M4</option>
> > +<option value=3D'1.3_M1'>1.3_M1</option>
> > +<option value=3D'1.3_M2'>1.3_M2</option>
> > +<option value=3D'1.3_M3'>1.3_M3</option>
> > +<option value=3D'1.3_M4'>1.3_M4</option>
> > +<option value=3D'1.3_M5'>1.3_M5</option>
> > +<option value=3D'1.3_beta'>1.3_beta</option>
> > +<option value=3D'1.4_M1'>1.4_M1</option>
> > +<option value=3D'1.4_M3'>1.4_M3</option>
> > +<option value=3D'1.4_M4'>1.4_M4</option>
> > +<option value=3D'1.4_M5'>1.4_M5</option>
> > +<option value=3D'bernard'>bernard</option>
> > +<option value=3D'blinky'>blinky</option>
> > +<option value=3D'clyde'>clyde</option>
> > +<option value=3D'danny'>danny</option>
> > +<option value=3D'danny-next'>danny-next</option>
> > +<option value=3D'denzil'>denzil</option>
> > +<option value=3D'dylan'>dylan</option>
> > +<option value=3D'edison'>edison</option>
> > +<option value=3D'elroy'>elroy</option>
> > +<option value=3D'green'>green</option>
> > +<option value=3D'laverne'>laverne</option>
> > +<option value=3D'master' selected=3D'selected'>master</option>
> > +<option value=3D'master-next'>master-next</option>
> > +<option value=3D'pinky'>pinky</option>
> > +<option value=3D'purple'>purple</option>
> > +</select> <input type=3D'submit' name=3D'' value=3D'switch'/></form></=
td></tr>
> > +<tr><td class=3D'sub'>Poky Build Tool and Metadata</td><td class=3D'su=
b right'>git repository hosting</td></tr></table>
> > +<table class=3D'tabs'><tr><td>
> > +<a href=3D'/cgit/cgit.cgi/poky/'>summary</a><a href=3D'/cgit/cgit.cgi/=
poky/refs/'>refs</a><a href=3D'/cgit/cgit.cgi/poky/log/meta/recipes-graphic=
s/wayland/weston/weston.desktop'>log</a><a class=3D'active' href=3D'/cgit/c=
git.cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.desktop'>tree=
</a><a href=3D'/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/wes=
ton/weston.desktop'>commit</a><a href=3D'/cgit/cgit.cgi/poky/diff/meta/reci=
pes-graphics/wayland/weston/weston.desktop'>diff</a><a href=3D'/cgit/cgit.c=
gi/poky/stats/meta/recipes-graphics/wayland/weston/weston.desktop'>stats</a=
></td><td class=3D'form'><form class=3D'right' method=3D'get' action=3D'/cg=
it/cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.desktop'>
> > +<select name=3D'qt'>
> > +<option value=3D'grep'>log msg</option>
> > +<option value=3D'author'>author</option>
> > +<option value=3D'committer'>committer</option>
> > +<option value=3D'range'>range</option>
> > +</select>
> > +<input class=3D'txt' type=3D'text' size=3D'10' name=3D'q' value=3D''/>
> > +<input type=3D'submit' value=3D'search'/>
> > +</form>
> > +</td></tr></table>
> > +<div class=3D'path'>path: <a href=3D'/cgit/cgit.cgi/poky/tree/'>root</=
a>/<a href=3D'/cgit/cgit.cgi/poky/tree/meta'>meta</a>/<a href=3D'/cgit/cgit=
.cgi/poky/tree/meta/recipes-graphics'>recipes-graphics</a>/<a href=3D'/cgit=
/cgit.cgi/poky/tree/meta/recipes-graphics/wayland'>wayland</a>/<a href=3D'/=
cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'>weston</a>/<a=
 href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/west=
on.desktop'>weston.desktop</a></div><div class=3D'content'>blob: 1086ae8bf6=
558c06fe9a498bd093a24613fa5507 (<a href=3D'/cgit/cgit.cgi/poky/plain/meta/r=
ecipes-graphics/wayland/weston/weston.desktop'>plain</a>)
> > +<table summary=3D'blob content' class=3D'blob'>
> > +<tr><td class=3D'linenumbers'><pre><a class=3D'no' id=3D'n1' name=3D'n=
1' href=3D'#n1'>1</a>
> > +<a class=3D'no' id=3D'n2' name=3D'n2' href=3D'#n2'>2</a>
> > +<a class=3D'no' id=3D'n3' name=3D'n3' href=3D'#n3'>3</a>
> > +<a class=3D'no' id=3D'n4' name=3D'n4' href=3D'#n4'>4</a>
> > +<a class=3D'no' id=3D'n5' name=3D'n5' href=3D'#n5'>5</a>
> > +<a class=3D'no' id=3D'n6' name=3D'n6' href=3D'#n6'>6</a>
> > +<a class=3D'no' id=3D'n7' name=3D'n7' href=3D'#n7'>7</a>
> > +<a class=3D'no' id=3D'n8' name=3D'n8' href=3D'#n8'>8</a>
> > +<a class=3D'no' id=3D'n9' name=3D'n9' href=3D'#n9'>9</a>
> > +</pre></td>
> > +<td class=3D'lines'><pre><code>[Desktop Entry]
> > +Encoding=3DUTF-8
> > +Type=3DApplication
> > +Name=3DWeston
> > +Comment=3DWayland Compostitor
> > +Exec=3Dweston
> > +Icon=3Dweston
> > +Terminal=3Dfalse
> > +Categories=3DUtility;
> > +</code></pre></td></tr></table>
> > +</div> <!-- class=3Dcontent -->
> > +<div class=3D'footer'>generated  by cgit v0.9.1 at 2013-09-17 12:41:43=
 (GMT)</div>
> > +</div> <!-- id=3Dcgit -->
> > +</body>
> > +</html>
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.png b/me=
ta-arago-extras/recipes-graphics/wayland/weston.png
> > new file mode 100644
> > index 0000000..1c01c90
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/weston.png
> > @@ -0,0 +1,147 @@
> > +<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
> > +  "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
> > +<html xmlns=3D'http://www.w3.org/1999/xhtml' xml:lang=3D'en' lang=3D'e=
n'>
> > +<head>
> > +<title>poky - Poky Build Tool and Metadata</title>
> > +<meta name=3D'generator' content=3D'cgit v0.9.1'/>
> > +<meta name=3D'robots' content=3D'index, nofollow'/>
> > +<link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit/cgit.css'/>
> > +<link rel=3D'shortcut icon' href=3D'/favicon.ico'/>
> > +<link rel=3D'alternate' title=3D'Atom feed' href=3D'http://git.yoctopr=
oject.org/cgit/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/west=
on.png?h=3Dmaster' type=3D'application/atom+xml'/>
> > +</head>
> > +<body>
> > +<div id=3D'cgit'><table id=3D'header'>
> > +<tr>
> > +<td class=3D'logo' rowspan=3D'2'><a href=3D'/cgit/cgit.cgi/'><img src=
=3D'/cgit/yocto-project-transp.png' alt=3D'cgit logo'/></a></td>
> > +<td class=3D'main'><a href=3D'/cgit/cgit.cgi/'>index</a> : <a title=3D=
'poky' href=3D'/cgit/cgit.cgi/poky/'>poky</a></td><td class=3D'form'><form =
method=3D'get' action=3D''>
> > +<select name=3D'h' onchange=3D'this.form.submit();'>
> > +<option value=3D'1.1_M1'>1.1_M1</option>
> > +<option value=3D'1.1_M2'>1.1_M2</option>
> > +<option value=3D'1.1_M3'>1.1_M3</option>
> > +<option value=3D'1.1_M4'>1.1_M4</option>
> > +<option value=3D'1.2_M1'>1.2_M1</option>
> > +<option value=3D'1.2_M2'>1.2_M2</option>
> > +<option value=3D'1.2_M3'>1.2_M3</option>
> > +<option value=3D'1.2_M4'>1.2_M4</option>
> > +<option value=3D'1.3_M1'>1.3_M1</option>
> > +<option value=3D'1.3_M2'>1.3_M2</option>
> > +<option value=3D'1.3_M3'>1.3_M3</option>
> > +<option value=3D'1.3_M4'>1.3_M4</option>
> > +<option value=3D'1.3_M5'>1.3_M5</option>
> > +<option value=3D'1.3_beta'>1.3_beta</option>
> > +<option value=3D'1.4_M1'>1.4_M1</option>
> > +<option value=3D'1.4_M3'>1.4_M3</option>
> > +<option value=3D'1.4_M4'>1.4_M4</option>
> > +<option value=3D'1.4_M5'>1.4_M5</option>
> > +<option value=3D'bernard'>bernard</option>
> > +<option value=3D'blinky'>blinky</option>
> > +<option value=3D'clyde'>clyde</option>
> > +<option value=3D'danny'>danny</option>
> > +<option value=3D'danny-next'>danny-next</option>
> > +<option value=3D'denzil'>denzil</option>
> > +<option value=3D'dylan'>dylan</option>
> > +<option value=3D'edison'>edison</option>
> > +<option value=3D'elroy'>elroy</option>
> > +<option value=3D'green'>green</option>
> > +<option value=3D'laverne'>laverne</option>
> > +<option value=3D'master' selected=3D'selected'>master</option>
> > +<option value=3D'master-next'>master-next</option>
> > +<option value=3D'pinky'>pinky</option>
> > +<option value=3D'purple'>purple</option>
> > +</select> <input type=3D'submit' name=3D'' value=3D'switch'/></form></=
td></tr>
> > +<tr><td class=3D'sub'>Poky Build Tool and Metadata</td><td class=3D'su=
b right'>git repository hosting</td></tr></table>
> > +<table class=3D'tabs'><tr><td>
> > +<a href=3D'/cgit/cgit.cgi/poky/'>summary</a><a href=3D'/cgit/cgit.cgi/=
poky/refs/'>refs</a><a href=3D'/cgit/cgit.cgi/poky/log/meta/recipes-graphic=
s/wayland/weston/weston.png'>log</a><a class=3D'active' href=3D'/cgit/cgit.=
cgi/poky/tree/meta/recipes-graphics/wayland/weston/weston.png'>tree</a><a h=
ref=3D'/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/weston/west=
on.png'>commit</a><a href=3D'/cgit/cgit.cgi/poky/diff/meta/recipes-graphics=
/wayland/weston/weston.png'>diff</a><a href=3D'/cgit/cgit.cgi/poky/stats/me=
ta/recipes-graphics/wayland/weston/weston.png'>stats</a></td><td class=3D'f=
orm'><form class=3D'right' method=3D'get' action=3D'/cgit/cgit.cgi/poky/log=
/meta/recipes-graphics/wayland/weston/weston.png'>
> > +<select name=3D'qt'>
> > +<option value=3D'grep'>log msg</option>
> > +<option value=3D'author'>author</option>
> > +<option value=3D'committer'>committer</option>
> > +<option value=3D'range'>range</option>
> > +</select>
> > +<input class=3D'txt' type=3D'text' size=3D'10' name=3D'q' value=3D''/>
> > +<input type=3D'submit' value=3D'search'/>
> > +</form>
> > +</td></tr></table>
> > +<div class=3D'path'>path: <a href=3D'/cgit/cgit.cgi/poky/tree/'>root</=
a>/<a href=3D'/cgit/cgit.cgi/poky/tree/meta'>meta</a>/<a href=3D'/cgit/cgit=
.cgi/poky/tree/meta/recipes-graphics'>recipes-graphics</a>/<a href=3D'/cgit=
/cgit.cgi/poky/tree/meta/recipes-graphics/wayland'>wayland</a>/<a href=3D'/=
cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'>weston</a>/<a=
 href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston/west=
on.png'>weston.png</a></div><div class=3D'content'>blob: ea8b7e0e233c86301a=
88e5bc925f09b3de2f9dec (<a href=3D'/cgit/cgit.cgi/poky/plain/meta/recipes-g=
raphics/wayland/weston/weston.png'>plain</a>)
> > +<table summary=3D'blob content' class=3D'bin-blob'>
> > +<tr><th>ofs</th><th>hex dump</th><th>ascii</th></tr><tr><td class=3D'r=
ight'>0000</td><td class=3D'hex'> 89 50 4e 47 0d 0a 1a 0a 00 00 00 0d 49 48=
 44 52    00 00 00 25 00 00 00 30 08 06 00 00 00 96 85 b3 </td><td class=3D=
'hex'>.PNG........IHDR...%...0........</td></tr>
> > +<tr><td class=3D'right'>0020</td><td class=3D'hex'> 2b 00 00 00 04 67 =
41 4d 41 00 00 b1 8f 0b fc 61    05 00 00 00 01 73 52 47 42 00 ae ce 1c e9 =
00 00 </td><td class=3D'hex'>+....gAMA......a.....sRGB.......</td></tr>
> > +<tr><td class=3D'right'>0040</td><td class=3D'hex'> 00 20 63 48 52 4d =
00 00 7a 26 00 00 80 84 00 00    fa 00 00 00 80 e8 00 00 75 30 00 00 ea 60 =
00 00 </td><td class=3D'hex'>..cHRM..z&amp;..............u0...`..</td></tr>
> > +<tr><td class=3D'right'>0060</td><td class=3D'hex'> 3a 98 00 00 17 70 =
9c ba 51 3c 00 00 00 06 62 4b    47 44 00 ff 00 ff 00 ff a0 bd a7 93 00 00 =
00 09 </td><td class=3D'hex'>:....p..Q&lt;....bKGD..............</td></tr>
> > +<tr><td class=3D'right'>0080</td><td class=3D'hex'> 70 48 59 73 00 00 =
06 5a 00 00 06 5a 01 60 79 c1    63 00 00 08 1f 49 44 41 54 58 c3 ed 98 59 =
6c 5c </td><td class=3D'hex'>pHYs...Z...Z.`y.c....IDATX...Yl\</td></tr>
> > +<tr><td class=3D'right'>00a0</td><td class=3D'hex'> 57 19 c7 7f e7 de =
59 6c 8f 77 3b b6 53 37 4e 42    52 a2 38 4d 23 a5 01 b7 d0 36 05 85 b6 34 =
05 5a </td><td class=3D'hex'>W.....Yl.w;.S7NBR.8M#....6...4.Z</td></tr>
> > +<tr><td class=3D'right'>00c0</td><td class=3D'hex'> a4 aa 08 85 4d e2 =
05 89 07 88 04 3c a0 96 b2 54    42 28 b4 f0 50 40 55 29 12 95 8a 04 88 48 =
28 11 </td><td class=3D'hex'>....M......&lt;...TB(..P@U).....H(.</td></tr>
> > +<tr><td class=3D'right'>00e0</td><td class=3D'hex'> 4e 1a 53 4a 5d 96 =
94 24 34 4d 4b 63 37 bb e3 24    8e b7 f1 78 16 cf 9d 7b 0f 0f df 5d 67 ee =
c4 15 </td><td class=3D'hex'>N.SJ]..$4MKc7..$...x...{...]g...</td></tr>
> > +<tr><td class=3D'right'>0100</td><td class=3D'hex'> 52 79 ca 27 8d e6 =
de 73 cf f9 be ff f9 7f cb 59    e0 3d 16 ad b5 f7 6b d7 5a 9b 5a eb 65 c7 =
a8 ff </td><td class=3D'hex'>Ry.'...s.......Y.=3D....k.Z.Z.e...</td></tr>
> > +<tr><td class=3D'right'>0120</td><td class=3D'hex'> 07 a8 88 41 f5 9e =
9b bc 2e d7 e5 ba fc cf 52 93    9f cb a5 b0 3e e4 3f 36 00 3d 40 3f d0 07 =
34 03 </td><td class=3D'hex'>...A..........R.....&gt;.?6.=3D@?..4.</td></tr=
>
> > +<tr><td class=3D'right'>0140</td><td class=3D'hex'> 06 50 00 a6 81 09 =
e0 32 90 03 50 3b 7c dd 69 c0    02 9c 7a e5 21 d2 ea 0e 5a 07 b4 01 47 c3 =
a0 f4 </td><td class=3D'hex'>.P.....2..P;|.i...z.!...Z...G...</td></tr>
> > +<tr><td class=3D'right'>0160</td><td class=3D'hex'> 01 a0 40 92 26 36 =
a2 b8 07 83 ed c0 20 9a 2e a0    09 45 c2 d5 67 03 45 20 0b bc 03 fc 1d a3 =
71 98 </td><td class=3D'hex'>..@.&amp;6...........E..g.E.......q.</td></tr>
> > +<tr><td class=3D'right'>0180</td><td class=3D'hex'> d6 6d 47 50 e6 22 =
5b 5f 4a 02 15 40 03 19 d7 de    19 20 e7 d9 52 5a eb 04 e0 b8 3f 80 0f b8 =
b3 7b </td><td class=3D'hex'>.mGP."[_J..@........RZ....?....{</td></tr>
> > +<tr><td class=3D'right'>01a0</td><td class=3D'hex'> 1b 58 05 ac c0 5e =
b4 98 fc e5 6a a6 f6 3e 88 93    bf 1f cc 3e f2 6f 2a d0 d0 b0 06 54 12 ac =
29 58 </td><td class=3D'hex'>.X...^....j..&gt;.....&gt;.o*....T..)X</td></t=
r>
> > +<tr><td class=3D'right'>01c0</td><td class=3D'hex'> 9a 8c f7 47 b2 33 =
8b d1 30 4a 69 f2 59 14 07 d8    b2 af 48 f7 ce 15 c0 93 c0 7d c0 b7 81 67 =
3c 12 </td><td class=3D'hex'>...G.3..0Ji.Y.....H......}...g&lt;.</td></tr>
> > +<tr><td class=3D'right'>01e0</td><td class=3D'hex'> 94 d6 fa 71 e0 37 =
c0 c9 10 7b 1a b8 09 78 9e 4a    6e 8e e3 9f 9a a3 74 f6 01 9c 72 0b 66 0b =
24 da </td><td class=3D'hex'>...q.7...{...x.Jn.....t...r.f.$.</td></tr>
> > +<tr><td class=3D'right'>0200</td><td class=3D'hex'> 60 f1 b8 cc 23 dd =
0f 2a 01 d6 2c 58 d3 d7 88 12    0d 90 07 f6 b2 c4 13 dc af d7 02 7f 70 c3 =
60 0f </td><td class=3D'hex'>`...#..*..,X................p.`.</td></tr>
> > +<tr><td class=3D'right'>0220</td><td class=3D'hex'> f0 0d 0f 54 02 78 =
0d 98 f4 1a 74 10 54 9f 06 86    30 12 36 a9 5e 98 7d c9 0c 74 87 1c 5f 38 =
5d 15 </td><td class=3D'hex'>...T.x....t.T...0.6.^.}..t.._8].</td></tr>
> > +<tr><td class=3D'right'>0240</td><td class=3D'hex'> 08 0a d2 7d 50 9e =
06 6d 79 81 e1 7d cc 00 bb 48    b1 85 4b bf 1e 67 e5 e7 d3 6e fb 54 78 0a =
06 70 </td><td class=3D'hex'>...}P..my..}...H..K..g...n.Tx..p</td></tr>
> > +<tr><td class=3D'right'>0260</td><td class=3D'hex'> 30 ec 4f 46 57 81 =
52 e0 2c ad 97 1e 8d 26 03 5f    33 49 f7 05 c6 c3 91 e8 bf 2b 30 1a 85 b5 =
28 90 </td><td class=3D'hex'>0.OFW.R.,....&amp;._3I.......+0...(.</td></tr>
> > +<tr><td class=3D'right'>0280</td><td class=3D'hex'> 38 d9 4c f9 f2 43 =
a1 18 f4 49 f1 40 59 80 a1 b5    96 cc 5a ba 08 2f b2 8d 99 e1 bb 7c 15 2d =
b7 42 </td><td class=3D'hex'>8.L..C...I.@Y.....Z../.....|.-.B</td></tr>
> > +<tr><td class=3D'right'>02a0</td><td class=3D'hex'> d7 bd b5 76 74 88 =
a2 d4 0a 68 be 19 94 01 4b 97    40 57 ea 43 52 40 b2 cb 9b 5a 19 f4 64 58 =
b9 01 </td><td class=3D'hex'>...vt....h....K.@W.CR@...Z..dX..</td></tr>
> > +<tr><td class=3D'right'>02c0</td><td class=3D'hex'> 98 2e ad 9e a5 55 =
c0 93 2c be f1 fe 40 49 02 7a    3f 03 4d eb 43 8a 4d 68 bf 0d da 86 dc 98 =
9a 86 </td><td class=3D'hex'>.....U..,...@I.z?.M.C.Mh........</td></tr>
> > +<tr><td class=3D'right'>02e0</td><td class=3D'hex'> dc 51 70 96 58 56 =
cc 26 68 18 90 67 67 c9 20 77    6c 15 28 f4 fc ab 3e 28 1b 58 64 44 01 a4 =
80 6f </td><td class=3D'hex'>.Qp.XV.&amp;h..gg..wl.(...&gt;(.XdD...o</td></=
tr>
> > +<tr><td class=3D'right'>0300</td><td class=3D'hex'> 01 77 52 3c 1d 75 =
41 eb ad 90 ec 0c c5 94 09 f6    22 e4 ff 23 ac 68 07 b4 ed 4e b5 51 12 c0 =
9f 80 </td><td class=3D'hex'>.wR&lt;.uA........."..#.h...N.Q....</td></tr>
> > +<tr><td class=3D'right'>0320</td><td class=3D'hex'> 01 66 63 c0 6e 66 =
33 b4 6c 95 77 6b 26 cd a9 47    bf c2 b0 ea e7 c8 76 19 ae 94 82 11 e5 99 =
ba 07 </td><td class=3D'hex'>.fc.nf3.l.wk&amp;..G......v.........</td></tr>
> > +<tr><td class=3D'right'>0340</td><td class=3D'hex'> d8 05 40 e9 1c d8 =
f9 40 71 a2 13 56 ee 82 96 2d    ee 0c cb 90 3b 01 95 6c 2d 13 ba 2c d9 e8 =
bf 6b </td><td class=3D'hex'>..@....@q..V...-....;..l-..,...k</td></tr>
> > +<tr><td class=3D'right'>0360</td><td class=3D'hex'> 70 ac e0 bd eb 5e =
48 76 c9 f3 ec 08 cc be 38 44    92 2f a3 2b 4a 1f 12 a6 7c 2e 80 af 22 85 =
13 96 </td><td class=3D'hex'>p....^Hv......8D./.+J...|..."...</td></tr>
> > +<tr><td class=3D'right'>0380</td><td class=3D'hex'> 2e 44 0d 2a 13 7a =
1e 86 44 73 6d 06 fa 2f 6e 83    b6 c1 29 4a fd 6a 1b 02 23 1d c4 58 b2 0d =
3a 3f </td><td class=3D'hex'>.D.*.z..Dsm../n...)J.j..#..X..:?</td></tr>
> > +<tr><td class=3D'right'>03a0</td><td class=3D'hex'> e6 f6 b3 60 66 3f =
38 96 02 be 04 0c 02 18 a1 65    63 3b 70 87 af df 9a 95 80 0d 8b 53 82 d2 =
c5 5a </td><td class=3D'hex'>...`f?8........ec;p........S...Z</td></tr>
> > +<tr><td class=3D'right'>03c0</td><td class=3D'hex'> 66 1a d7 c1 4d 7b =
60 e0 eb 02 c0 17 1b 0a ef 08    73 ca 14 c5 99 8d d0 bc 49 3e 97 af 42 ee =
75 af </td><td class=3D'hex'>f...M{`.........s.......I&gt;..B.u.</td></tr>
> > +<tr><td class=3D'right'>03e0</td><td class=3D'hex'> f3 6a e0 11 2f a6 =
40 82 fd 21 c2 01 6f e7 a1 32    57 15 a0 ad 01 ed 9e 18 0d b0 ee 07 30 b0 =
1b d6 </td><td class=3D'hex'>.j../.@..!..o..2W...........0...</td></tr>
> > +<tr><td class=3D'right'>0400</td><td class=3D'hex'> 3e 06 1d 1f 11 26 =
55 52 fe ad 19 89 37 65 4a 42    b4 dd 01 89 0e 17 d4 65 59 09 02 c6 77 02 =
37 78 </td><td class=3D'hex'>&gt;....&amp;UR....7eJB.......eY...w.7x</td></=
tr>
> > +<tr><td class=3D'right'>0420</td><td class=3D'hex'> a0 fa 7d 96 82 40 =
90 58 a8 06 90 ec 88 74 21 d5    2b 25 03 a4 d2 f7 7d 0e cc 06 c9 54 23 25 =
ec 18 </td><td class=3D'hex'>..}..@.X.....t!.+%....}....T#%..</td></tr>
> > +<tr><td class=3D'right'>0440</td><td class=3D'hex'> 0d 02 d2 6c 86 8e =
a0 d2 50 18 83 ca 42 d8 c2 06    e0 76 af d2 0d 02 37 46 31 d9 a0 ab d2 db =
6c 10 </td><td class=3D'hex'>...l....P...B....v....7F1.....l.</td></tr>
> > +<tr><td class=3D'right'>0460</td><td class=3D'hex'> 10 61 69 bf 13 1a =
d7 04 ef 6d b7 4b e6 e5 df 16    d4 89 56 c8 6c 12 40 9d 1f 85 f6 bb 83 be =
d9 c3 </td><td class=3D'hex'>.ai......m.K......V.l.@.........</td></tr>
> > +<tr><td class=3D'right'>0480</td><td class=3D'hex'> e0 54 c2 4c 65 80 =
bb 3c a6 36 02 8d 11 63 2a 29    b4 47 a9 0a ea 0b 40 22 23 f5 4b 25 83 b6 =
86 7e </td><td class=3D'hex'>.T.Le..&lt;.6...c*).G....@"#.K%...~</td></tr>
> > +<tr><td class=3D'right'>04a0</td><td class=3D'hex'> 61 ce 63 b9 92 83 =
85 c3 30 f7 67 64 dd 6c 91 76    6b 0e b2 7f 23 46 b6 7a a0 d6 d6 7e 73 c4 =
e7 d5 </td><td class=3D'hex'>a.c.....0.gd.l.vk...#F.z...~s...</td></tr>
> > +<tr><td class=3D'right'>04c0</td><td class=3D'hex'> d2 b8 5e 96 21 8d =
18 6f ff b0 db bd 2c d9 aa 52    d0 fb 48 50 97 d0 c2 7a b2 13 da 6e 8b ba =
ae 30 </td><td class=3D'hex'>..^.!..o....,..R..HP...z...n...0</td></tr>
> > +<tr><td class=3D'right'>04e0</td><td class=3D'hex'> 16 77 c8 5b 6d c8 =
f4 e9 8e b0 61 34 4a 65 8e ab    41 4d 1b 82 d9 76 7d 1c 12 ed f2 3c b3 0f =
2e fc </td><td class=3D'hex'>.w.[m.....a4Je..AM...v}....&lt;....</td></tr>
> > +<tr><td class=3D'right'>0500</td><td class=3D'hex'> 54 9e 3b ee 86 d6 =
6d 41 e9 d0 40 db 87 c4 8d 9e    e4 4f 40 65 3e 8e a9 4e 0f 54 e0 ba e6 4d =
b2 86 </td><td class=3D'hex'>T.;...mA..@......O@e&gt;..N.T...M..</td></tr>
> > +<tr><td class=3D'right'>0520</td><td class=3D'hex'> d5 5b 4f 9b d6 41 =
fa 46 48 f7 40 d7 7d d2 66 2f    c2 c4 33 b0 70 54 6a 4f b2 13 fa 3e 0b 86 =
19 8c </td><td class=3D'hex'>.[O..A.FH.@.}.f/..3.pTjO...&gt;....</td></tr>
> > +<tr><td class=3D'right'>0540</td><td class=3D'hex'> 6b fd a0 04 bc 27 =
c5 d3 b5 89 e4 06 80 e1 ce 23    28 b7 95 05 28 8c bb 33 b4 6b 87 24 7b 84 =
89 ee </td><td class=3D'hex'>k....'.........#(...(..3.k.${...</td></tr>
> > +<tr><td class=3D'right'>0560</td><td class=3D'hex'> 4f 06 f5 26 fb 0f =
c8 8e 42 71 5c b6 2c 00 dd 0f    08 ab 1a 30 d3 d0 7c 4b 54 4f dd bd 17 96 =
b7 eb </td><td class=3D'hex'>O..&amp;....Bq\.,......0..|KTO......</td></tr>
> > +<tr><td class=3D'right'>0580</td><td class=3D'hex'> 0c fc 54 3a 17 7c =
2e 5f a9 1d a2 0c 58 fb a8 fb    ec 06 f8 f4 7e a8 e4 a1 78 4a c0 f5 3c 2c =
19 d8 </td><td class=3D'hex'>..T:.|._....X.......~...xJ..&lt;,..</td></tr>
> > +<tr><td class=3D'right'>05a0</td><td class=3D'hex'> bd 13 16 df 82 f4 =
0d 90 19 0c 74 54 b2 90 7f ab    1e a8 9c c7 d4 f9 d8 cf a5 b3 f1 ab 7e aa =
4f 7e </td><td class=3D'hex'>..........tT................~.O~</td></tr>
> > +<tr><td class=3D'right'>05c0</td><td class=3D'hex'> 1e b3 0b af b9 6e =
5c 82 ab 7f 74 97 14 05 2b bf    08 4d ef 83 96 6d e2 72 df ec bf 21 77 bc =
de 4d </td><td class=3D'hex'>.....n\...t...+..M...m.r...!w..M</td></tr>
> > +<tr><td class=3D'right'>05e0</td><td class=3D'hex'> c6 84 57 a7 4e 22 =
9b f9 44 e4 73 f1 94 04 63 75    6d 0a 4b f9 52 94 dd dc 31 71 4d aa 4f 96 =
94 0d </td><td class=3D'hex'>..W.N"..D.s...cum.K.R...1qM.O...</td></tr>
> > +<tr><td class=3D'right'>0600</td><td class=3D'hex'> 4f 4b 05 37 52 51 =
b6 53 5d 50 5c 88 d3 f8 a6 57    12 4e 00 57 a3 6e 02 4a 13 02 ec 5a 32 f7 =
57 d9 </td><td class=3D'hex'>OK.7RQ.S]P\....W.N.W.n.J...Z2.W.</td></tr>
> > +<tr><td class=3D'right'>0620</td><td class=3D'hex'> 18 a6 7b e5 67 5d =
0d e2 0a 25 c9 d0 36 14 1d 93    d9 28 07 8e da 38 b7 80 51 0f d4 59 e0 58 =
4d 97 </td><td class=3D'hex'>..{.g]...%..6....(...8..Q..Y.XM.</td></tr>
> > +<tr><td class=3D'right'>0640</td><td class=3D'hex'> 4a 16 b2 ff ac 0f =
48 db 12 43 5a bb c5 b6 ec ae    99 b3 d7 1e 73 fe 29 98 7f 35 ce 7d 13 61 =
50 05 </td><td class=3D'hex'>J.....H..CZ.........s.)..5.}.aP.</td></tr>
> > +<tr><td class=3D'right'>0660</td><td class=3D'hex'> 60 1f c1 31 4b 24 =
d5 27 d5 d8 2e c4 1b a8 64 65    81 4e 75 09 ab d6 9c 80 ca 1d bd 06 b5 0a =
a9 42 </td><td class=3D'hex'>`..1K$.'......de.Nu............B</td></tr>
> > +<tr><td class=3D'right'>0680</td><td class=3D'hex'> 4e dc c7 97 81 31 =
43 ed f0 1b f6 03 d1 94 70 8a    e2 3e 6b 2a 5e 7f ee 08 5c f9 9d 6c 69 0c =
53 ea </td><td class=3D'hex'>N....1C.......p..&gt;k*^...\..li.S.</td></tr>
> > +<tr><td class=3D'right'>06a0</td><td class=3D'hex'> 90 46 36 6e 4e 31 =
7e 4c 79 52 4a 47 ed 1e 7e 01    78 01 b0 c2 9b bc f3 c0 af 90 ed b1 cb c4 =
bc 2c </td><td class=3D'hex'>.F6nN1~LyRJG..~.x..............,</td></tr>
> > +<tr><td class=3D'right'>06c0</td><td class=3D'hex'> 05 c5 b3 75 40 bd =
2e 0c d9 79 99 bd 4a 08 11 0b    87 65 9b 5c e3 3a 07 ce fd 18 ae fc 36 4e =
db 7e </td><td class=3D'hex'>...u@....y..J....e.\.:......6N.~</td></tr>
> > +<tr><td class=3D'right'>06e0</td><td class=3D'hex'> 60 14 97 47 42 6c =
3d 0f fc 25 d2 d5 ca c2 ec c1    18 1d 0e 14 42 86 b5 25 95 1d a0 3c 05 33 =
c3 b5 </td><td class=3D'hex'>`..GBl=3D..%..........B..%...&lt;.3..</td></tr=
>
> > +<tr><td class=3D'right'>0700</td><td class=3D'hex'> 43 f2 c7 61 e6 4f =
71 95 fc 3c f0 14 72 dc 8f 6c    87 41 32 f0 bb 48 c0 05 32 73 50 32 2c 2c =
76 b1 </td><td class=3D'hex'>C..a.Oq..&lt;..r..l.A2..H..2sP2,,v.</td></tr>
> > +<tr><td class=3D'right'>0720</td><td class=3D'hex'> 7e 66 6a c4 78 78 =
6d 73 8a 70 6e 0f e4 4f 56 07    78 09 f8 11 72 28 46 ed 08 81 0a b1 f5 0a =
f0 18 </td><td class=3D'hex'>~fj.xxms.pn..OV.x...r(F.........</td></tr>
> > +<tr><td class=3D'right'>0740</td><td class=3D'hex'> 5e 95 57 48 e0 9e =
f9 7e 74 43 66 4d 8b eb e2 44    21 6e 0f 7f 9f 1f 85 e9 7d d5 80 6c e0 17 =
48 d8 </td><td class=3D'hex'>^.WH...~tCfM...D!n......}..l..H.</td></tr>
> > +<tr><td class=3D'right'>0760</td><td class=3D'hex'> f8 18 22 4c 55 b9 =
f1 3b 3e 30 34 4c 3e 07 e3 bb    83 42 99 3b 22 ec d5 bb ec b5 e6 a1 e0 5e =
4f d8 </td><td class=3D'hex'>.."LU..;&gt;04L&gt;....B.;"........^O.</td></t=
r>
> > +<tr><td class=3D'right'>0780</td><td class=3D'hex'> 39 98 f8 99 84 42 =
20 15 e0 39 e0 7b 40 21 64 bb    c6 7d 1e b0 0a f0 34 b0 1b f7 48 8d b6 04 =
d8 f1 </td><td class=3D'hex'>9....B...9.{@!d..}....4...H.....</td></tr>
> > +<tr><td class=3D'right'>07a0</td><td class=3D'hex'> 07 e1 ec 13 12 b0 =
76 89 ba e2 94 61 6e 44 fe 2f    3e 2b ee 0c 26 90 07 7e 02 7c 13 98 0b 03 =
f2 88 </td><td class=3D'hex'>......v....anD./&gt;+..&amp;..~.|......</td></=
tr>
> > +<tr><td class=3D'right'>07c0</td><td class=3D'hex'> 8e 15 f7 94 a3 90 =
53 ce e3 c8 1e de 8c 3f 5e d5    91 e4 0a d9 d8 cd bf 12 8e af 31 e0 87 c8 =
4d 4f </td><td class=3D'hex'>......S......?^...........1...MO</td></tr>
> > +<tr><td class=3D'right'>07e0</td><td class=3D'hex'> a9 1a d0 b2 aa 43 =
c7 af 1e e0 0b c8 d9 6c 43 1c    c3 f5 95 f8 56 2e 01 bf 07 7e 8e dc 7d e9 =
38 40 </td><td class=3D'hex'>.....C.......lC.....V....~..}.8@</td></tr>
> > +<tr><td class=3D'right'>0800</td><td class=3D'hex'> b1 a0 42 d7 8b 41 =
d9 1d f1 ae 55 18 00 3e e1 fe    6e 41 76 ac 89 78 d5 38 48 41 1c 03 0e 00 =
7b 81 </td><td class=3D'hex'>..B..A....U..&gt;..nAv..x.8HA....{.</td></tr>
> > +<tr><td class=3D'right'>0820</td><td class=3D'hex'> 37 80 4a 3d 30 cb =
81 52 40 17 30 07 d8 fe 15 e3    21 df 5c 86 d6 cd 9b 28 9e d9 80 bd b8 06 =
39 a2 </td><td class=3D'hex'>7.J=3D0..R@.0.....!.\....(......9.</td></tr>
> > +<tr><td class=3D'right'>0840</td><td class=3D'hex'> b5 ba 13 59 04 ae =
00 a7 91 85 7e dc d5 a3 97 03    f3 6e 98 f2 af c8 6a 2e 63 a5 4f 02 b0 a9 =
cc 6b </td><td class=3D'hex'>...Y......~......n....j.c.O....k</td></tr>
> > +<tr><td class=3D'right'>0860</td><td class=3D'hex'> 5e ee f0 16 34 45 =
e8 aa f2 dd 82 58 16 54 0c b0    30 c0 7a 61 5e 5d a2 bd 33 97 55 d5 ae 42 =
3f 07 </td><td class=3D'hex'>^...4E.....X.T..0.za^]..3.U..B?.</td></tr>
> > +<tr><td class=3D'right'>0880</td><td class=3D'hex'> d0 71 37 c4 f5 e2 =
01 c4 1d 83 c8 55 f4 12 e2 96    0b 40 27 72 ed dc 8a 14 bf 02 70 8e 60 4b =
dd 84 </td><td class=3D'hex'>.q7........U.....@'r......p.`K..</td></tr>
> > +<tr><td class=3D'right'>08a0</td><td class=3D'hex'> 64 ea 2c f0 af 90 =
be 0c 70 b3 3b b6 1b 18 76 c7    d6 c8 7f 01 68 32 fd 92 51 5f 34 1b 00 00 =
00 25 </td><td class=3D'hex'>d.,.....p.;...v.....h2..Q_4....%</td></tr>
> > +<tr><td class=3D'right'>08c0</td><td class=3D'hex'> 74 45 58 74 64 61 =
74 65 3a 63 72 65 61 74 65 00    32 30 31 33 2d 30 31 2d 31 36 54 31 32 3a =
31 31 </td><td class=3D'hex'>tEXtdate:create.2013-01-16T12:11</td></tr>
> > +<tr><td class=3D'right'>08e0</td><td class=3D'hex'> 3a 33 34 2b 30 30 =
3a 30 30 e9 0b 13 43 00 00 00    25 74 45 58 74 64 61 74 65 3a 6d 6f 64 69 =
66 79 </td><td class=3D'hex'>:34+00:00...C...%tEXtdate:modify</td></tr>
> > +<tr><td class=3D'right'>0900</td><td class=3D'hex'> 00 32 30 31 33 2d =
30 31 2d 31 36 54 31 32 3a 31    31 3a 33 31 2b 30 30 3a 30 30 ca 6e 84 58 =
00 00 </td><td class=3D'hex'>.2013-01-16T12:11:31+00:00.n.X..</td></tr>
> > +<tr><td class=3D'right'>0920</td><td class=3D'hex'> 00 19 74 45 58 74 =
53 6f 66 74 77 61 72 65 00 77    77 77 2e 69 6e 6b 73 63 61 70 65 2e 6f 72 =
67 9b </td><td class=3D'hex'>..tEXtSoftware.www.inkscape.org.</td></tr>
> > +<tr><td class=3D'right'>0940</td><td class=3D'hex'> ee 3c 1a 00 00 00 =
00 49 45 4e 44 ae 42 60 82 </td><td class=3D'hex'>.&lt;.....IEND.B`.</td></=
tr>
> > +</table>
> > +</div> <!-- class=3Dcontent -->
> > +<div class=3D'footer'>generated  by cgit v0.9.1 at 2013-09-17 12:41:48=
 (GMT)</div>
> > +</div> <!-- id=3Dcgit -->
> > +</body>
> > +</html>
> > diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb=
 b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> > new file mode 100644
> > index 0000000..61735e2
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb
> > @@ -0,0 +1,148 @@
> > +SUMMARY =3D "Weston, a Wayland compositor"
> > +DESCRIPTION =3D "Weston is the reference implementation of a Wayland c=
ompositor"
> > +HOMEPAGE =3D "http://wayland.freedesktop.org"
> > +LICENSE =3D "MIT"
> > +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D275efac2559a224527bd4fd593d=
38466 \
> > +                    file://src/compositor.c;endline=3D23;md5=3Daa98a8d=
b03480fe7d500d0b1f4b8850c"
> > +
> > +SRC_URI =3D "git://anongit.freedesktop.org/wayland/weston;protocol=3Dg=
it \
> > +           file://weston.png \
> > +           file://weston.desktop \
> > +           file://terminal.png \
> > +           file://pattern.png \
> > +           file://profile \
> > +           file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.=
h.patch \
> > +           file://0002-Makefile-Include-option-to-search-in-include-dr=
m.patch \
> > +      file://0003-input-source-prevent-input-disable-during-repaint.pa=
tch \
> > +      file://0005-temp-hack-to-enable-weston-1.3.patch \
> > +      file://0006-weston-drm-Enable-multiple-displays.patch "
> > +
> > +
> > +SRCREV =3D "95659c03219b057d9d703b04cf89bc0329ce947a"
> > +
> > +S =3D "${WORKDIR}/git"
> > +
> > +PR =3D "r3"
> > +
> > +inherit autotools pkgconfig useradd
> > +
> > +DEPENDS =3D "xkbcommon gdk-pixbuf pixman cairo glib-2.0 jpeg mtdev lib=
pam"
> > +DEPENDS +=3D "wayland libgbm omap5-sgx-ddk-um-linux pango"
> > +
> > +
> > +EXTRA_OECONF =3D "--disable-android-compositor \
> > +                 --disable-simple-egl-clients \
> > +                 --enable-fbdev-compositor \
> > +                --enable-setuid-install \
> > +                --disable-tablet-shell \
> > +                --disable-xwayland \
> > +                --enable-simple-clients \
> > +                --enable-clients \
> > +                --disable-libunwind \
> > +                --disable-rpi-compositor \
> > +                --disable-rdp-compositor \
> > +                --prefix=3D${STAGING_DIR_TARGET} \
> > +                --with-libtool-sysroot=3D${STAGING_DIR_TARGET}"
> > +
> > +
> > +PACKAGECONFIG ??=3D "${@base_contains('DISTRO_FEATURES', 'wayland', 'k=
ms wayland', '', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'x11', 'x11', '=
', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'opengles2', 'g=
les', '', d)} \
> > +                   ${@base_contains('DISTRO_FEATURES', 'pam', 'launch'=
, '', d)} \
> > +                  "
> > +#
> > +# Compositor choices
> > +#
> > +# Weston on KMS
> > +PACKAGECONFIG[kms] =3D "--enable-drm-compositor,--disable-drm-composit=
or,drm udev libgbm mtdev"
> > +# Weston on Wayland (nested Weston)
> > +PACKAGECONFIG[wayland] =3D "--enable-wayland-compositor,--disable-wayl=
and-compositor,libgbm"
> > +# Weston on X11
> > +PACKAGECONFIG[x11] =3D "--enable-x11-compositor,--disable-x11-composit=
or,virtual/libx11 libxcb libxcb libxcursor cairo"
> > +# Headless Weston
> > +PACKAGECONFIG[headless] =3D "--enable-headless-compositor,--disable-he=
adless-compositor"
> > +# Weston on framebuffer
> > +PACKAGECONFIG[fbdev] =3D "--enable-fbdev-compositor,--disable-fbdev-co=
mpositor,udev mtdev"
> > +# weston-launch
> > +PACKAGECONFIG[launch] =3D "--enable-weston-launch,--disable-weston-lau=
nch,libpam"
> > +# Use cairo-gl or cairo-glesv2
> > +PACKAGECONFIG[gles] =3D "--with-cairo-glesv2,,virtual/libgles2"
> > +
> > +
> > +
> > +do_install_append() {
> > +   # Weston doesn't need the .la files to load modules, so wipe them
> > +   rm -f ${D}/${libdir}/weston/*.la
> > +
> > +   for feature in ${DISTRO_FEATURES}; do
> > +           # If X11, ship a desktop file to launch it
> > +           if [ "$feature" =3D "x11" ]; then
> > +                   install -d ${D}${datadir}/applications
> > +                   install ${WORKDIR}/weston.desktop ${D}${datadir}/ap=
plications
> > +
> > +                   install -d ${D}${datadir}/icons/hicolor/48x48/apps
> > +                   install ${WORKDIR}/weston.png ${D}${datadir}/icons/=
hicolor/48x48/apps
> > +                fi
> > +   done
> > +        install ${WORKDIR}/terminal.png ${D}${datadir}/icons/hicolor/4=
8x48/apps
> > +        install ${WORKDIR}/pattern.png ${D}${datadir}/icons/hicolor/48=
x48/apps
> > +
> > +        mkdir -p ${D}/usr/bin/weston-clients
> > +        cp ${S}/clients/weston-calibrator ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-clickdot ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-cliptest ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-dnd ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-editor ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-eventdemo ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-flower ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-fullscreen ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-image ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-keyboard ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-multi-resource ${D}/usr/bin/weston-clie=
nts/
> > +        cp ${S}/clients/weston-resizor ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-simple-egl ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-simple-im ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-simple-shm ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-simple-touch ${D}/usr/bin/weston-client=
s/
> > +        cp ${S}/clients/weston-smoke ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-subsurfaces ${D}/usr/bin/weston-clients=
/
> > +        cp ${S}/clients/weston-desktop-shell ${D}/usr/bin/weston-clien=
ts/
> > +        cp ${S}/clients/weston-info ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-screenshooter ${D}/usr/bin/weston-clien=
ts/
> > +        cp ${S}/clients/weston-tablet-shell ${D}/usr/bin/weston-client=
s/
> > +        cp ${S}/clients/weston-terminal ${D}/usr/bin/weston-clients/
> > +        cp ${S}/clients/weston-transformed ${D}/usr/bin/weston-clients=
/
> > +
> > +        mkdir -p ${D}/usr/libexec
> > +        cp ${S}/clients/weston-desktop-shell ${D}/usr/libexec/
> > +        cp ${S}/clients/weston-screenshooter ${D}/usr/libexec/
> > +        cp ${S}/clients/weston-tablet-shell ${D}/usr/libexec/
> > +
> > +   mkdir -p ${D}/home/root
> > +        mkdir -p ${D}/home/root/.config
> > +        cp ${S}/weston.ini ${D}/home/root/.config/
> > +        cp ${WORKDIR}/profile ${D}/home/root/.profile
> > +
> > +}
> > +
> > +do_configure() {
> > +   aclocal -I ${STAGING_DIR_TARGET}/usr/share/aclocal
> > +        ./autogen.sh --prefix=3D/usr --host=3Darm-linux --with-libtool=
-sysroot=3D${STAGING_DIR_TARGET} --enable-weston-launch
> > +}
> > +
> > +PACKAGES +=3D "${PN}-examples"
> > +
> > +FILES_${PN} =3D "${bindir}/weston* ${bindir}/wcap-decode ${libexecdir}=
 ${datadir} ${libdir}/weston/* /home/root/.profile /home/root/.config/* /us=
r/libexec/weston-desktop-shell /usr/libexec/weston-screenshooter /usr/libex=
ec/weston-tablet-shell"
> > +FILES_${PN}-examples =3D "${bindir}/*"
> > +
> > +FILES_${PN}-dbg +=3D "${bindir}/weston-clients/.debug"
> > +
> > +RDEPENDS_${PN} +=3D "xkeyboard-config"
> > +RRECOMMENDS_${PN} =3D "liberation-fonts"
> > +
> > +USERADD_PACKAGES =3D "${PN}"
> > +GROUPADD_PARAM_${PN} =3D "--system weston-launch"
> > +
> > +INSANE_SKIP_weston +=3D "dev-deps"
> > +
> > +FILESEXTRAPATHS_prepend :=3D "${THISDIR}:"
> > --
> > 1.7.9.5
> >
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

--_000_24B88602B5904F49971CAF899152529B80B3E4DBDE04entticom_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<div>
<div>
<div style=3D"font-family:Calibri,sans-serif; font-size:11pt">Denys,<br>
<br>
This is on my list. Will get it done by this Friday. The other patches have=
 become a priority. Will do it asap.<br>
<br>
Regards<br>
Karthik <br>
</div>
</div>
<hr>
<span style=3D"font-family:Tahoma,sans-serif; font-size:10pt; font-weight:b=
old">From:
</span><span style=3D"font-family:Tahoma,sans-serif; font-size:10pt">Dmytri=
yenko, Denys</span><br>
<span style=3D"font-family:Tahoma,sans-serif; font-size:10pt; font-weight:b=
old">Sent:
</span><span style=3D"font-family:Tahoma,sans-serif; font-size:10pt">03-09-=
2014 22:49</span><br>
<span style=3D"font-family:Tahoma,sans-serif; font-size:10pt; font-weight:b=
old">To:
</span><span style=3D"font-family:Tahoma,sans-serif; font-size:10pt">R, Kar=
thik</span><br>
<span style=3D"font-family:Tahoma,sans-serif; font-size:10pt; font-weight:b=
old">Cc:
</span><span style=3D"font-family:Tahoma,sans-serif; font-size:10pt">meta-a=
rago@arago-project.org; Devshatwar, Nikhil</span><br>
<span style=3D"font-family:Tahoma,sans-serif; font-size:10pt; font-weight:b=
old">Subject:
</span><span style=3D"font-family:Tahoma,sans-serif; font-size:10pt">Re: [m=
eta-arago] [PATCH 2/2] wayland: adding support for weston 1.3.0 for DRM bac=
kend</span><br>
<br>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Ping?<br>
<br>
On Fri, Aug 29, 2014 at 01:16:00PM -0400, Denys Dmytriyenko wrote:<br>
&gt; Karthik,<br>
&gt; <br>
&gt; Few comments:<br>
&gt; <br>
&gt; 1. Please overlay the original 1.3.0 version of weston from oe-core/do=
ra as is <br>
&gt; in a separate patch, before patching it with own changes.<br>
&gt; 2. And in the description please mention it's weston (even though it's=
 in the <br>
&gt; same wayland directory) as well as it's an initial overlay of original=
 recipe <br>
&gt; from oe-core/dora that will be patched separately.<br>
&gt; 3. It looks like weston.desktop and weston.png files below got corrupt=
ed, <br>
&gt; please fix.<br>
&gt; <br>
&gt; Thanks.<br>
&gt; <br>
&gt; -- <br>
&gt; Denys<br>
&gt; <br>
&gt; <br>
&gt; On Fri, Aug 22, 2014 at 06:55:23PM &#43;0530, Karthik Ramanan wrote:<b=
r>
&gt; &gt; On devices where the backend is chosen as DRM, as in the case<br>
&gt; &gt; of dra7xx, there are some addition patches that are specific<br>
&gt; &gt; to the omapdrm which are needed for basic functionality and<br>
&gt; &gt; some bug fixes.<br>
&gt; &gt; <br>
&gt; &gt; * This will full enable multiple display support<br>
&gt; &gt; * Handle screensavers more efficient<br>
&gt; &gt; * Be compatible with libgbm, TI adaptation of libgbm<br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; ---<br>
&gt; &gt;&nbsp; ...tor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch |&nbsp;&=
nbsp; 26 &#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; ...e-Include-option-to-search-in-include-drm.patch |&nbsp;&=
nbsp; 47 &#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; ...urce-prevent-input-disable-during-repaint.patch |&nbsp;&=
nbsp; 34 &#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../0005-temp-hack-to-enable-weston-1.3.patch&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp; |&nbsp;&nbsp; 33 &#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../0006-weston-drm-Enable-multiple-displays.patch |&nbsp;&=
nbsp; 43 &#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../recipes-graphics/wayland/pattern.png&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; Bin 0 -&gt; 1846 bytes<br=
>
&gt; &gt;&nbsp; meta-arago-extras/recipes-graphics/wayland/profile |&nbsp;&=
nbsp;&nbsp; 9 &#43;&#43;<br>
&gt; &gt;&nbsp; .../recipes-graphics/wayland/terminal.png&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; Bin 0 -&gt; 1005 bytes<br>
&gt; &gt;&nbsp; .../recipes-graphics/wayland/weston.desktop&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 91 &#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; .../recipes-graphics/wayland/weston.png&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 147 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;<br>
&gt; &gt;&nbsp; .../recipes-graphics/wayland/weston_1.3.0.bb&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; |&nbsp; 148 &#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&=
#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;&#43;<br>
&gt; &gt;&nbsp; 11 files changed, 578 insertions(&#43;)<br>
&gt; &gt;&nbsp; create mode 100755 meta-arago-extras/recipes-graphics/wayla=
nd/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch<br>
&gt; &gt;&nbsp; create mode 100755 meta-arago-extras/recipes-graphics/wayla=
nd/0002-Makefile-Include-option-to-search-in-include-drm.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/0003-input-source-prevent-input-disable-during-repaint.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/0005-temp-hack-to-enable-weston-1.3.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/0006-weston-drm-Enable-multiple-displays.patch<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/pattern.png<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/profile<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/terminal.png<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/weston.desktop<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/weston.png<br>
&gt; &gt;&nbsp; create mode 100644 meta-arago-extras/recipes-graphics/wayla=
nd/weston_1.3.0.bb<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/0001-comp=
ositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch b/meta-arago-extras/reci=
pes-graphics/wayland/0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.=
patch<br>
&gt; &gt; new file mode 100755<br>
&gt; &gt; index 0000000..cd0581a<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/0001=
-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch<br>
&gt; &gt; @@ -0,0 &#43;1,26 @@<br>
&gt; &gt; &#43;From 5f655cb89813e39d6410493b4725e447212ea3a3 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt; &#43;From: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;<br>
&gt; &gt; &#43;Date: Tue, 24 Sep 2013 19:13:50 &#43;0530<br>
&gt; &gt; &#43;Subject: [PATCH] compositor-drm: Change path of gbm.h to gbm=
/gbm.h<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Signed-off-by: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;=
<br>
&gt; &gt; &#43;---<br>
&gt; &gt; &#43; src/compositor-drm.c |&nbsp;&nbsp;&nbsp; 2 &#43;-<br>
&gt; &gt; &#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;diff --git a/src/compositor-drm.c b/src/compositor-drm.c<br>
&gt; &gt; &#43;index f055118..7a59872 100644<br>
&gt; &gt; &#43;--- a/src/compositor-drm.c<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/src/compositor-drm.c<br>
&gt; &gt; &#43;@@ -35,7 &#43;35,7 @@<br>
&gt; &gt; &#43; #include &lt;xf86drmMode.h&gt;<br>
&gt; &gt; &#43; #include &lt;drm_fourcc.h&gt;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-#include &lt;gbm.h&gt;<br>
&gt; &gt; &#43;&#43;#include &lt;gbm/gbm.h&gt;<br>
&gt; &gt; &#43; #include &lt;libbacklight.h&gt;<br>
&gt; &gt; &#43; #include &lt;libudev.h&gt;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-- <br>
&gt; &gt; &#43;1.7.9.5<br>
&gt; &gt; &#43;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/0002-Make=
file-Include-option-to-search-in-include-drm.patch b/meta-arago-extras/reci=
pes-graphics/wayland/0002-Makefile-Include-option-to-search-in-include-drm.=
patch<br>
&gt; &gt; new file mode 100755<br>
&gt; &gt; index 0000000..557373d<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/0002=
-Makefile-Include-option-to-search-in-include-drm.patch<br>
&gt; &gt; @@ -0,0 &#43;1,47 @@<br>
&gt; &gt; &#43;From c8b6fe71ad0231c4787836f4156e604cedfe45a8 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt; &#43;From: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;<br>
&gt; &gt; &#43;Date: Thu, 3 Jul 2014 15:06:31 &#43;0530<br>
&gt; &gt; &#43;Subject: [PATCH] Makefile change to search for correct drm h=
eaders<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Signed-off-by: Mrinmayee Hingolikar &lt;mrinmayee@ti.com&gt;=
<br>
&gt; &gt; &#43;---<br>
&gt; &gt; &#43; src/Makefile.am&nbsp;&nbsp; | 3 &#43;&#43;-<br>
&gt; &gt; &#43; tests/Makefile.am | 1 &#43;<br>
&gt; &gt; &#43; 2 files changed, 3 insertions(&#43;), 1 deletion(-)<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;diff --git a/src/Makefile.am b/src/Makefile.am<br>
&gt; &gt; &#43;index 749c074..a6e44e7 100644<br>
&gt; &gt; &#43;--- a/src/Makefile.am<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/src/Makefile.am<br>
&gt; &gt; &#43;@@ -2,6 &#43;2,7 @@ bin_PROGRAMS =3D weston&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; $(weston_launch)<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43; AM_CPPFLAGS =3D&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; $(DRM_COMPOS=
ITOR_CFLAGS)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -I$(top_srcdir)/shared&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -DDATADIR=3D'&quot;$(datadir)&quot;'&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -DMODULEDIR=3D'&quot;$(moduledir)&quot;'&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;@@ -9,7 &#43;10,7 @@ AM_CPPFLAGS =3D&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -DIN_WESTON<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43; weston_LDFLAGS =3D -export-dynamic<br>
&gt; &gt; &#43;-weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(LIBU=
NWIND_CFLAGS)<br>
&gt; &gt; &#43;&#43;weston_CFLAGS =3D $(GCC_CFLAGS) $(COMPOSITOR_CFLAGS) $(=
LIBUNWIND_CFLAGS) <br>
&gt; &gt; &#43; weston_LDADD =3D $(COMPOSITOR_LIBS) $(LIBUNWIND_LIBS) \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; $(DLOPEN_LIBS) -lm ../shared/libshared.la=
<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;diff --git a/tests/Makefile.am b/tests/Makefile.am<br>
&gt; &gt; &#43;index 5be52c6..42ebd2b 100644<br>
&gt; &gt; &#43;--- a/tests/Makefile.am<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/tests/Makefile.am<br>
&gt; &gt; &#43;@@ -47,6 &#43;47,7 @@ AM_CPPFLAGS =3D&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -I$(top_srcdir)/shared&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -I$(top_builddir)/src&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; -DUNIT_TEST&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&#43;&nbsp; $(DRM_COMPOSITOR_CFLAGS)&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; $(COMPOSITOR_CFLAGS)<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43; surface_global_test_la_SOURCES =3D surface-global-test.c<br=
>
&gt; &gt; &#43;-- <br>
&gt; &gt; &#43;2.0.1<br>
&gt; &gt; &#43;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/0003-inpu=
t-source-prevent-input-disable-during-repaint.patch b/meta-arago-extras/rec=
ipes-graphics/wayland/0003-input-source-prevent-input-disable-during-repain=
t.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..74e82fb<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/0003=
-input-source-prevent-input-disable-during-repaint.patch<br>
&gt; &gt; @@ -0,0 &#43;1,34 @@<br>
&gt; &gt; &#43;From cdd9043580e0f0a6c60c21b955f1966c78b2098b Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt; &#43;From: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;Date: Mon, 2 Dec 2013 15:52:41 &#43;0530<br>
&gt; &gt; &#43;Subject: [PATCH] input source: prevent input disable during =
repaint<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Under certain race conditions, the input source was getting<=
br>
&gt; &gt; &#43;disabled which was preventing the evdev events from keyboard=
 or<br>
&gt; &gt; &#43;mouse to reach Weston. The side effect of this issue was<br>
&gt; &gt; &#43;that after the screen gets locked, it was not possible to<br=
>
&gt; &gt; &#43;come to Weston desktop without killing Weston.<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Signed-off-by: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;---<br>
&gt; &gt; &#43; src/compositor.c |&nbsp;&nbsp;&nbsp; 4 ----<br>
&gt; &gt; &#43; 1 files changed, 0 insertions(&#43;), 4 deletions(-)<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;diff --git a/src/compositor.c b/src/compositor.c<br>
&gt; &gt; &#43;index 0e0835f..ced3883 100644<br>
&gt; &gt; &#43;--- a/src/compositor.c<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/src/compositor.c<br>
&gt; &gt; &#43;@@ -1084,10 &#43;1084,6 @@ weston_output_schedule_repaint(st=
ruct weston_output *output)<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; wl_event_loop_add_idle(loop, idle_repaint=
, output);<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; output-&gt;repaint_scheduled =3D 1;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-&nbsp; if (compositor-&gt;input_loop_source) {<br>
&gt; &gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wl_e=
vent_source_remove(compositor-&gt;input_loop_source);<br>
&gt; &gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; comp=
ositor-&gt;input_loop_source =3D NULL;<br>
&gt; &gt; &#43;-&nbsp; }<br>
&gt; &gt; &#43; }<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43; WL_EXPORT void<br>
&gt; &gt; &#43;-- <br>
&gt; &gt; &#43;1.7.0.4<br>
&gt; &gt; &#43;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/0005-temp=
-hack-to-enable-weston-1.3.patch b/meta-arago-extras/recipes-graphics/wayla=
nd/0005-temp-hack-to-enable-weston-1.3.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..0c860b3<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/0005=
-temp-hack-to-enable-weston-1.3.patch<br>
&gt; &gt; @@ -0,0 &#43;1,33 @@<br>
&gt; &gt; &#43;From 518fe5aea452a4660e07855716349a0c84e59b14 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt; &#43;From: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;Date: Tue, 21 Jan 2014 11:48:19 &#43;0000<br>
&gt; &gt; &#43;Subject: [PATCH] temp-hack: to enable weston 1.3<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;This patch resolves the issue with the black display seen<br=
>
&gt; &gt; &#43;when running weston 1.3 version on the dra7xx target.<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Known issues:<br>
&gt; &gt; &#43;1. simple-egl application does not work<br>
&gt; &gt; &#43;2. weston on multiple displays does not work<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Signed-off-by: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;---<br>
&gt; &gt; &#43; src/compositor-drm.c |&nbsp;&nbsp;&nbsp; 2 &#43;-<br>
&gt; &gt; &#43; 1 file changed, 1 insertion(&#43;), 1 deletion(-)<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;diff --git a/src/compositor-drm.c b/src/compositor-drm.c<br>
&gt; &gt; &#43;index 0ac5efa..dd28f0f 100644<br>
&gt; &gt; &#43;--- a/src/compositor-drm.c<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/src/compositor-drm.c<br>
&gt; &gt; &#43;@@ -616,7 &#43;616,7 @@ drm_output_repaint(struct weston_out=
put *output_base,<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; .request.sequence =
=3D 1,<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; };<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (=
(!s-&gt;current &amp;&amp; !s-&gt;next) ||<br>
&gt; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
if ((!s-&gt;current &amp;&amp; !s-&gt;next) &amp;&amp;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; !drm_sprite_crtc_supported(output_base, s-&g=
t;possible_crtcs))<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-- <br>
&gt; &gt; &#43;1.7.9.5<br>
&gt; &gt; &#43;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/0006-west=
on-drm-Enable-multiple-displays.patch b/meta-arago-extras/recipes-graphics/=
wayland/0006-weston-drm-Enable-multiple-displays.patch<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..abc4295<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/0006=
-weston-drm-Enable-multiple-displays.patch<br>
&gt; &gt; @@ -0,0 &#43;1,43 @@<br>
&gt; &gt; &#43;From dce69cadd858bd959dd41edf82860cd370ca1fa8 Mon Sep 17 00:=
00:00 2001<br>
&gt; &gt; &#43;From: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;Date: Fri, 14 Mar 2014 18:55:12 &#43;0530<br>
&gt; &gt; &#43;Subject: [PATCH] weston-drm: Enable multiple displays<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;We are currently seeing an issue with missing VBlanks for LC=
D and<br>
&gt; &gt; &#43;HDMI connectors which leads to display not getting refreshed=
.<br>
&gt; &gt; &#43;This patch can be considered as a workaround.<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;Signed-off-by: Karthik Ramanan &lt;a0393906@ti.com&gt;<br>
&gt; &gt; &#43;---<br>
&gt; &gt; &#43; src/compositor-drm.c |&nbsp;&nbsp;&nbsp; 8 &#43;&#43;&#43;&=
#43;&#43;&#43;&#43;-<br>
&gt; &gt; &#43; 1 file changed, 7 insertions(&#43;), 1 deletion(-)<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;diff --git a/src/compositor-drm.c b/src/compositor-drm.c<br>
&gt; &gt; &#43;index 79dcc6c..ef2fbd2 100644<br>
&gt; &gt; &#43;--- a/src/compositor-drm.c<br>
&gt; &gt; &#43;&#43;&#43;&#43; b/src/compositor-drm.c<br>
&gt; &gt; &#43;@@ -709,6 &#43;709,7 @@ page_flip_handler(int fd, unsigned i=
nt frame,<br>
&gt; &gt; &#43; {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; struct drm_output *output =3D (struct drm=
_output *) data;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; uint32_t msecs;<br>
&gt; &gt; &#43;&#43;&nbsp; uint32_t bail;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; /* We don't set page_flip_pending on star=
t_repaint_loop, in that case<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp; * we just want to page flip to the =
current buffer to get an accurate<br>
&gt; &gt; &#43;@@ -721,7 &#43;722,12 @@ page_flip_handler(int fd, unsigned =
int frame,<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; output-&gt;page_flip_pending =3D 0;<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-&nbsp; if (!output-&gt;vblank_pending) {<br>
&gt; &gt; &#43;&#43;&nbsp; if (output-&gt;vblank_pending) {<br>
&gt; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
weston_log(&quot;VBlank is pending for connector =3D %d, frame =3D %d\n&quo=
t;, output-&gt;connector_id, frame);<br>
&gt; &gt; &#43;&#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
bail =3D 1;<br>
&gt; &gt; &#43;&#43;&nbsp; }<br>
&gt; &gt; &#43;&#43;<br>
&gt; &gt; &#43;&#43;&nbsp; if (!output-&gt;vblank_pending || bail) {<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; msecs =3D sec * 1000 &#43; usec / 1000;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp; weston_output_finish_frame(&amp;output-&gt;base, msecs);<br>
&gt; &gt; &#43; <br>
&gt; &gt; &#43;-- <br>
&gt; &gt; &#43;1.7.9.5<br>
&gt; &gt; &#43;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/pattern.p=
ng b/meta-arago-extras/recipes-graphics/wayland/pattern.png<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000000000000000000000000000000000..5ac8986d6721b4c19=
794f1d24e513af7015aa395<br>
&gt; &gt; GIT binary patch<br>
&gt; &gt; literal 1846<br>
&gt; &gt; zcmV-62g&amp;$}P)&lt;h;3K|Lk000e1NJLTq0027x001Hg0ssI2Zk{%`00009a7=
bBm000XU<br>
&gt; &gt; z000XU0RWnu7ytkO2XskIMF-pg859yTWl~)@000KnNkl&lt;ZSi`MY&#43;mh=3Dl=
4h1B@j?;Vp<br>
&gt; &gt; z&gt;r~C#{PdYlVhp;R2PK4doYbCEL-j*f%te=3D_#S;EM|Na*MoK7bnf^%-$wyhN=
BoO5nj<br>
&gt; &gt; z&amp;Vb;K#()3%%Y7VqnsUyszpKdi_jjM8s&amp;(5wpVddJZC!8Zy&#43;19B_x=
`?1&amp;cTOuy*cN$<br>
&gt; &gt; zt(&lt;WAutf&#43;V=3DLr#f2u$2st&#43;jT`4wr1(X8&#43;9dDW&#43;%^hY-=
x%Qc8&#43;3035nn%Icg8IZxeO<br>
&gt; &gt; z8!^QgqjQdks8L_A-fs8*Rh@Gw=3DjD8kDOz#&gt;VVdW8KHcNdnoS!A6Prsh#&#4=
3;agW&amp;U-)4<br>
&gt; &gt; zr_&lt;@a%6oskUh7tO3x)Z1yV-^zMtpT&gt;nrCxkU2no{v1zSYgj8gnPt&amp;w=
_)x4di*}UrL<br>
&gt; &gt; z8cx05_n)S5$rw~sEoHrYf4AD0n2Ad%*Xxy;Z30?^cEfugW308R&gt;h*d}Ik(oFb=
JSYS<br>
&gt; &gt; zIRG3c&amp;PK|Ks1cEcGw19&gt;XtkBHT99Ilhll=3DfPsEV&lt;I`G{Z#Arv3(d=
vm7W&gt;x3CJ2V|J<br>
&gt; &gt; z5|MMR)&#43;e&amp;ZukL&gt;w-ur&amp;^fyKfc0A4fhoI^xaE$eC__uhZ~`t&g=
t;&gt;u0Gx9WK%L4&lt;35NFp<br>
&gt; &gt; zW}-f)FZAB0n6`Q^S!}gg5%dbXTrTf&#43;1i;$&gt;snhA0Nr=3Dfg$HG&amp;dY=
O5k*{#%@0E3(%m<br>
&gt; &gt; zJuLRlr&lt;j&lt;@`w$UjSc0Xj0HG(&gt;hk%HEW%oFyq^d03%&gt;{r%24&amp;=
*&lt;pfFX&lt;F^OvMzP8G$<br>
&gt; &gt; zMw)=3DjE{Aoi&#43;g5gof)2USVpY9dE_s?#O18^&lt;I*ox0AuQ*!eG-0J!_3#q=
1rYn$s&gt;(!t<br>
&gt; &gt; zp(WILAH28xu&#43;&#43;W~V&#43;=3Dm1Q&amp;pwbM(}v=3D5pjp(4(0oYt(3Z=
LF-9xx&lt;$M&lt;AM#MyjvD*{?<br>
&gt; &gt; z#tbm?Xy2Y~hJ_Zh&gt;@zd7u!wZef7A(J2mxNI*`RD|!}x0m;2wZu7GYLZQE~sLp=
{lC#<br>
&gt; &gt; z4#&amp;&lt;pQBl&gt;y31*3^qS-o4bFV*PzFx0SA`{6e8H0|&#43;;hak;h44fh=
GmCKN#M)~1xibS1<br>
&gt; &gt; zHENx6Vodf)M2MP^kBEo}F{Q`XZf&lt;RNmc$XJHu`&lt;oXJ0NCGi%%h0H%5VQ7Z=
`M#^|uB<br>
&gt; &gt; zGBW^(-0&gt;4*oFCV&#43;a}FHD6!Q=3D!RV8XE&lt;&lt;W*G4b1atG*_5KB!n&=
gt;jsH#LnL;#pl&gt;Je?V<br>
&gt; &gt; z9mpeqoTq!)Ik(lVQ7c&gt;N3&gt;9NKT(vCA0MS51Wh=3DGT9ixXGLj{0ezki&gt=
;&lt;z7DyTs7&gt;&gt;n<br>
&gt; &gt; zAFANpMS4$&amp;54F`X*iQmERDuAez&gt;LcqHRIE9lTWwwA^eRQa?U9wVF}^*Y@=
5cyotVZr<br>
&gt; &gt; zG4neq8~|KvyVFMyf3lb!RRRDhWz#V|Jl^{c0=3DzzM)M=3DViP6oDhUCk4sW&lt;=
UP3fhzK&lt;<br>
&gt; &gt; zq*TO8K7?R;pM~qTSv4&gt;*F&amp;(xTrb{iNd78Rq0pPSOb}&lt;nV6MybFQc8#=
sBdQ1ycircl<br>
&gt; &gt; z3$-0o&amp;$_M;&lt;#4adoKj~%K-fyTU9Yc=3DMsK&gt;j_dA!o_w$2Wtefado_=
&amp;LA2w_&gt;y(&gt;!BD<br>
&gt; &gt; zQw=3Df2^Ve7B&amp;``Hce%@PUU5#{8N~7M`rILugzrV}6n(l73UB17&amp;F6}k=
6r;%wgD3^7$<br>
&gt; &gt; zWNxLb&gt;zz-%_sjX9;j`AxxD`#a&amp;-2MrP)cc!sCOd!Fb);4d3c=3De7|knd=
7Y0GX81Ws_<br>
&gt; &gt; zdVh7jUeFfwerD8b9~zB6k&gt;1A&gt;LI40O!S(`3Gu?Y1AiR&lt;wAb9W5^oJ?h=
Kh)hLibm;;<br>
&gt; &gt; zfZqFl6(7*0st@6ij{yQT&gt;hS0!^UCyhc8eJ8q#mRXp(;bm88I@ms&#43;yebyw=
&#43;;nrFbjl<br>
&gt; &gt; z5I&lt;%Iv-CV8;-R^A;TtL&gt;#;0Vl{=3D_cfu|0V_8kC*hKP)m4DeF24kKQ=3D=
$&#43;Au)eU7w?(<br>
&gt; &gt; z_|appYu9dJgh5aAy55&#43;R4*&gt;$OurTkCXL9x@mVh51skJimG|g7~7;&amp;=
CYqh(|2$IWlI<br>
&gt; &gt; zYyA1nBFsc|SM&amp;%Ne&#43;vE_6PY@G&#43;#|2$g@AC&gt;y;|&gt;Jn*H8xT=
rVMnlyb@`rik$uHDV@a<br>
&gt; &gt; z9#fxE9&gt;dXEbM3eug1!iLy~}6){GK3(?^LR&lt;k{l5`|Eq}kBk~U$1!R%h&#4=
3;DN@y-8!Gg<br>
&gt; &gt; zl;Y!gp;5DjOjTK#g@Iwm*^OwVofzXZO`V&amp;|x{gV!TkT=3D)CEFWee6WHkxb~=
2p_z3G=3D<br>
&gt; &gt; zaE*kzEXxQcK&#43;v4WlDBC6Y!;r8v$w$UWpanHQr6b0Ro&#43;&lt;5({#V02fc=
&lt;lXLHzU4q9uq<br>
&gt; &gt; zRr~9V6OKB&gt;X`V-NP}N$uvh4{35qCUeVsO`WGIQNFYHb&lt;bSGTPka;v=3DtJ=
~}O?Kh)i(<br>
&gt; &gt; zj|Uhu7E#qkt=3D4KAI_CiQI(9yte*ONvoX`03$&lt;n&lt;%l*7C3=3D6Qp#@H&l=
t;uhR(Br&gt;|HFO$<br>
&gt; &gt; kxK|L&lt;X!fG_PKy%J-z0HV3sWdKrT_o{07*qoM6N&lt;$g6D&amp;ck^lez<br>
&gt; &gt; <br>
&gt; &gt; literal 0<br>
&gt; &gt; HcmV?d00001<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/profile b=
/meta-arago-extras/recipes-graphics/wayland/profile<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..69564f2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/prof=
ile<br>
&gt; &gt; @@ -0,0 &#43;1,9 @@<br>
&gt; &gt; &#43;if test -z &quot;${XDG_RUNTIME_DIR}&quot;; then<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; export XDG_RUNTIME_DIR=3D/tmp/${UID}-runt=
ime-dir<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; if ! test -d &quot;${XDG_RUNTIME_DIR}&quo=
t;; then<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir &quot;${XDG=
_RUNTIME_DIR}&quot;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; chmod 0700 &quot;=
${XDG_RUNTIME_DIR}&quot;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp; fi<br>
&gt; &gt; &#43;else <br>
&gt; &gt; &#43;&nbsp;&nbsp; echo &quot;Doing nothing&quot;<br>
&gt; &gt; &#43;fi<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/terminal.=
png b/meta-arago-extras/recipes-graphics/wayland/terminal.png<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000000000000000000000000000000000000..3c02dd2100aa31389=
ace70cbf649215a982674b2<br>
&gt; &gt; GIT binary patch<br>
&gt; &gt; literal 1005<br>
&gt; &gt; zcmV&lt;J0}}j&#43;P)&lt;h;3K|Lk000e1NJLTq000;O000;W1^@s6;CDUv0000=
4b3#c}2nYxW<br>
&gt; &gt; zd&lt;bNS00009a7bBm000fw000fw0YWI7cmMzZ8FWQhbW?9;ba!ELWdL_~cP?peY=
ja~^<br>
&gt; &gt; zaAhuUa%Y?FJQ@H101k9TSaeirbZlh&#43;RAq8)X&gt;MU`)%&amp;240000NbVX=
QnL3MO!Z*l-k<br>
&gt; &gt; zVQ_CCLt$)TZDDR?a%E}Xks2xh001d;MObu1WpiV4X&gt;fFDZ*BlWVRL0&lt;Aa7=
&lt;MN?~ht<br>
&gt; &gt; zVjxp=3DWod3@awl^jcW-iQC(|dH0008`Nkl&lt;ZNQu3aJ#QRk6osGnV|J6^*!u-=
G4F&lt;Ug<br>
&gt; &gt; z73p`8V);klAd!Ls(I5)`1_h!-6i7fpD&amp;z&lt;uf-S*&#43;NEDPHAt8hViDO=
&amp;q-I;gh{kRnS<br>
&gt; &gt; z;ay^&amp;@P;$G(u_27&amp;fIg)dzFarETNw%`~M&#43;e0p5A{?XO~t&#43;lw=
SN#@zh$lh3YOfEeTU<br>
&gt; &gt; z`|o`~mSs&lt;swRY~_7(&lt;K^@BOqw2y@R&gt;Rq@fsA8rFv0hCf)&#43;uB;l-=
~X_;M~o2|Ta;2_<br>
&gt; &gt; zlBOq*9!&#43;1=3DTBDSr_j-@UN`pMldGPZC9_~M&#43;exXjU&#43;rv3Wzu#v#=
95NgZao&amp;?sBBgY;<br>
&gt; &gt; zz)E9&lt;8*kmfImgbeTPOvqt7~YjP(~v_tJCJyD_6L@vW&amp;470HrlbE8OAHoP=
Zu#bShAJ<br>
&gt; &gt; z&amp;*xu$!E0Bqa{Kmopf!S!JICY42joS8HimZRd5WSSAD43l!#oE-M2PWk9Zb&#=
43;{wdi%b<br>
&gt; &gt; zbh};d&#43;`Y@%i)&amp;=3DH8UpwfXm#4GzqC%RUPD9(DG^g7N&#43;OC-xRP1U=
r!4XzaCm&amp;o8*g66<br>
&gt; &gt; z2T!Nn=3D43FS@}9$^Bed2mEiEw^4souaC&gt;(j7PiHXcU`}AxqGq$n{{B7}FJ0m=
}qj_ax<br>
&gt; &gt; zgLbn;?s5(epU`P{u(b&gt;ku(cXljMUQw;&#43;W7C?re*uGYB4wV3c5#;pO#p8j=
U8-72Laj<br>
&gt; &gt; zA8if&amp;lRm!klvPDpI*L4}sz&amp;GG%nnkDGbw6}4wSW6W4QCvJrqz@6{|0-l=
4TjuXcCYy<br>
&gt; &gt; z`o`Fd7y=3D;#PLBIyfthnKYmxUAGIN~_1{h;7#!&amp;hSS32T2hA~EB3{&amp;#=
p{eP$E^71m7<br>
&gt; &gt; zwU{i!&amp;a4M*G&#43;OIvLQ)(FOo*fR_z?K&gt;_dotUMP*r%M6iIU)3RE@*pe=
hdNRbc&amp;A&amp;mEt<br>
&gt; &gt; z_xP&amp;%rx~0I{PxSQoELKfN-4Fubq#=3DTc6QE9J`tFmL6%ZtcW;-&gt;W(yJU=
VYKj&#43;QpN(c<br>
&gt; &gt; zs;qw8-TQuXA?#y_$hUx1z(rsK*aQrq&amp;dUvW;A`MOjY(@jeF5YXB%lC-5)qVA=
YJubv<br>
&gt; &gt; bh=3D|Bv8b1-Z;i*mk00000NkvXXu0mjftX;i`<br>
&gt; &gt; <br>
&gt; &gt; literal 0<br>
&gt; &gt; HcmV?d00001<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.de=
sktop b/meta-arago-extras/recipes-graphics/wayland/weston.desktop<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..8d4dca8<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/west=
on.desktop<br>
&gt; &gt; @@ -0,0 &#43;1,91 @@<br>
&gt; &gt; &#43;&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transit=
ional//EN&quot;<br>
&gt; &gt; &#43;&nbsp; &quot;<a href=3D"http://www.w3.org/TR/xhtml1/DTD/xhtm=
l1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dt=
d</a>&quot;&gt;<br>
&gt; &gt; &#43;&lt;html xmlns=3D'<a href=3D"http://www.w3.org/1999/xhtml">h=
ttp://www.w3.org/1999/xhtml</a>' xml:lang=3D'en' lang=3D'en'&gt;<br>
&gt; &gt; &#43;&lt;head&gt;<br>
&gt; &gt; &#43;&lt;title&gt;poky - Poky Build Tool and Metadata&lt;/title&g=
t;<br>
&gt; &gt; &#43;&lt;meta name=3D'generator' content=3D'cgit v0.9.1'/&gt;<br>
&gt; &gt; &#43;&lt;meta name=3D'robots' content=3D'index, nofollow'/&gt;<br=
>
&gt; &gt; &#43;&lt;link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit/=
cgit.css'/&gt;<br>
&gt; &gt; &#43;&lt;link rel=3D'shortcut icon' href=3D'/favicon.ico'/&gt;<br=
>
&gt; &gt; &#43;&lt;link rel=3D'alternate' title=3D'Atom feed' href=3D'<a hr=
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/atom/meta/recipes-grap=
hics/wayland/weston/weston.desktop?h=3Dmaster">http://git.yoctoproject.org/=
cgit/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/weston.desktop=
?h=3Dmaster</a>'
 type=3D'application/atom&#43;xml'/&gt;<br>
&gt; &gt; &#43;&lt;/head&gt;<br>
&gt; &gt; &#43;&lt;body&gt;<br>
&gt; &gt; &#43;&lt;div id=3D'cgit'&gt;&lt;table id=3D'header'&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;<br>
&gt; &gt; &#43;&lt;td class=3D'logo' rowspan=3D'2'&gt;&lt;a href=3D'/cgit/c=
git.cgi/'&gt;&lt;img src=3D'/cgit/yocto-project-transp.png' alt=3D'cgit log=
o'/&gt;&lt;/a&gt;&lt;/td&gt;<br>
&gt; &gt; &#43;&lt;td class=3D'main'&gt;&lt;a href=3D'/cgit/cgit.cgi/'&gt;i=
ndex&lt;/a&gt; : &lt;a title=3D'poky' href=3D'/cgit/cgit.cgi/poky/'&gt;poky=
&lt;/a&gt;&lt;/td&gt;&lt;td class=3D'form'&gt;&lt;form method=3D'get' actio=
n=3D''&gt;<br>
&gt; &gt; &#43;&lt;select name=3D'h' onchange=3D'this.form.submit();'&gt;<b=
r>
&gt; &gt; &#43;&lt;option value=3D'1.1_M1'&gt;1.1_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M2'&gt;1.1_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M3'&gt;1.1_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M4'&gt;1.1_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M1'&gt;1.2_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M2'&gt;1.2_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M3'&gt;1.2_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M4'&gt;1.2_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M1'&gt;1.3_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M2'&gt;1.3_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M3'&gt;1.3_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M4'&gt;1.3_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M5'&gt;1.3_M5&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_beta'&gt;1.3_beta&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M1'&gt;1.4_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M3'&gt;1.4_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M4'&gt;1.4_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M5'&gt;1.4_M5&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'bernard'&gt;bernard&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'blinky'&gt;blinky&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'clyde'&gt;clyde&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'danny'&gt;danny&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'danny-next'&gt;danny-next&lt;/option&gt;=
<br>
&gt; &gt; &#43;&lt;option value=3D'denzil'&gt;denzil&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'dylan'&gt;dylan&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'edison'&gt;edison&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'elroy'&gt;elroy&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'green'&gt;green&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'laverne'&gt;laverne&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'master' selected=3D'selected'&gt;master&=
lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'master-next'&gt;master-next&lt;/option&g=
t;<br>
&gt; &gt; &#43;&lt;option value=3D'pinky'&gt;pinky&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'purple'&gt;purple&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;/select&gt; &lt;input type=3D'submit' name=3D'' value=3D=
'switch'/&gt;&lt;/form&gt;&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'sub'&gt;Poky Build Tool and Metada=
ta&lt;/td&gt;&lt;td class=3D'sub right'&gt;git repository hosting&lt;/td&gt=
;&lt;/tr&gt;&lt;/table&gt;<br>
&gt; &gt; &#43;&lt;table class=3D'tabs'&gt;&lt;tr&gt;&lt;td&gt;<br>
&gt; &gt; &#43;&lt;a href=3D'/cgit/cgit.cgi/poky/'&gt;summary&lt;/a&gt;&lt;=
a href=3D'/cgit/cgit.cgi/poky/refs/'&gt;refs&lt;/a&gt;&lt;a href=3D'/cgit/c=
git.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.desktop'&gt;lo=
g&lt;/a&gt;&lt;a class=3D'active' href=3D'/cgit/cgit.cgi/poky/tree/meta/rec=
ipes-graphics/wayland/weston/weston.desktop'&gt;tree&lt;/a&gt;&lt;a
 href=3D'/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/weston/we=
ston.desktop'&gt;commit&lt;/a&gt;&lt;a href=3D'/cgit/cgit.cgi/poky/diff/met=
a/recipes-graphics/wayland/weston/weston.desktop'&gt;diff&lt;/a&gt;&lt;a hr=
ef=3D'/cgit/cgit.cgi/poky/stats/meta/recipes-graphics/wayland/weston/weston=
.desktop'&gt;stats&lt;/a&gt;&lt;/td&gt;&lt;td
 class=3D'form'&gt;&lt;form class=3D'right' method=3D'get' action=3D'/cgit/=
cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.desktop'&gt;<=
br>
&gt; &gt; &#43;&lt;select name=3D'qt'&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'grep'&gt;log msg&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'author'&gt;author&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'committer'&gt;committer&lt;/option&gt;<b=
r>
&gt; &gt; &#43;&lt;option value=3D'range'&gt;range&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;/select&gt;<br>
&gt; &gt; &#43;&lt;input class=3D'txt' type=3D'text' size=3D'10' name=3D'q'=
 value=3D''/&gt;<br>
&gt; &gt; &#43;&lt;input type=3D'submit' value=3D'search'/&gt;<br>
&gt; &gt; &#43;&lt;/form&gt;<br>
&gt; &gt; &#43;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;<br>
&gt; &gt; &#43;&lt;div class=3D'path'&gt;path: &lt;a href=3D'/cgit/cgit.cgi=
/poky/tree/'&gt;root&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta'=
&gt;meta&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-grap=
hics'&gt;recipes-graphics&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/=
meta/recipes-graphics/wayland'&gt;wayland&lt;/a&gt;/&lt;a
 href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'&gt;=
weston&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphi=
cs/wayland/weston/weston.desktop'&gt;weston.desktop&lt;/a&gt;&lt;/div&gt;&l=
t;div class=3D'content'&gt;blob: 1086ae8bf6558c06fe9a498bd093a24613fa5507
 (&lt;a href=3D'/cgit/cgit.cgi/poky/plain/meta/recipes-graphics/wayland/wes=
ton/weston.desktop'&gt;plain&lt;/a&gt;)<br>
&gt; &gt; &#43;&lt;table summary=3D'blob content' class=3D'blob'&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'linenumbers'&gt;&lt;pre&gt;&lt;a c=
lass=3D'no' id=3D'n1' name=3D'n1' href=3D'#n1'&gt;1&lt;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n2' name=3D'n2' href=3D'#n2'&gt;2&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n3' name=3D'n3' href=3D'#n3'&gt;3&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n4' name=3D'n4' href=3D'#n4'&gt;4&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n5' name=3D'n5' href=3D'#n5'&gt;5&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n6' name=3D'n6' href=3D'#n6'&gt;6&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n7' name=3D'n7' href=3D'#n7'&gt;7&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n8' name=3D'n8' href=3D'#n8'&gt;8&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;a class=3D'no' id=3D'n9' name=3D'n9' href=3D'#n9'&gt;9&l=
t;/a&gt;<br>
&gt; &gt; &#43;&lt;/pre&gt;&lt;/td&gt;<br>
&gt; &gt; &#43;&lt;td class=3D'lines'&gt;&lt;pre&gt;&lt;code&gt;[Desktop En=
try]<br>
&gt; &gt; &#43;Encoding=3DUTF-8<br>
&gt; &gt; &#43;Type=3DApplication<br>
&gt; &gt; &#43;Name=3DWeston<br>
&gt; &gt; &#43;Comment=3DWayland Compostitor<br>
&gt; &gt; &#43;Exec=3Dweston<br>
&gt; &gt; &#43;Icon=3Dweston<br>
&gt; &gt; &#43;Terminal=3Dfalse<br>
&gt; &gt; &#43;Categories=3DUtility;<br>
&gt; &gt; &#43;&lt;/code&gt;&lt;/pre&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt=
;<br>
&gt; &gt; &#43;&lt;/div&gt; &lt;!-- class=3Dcontent --&gt;<br>
&gt; &gt; &#43;&lt;div class=3D'footer'&gt;generated&nbsp; by cgit v0.9.1 a=
t 2013-09-17 12:41:43 (GMT)&lt;/div&gt;<br>
&gt; &gt; &#43;&lt;/div&gt; &lt;!-- id=3Dcgit --&gt;<br>
&gt; &gt; &#43;&lt;/body&gt;<br>
&gt; &gt; &#43;&lt;/html&gt;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/weston.pn=
g b/meta-arago-extras/recipes-graphics/wayland/weston.png<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..1c01c90<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/west=
on.png<br>
&gt; &gt; @@ -0,0 &#43;1,147 @@<br>
&gt; &gt; &#43;&lt;!DOCTYPE html PUBLIC &quot;-//W3C//DTD XHTML 1.0 Transit=
ional//EN&quot;<br>
&gt; &gt; &#43;&nbsp; &quot;<a href=3D"http://www.w3.org/TR/xhtml1/DTD/xhtm=
l1-transitional.dtd">http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dt=
d</a>&quot;&gt;<br>
&gt; &gt; &#43;&lt;html xmlns=3D'<a href=3D"http://www.w3.org/1999/xhtml">h=
ttp://www.w3.org/1999/xhtml</a>' xml:lang=3D'en' lang=3D'en'&gt;<br>
&gt; &gt; &#43;&lt;head&gt;<br>
&gt; &gt; &#43;&lt;title&gt;poky - Poky Build Tool and Metadata&lt;/title&g=
t;<br>
&gt; &gt; &#43;&lt;meta name=3D'generator' content=3D'cgit v0.9.1'/&gt;<br>
&gt; &gt; &#43;&lt;meta name=3D'robots' content=3D'index, nofollow'/&gt;<br=
>
&gt; &gt; &#43;&lt;link rel=3D'stylesheet' type=3D'text/css' href=3D'/cgit/=
cgit.css'/&gt;<br>
&gt; &gt; &#43;&lt;link rel=3D'shortcut icon' href=3D'/favicon.ico'/&gt;<br=
>
&gt; &gt; &#43;&lt;link rel=3D'alternate' title=3D'Atom feed' href=3D'<a hr=
ef=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky/atom/meta/recipes-grap=
hics/wayland/weston/weston.png?h=3Dmaster">http://git.yoctoproject.org/cgit=
/cgit.cgi/poky/atom/meta/recipes-graphics/wayland/weston/weston.png?h=3Dmas=
ter</a>'
 type=3D'application/atom&#43;xml'/&gt;<br>
&gt; &gt; &#43;&lt;/head&gt;<br>
&gt; &gt; &#43;&lt;body&gt;<br>
&gt; &gt; &#43;&lt;div id=3D'cgit'&gt;&lt;table id=3D'header'&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;<br>
&gt; &gt; &#43;&lt;td class=3D'logo' rowspan=3D'2'&gt;&lt;a href=3D'/cgit/c=
git.cgi/'&gt;&lt;img src=3D'/cgit/yocto-project-transp.png' alt=3D'cgit log=
o'/&gt;&lt;/a&gt;&lt;/td&gt;<br>
&gt; &gt; &#43;&lt;td class=3D'main'&gt;&lt;a href=3D'/cgit/cgit.cgi/'&gt;i=
ndex&lt;/a&gt; : &lt;a title=3D'poky' href=3D'/cgit/cgit.cgi/poky/'&gt;poky=
&lt;/a&gt;&lt;/td&gt;&lt;td class=3D'form'&gt;&lt;form method=3D'get' actio=
n=3D''&gt;<br>
&gt; &gt; &#43;&lt;select name=3D'h' onchange=3D'this.form.submit();'&gt;<b=
r>
&gt; &gt; &#43;&lt;option value=3D'1.1_M1'&gt;1.1_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M2'&gt;1.1_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M3'&gt;1.1_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.1_M4'&gt;1.1_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M1'&gt;1.2_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M2'&gt;1.2_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M3'&gt;1.2_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.2_M4'&gt;1.2_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M1'&gt;1.3_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M2'&gt;1.3_M2&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M3'&gt;1.3_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M4'&gt;1.3_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_M5'&gt;1.3_M5&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.3_beta'&gt;1.3_beta&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M1'&gt;1.4_M1&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M3'&gt;1.4_M3&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M4'&gt;1.4_M4&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'1.4_M5'&gt;1.4_M5&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'bernard'&gt;bernard&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'blinky'&gt;blinky&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'clyde'&gt;clyde&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'danny'&gt;danny&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'danny-next'&gt;danny-next&lt;/option&gt;=
<br>
&gt; &gt; &#43;&lt;option value=3D'denzil'&gt;denzil&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'dylan'&gt;dylan&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'edison'&gt;edison&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'elroy'&gt;elroy&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'green'&gt;green&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'laverne'&gt;laverne&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'master' selected=3D'selected'&gt;master&=
lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'master-next'&gt;master-next&lt;/option&g=
t;<br>
&gt; &gt; &#43;&lt;option value=3D'pinky'&gt;pinky&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'purple'&gt;purple&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;/select&gt; &lt;input type=3D'submit' name=3D'' value=3D=
'switch'/&gt;&lt;/form&gt;&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'sub'&gt;Poky Build Tool and Metada=
ta&lt;/td&gt;&lt;td class=3D'sub right'&gt;git repository hosting&lt;/td&gt=
;&lt;/tr&gt;&lt;/table&gt;<br>
&gt; &gt; &#43;&lt;table class=3D'tabs'&gt;&lt;tr&gt;&lt;td&gt;<br>
&gt; &gt; &#43;&lt;a href=3D'/cgit/cgit.cgi/poky/'&gt;summary&lt;/a&gt;&lt;=
a href=3D'/cgit/cgit.cgi/poky/refs/'&gt;refs&lt;/a&gt;&lt;a href=3D'/cgit/c=
git.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.png'&gt;log&lt=
;/a&gt;&lt;a class=3D'active' href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes=
-graphics/wayland/weston/weston.png'&gt;tree&lt;/a&gt;&lt;a
 href=3D'/cgit/cgit.cgi/poky/commit/meta/recipes-graphics/wayland/weston/we=
ston.png'&gt;commit&lt;/a&gt;&lt;a href=3D'/cgit/cgit.cgi/poky/diff/meta/re=
cipes-graphics/wayland/weston/weston.png'&gt;diff&lt;/a&gt;&lt;a href=3D'/c=
git/cgit.cgi/poky/stats/meta/recipes-graphics/wayland/weston/weston.png'&gt=
;stats&lt;/a&gt;&lt;/td&gt;&lt;td
 class=3D'form'&gt;&lt;form class=3D'right' method=3D'get' action=3D'/cgit/=
cgit.cgi/poky/log/meta/recipes-graphics/wayland/weston/weston.png'&gt;<br>
&gt; &gt; &#43;&lt;select name=3D'qt'&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'grep'&gt;log msg&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'author'&gt;author&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;option value=3D'committer'&gt;committer&lt;/option&gt;<b=
r>
&gt; &gt; &#43;&lt;option value=3D'range'&gt;range&lt;/option&gt;<br>
&gt; &gt; &#43;&lt;/select&gt;<br>
&gt; &gt; &#43;&lt;input class=3D'txt' type=3D'text' size=3D'10' name=3D'q'=
 value=3D''/&gt;<br>
&gt; &gt; &#43;&lt;input type=3D'submit' value=3D'search'/&gt;<br>
&gt; &gt; &#43;&lt;/form&gt;<br>
&gt; &gt; &#43;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;<br>
&gt; &gt; &#43;&lt;div class=3D'path'&gt;path: &lt;a href=3D'/cgit/cgit.cgi=
/poky/tree/'&gt;root&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta'=
&gt;meta&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-grap=
hics'&gt;recipes-graphics&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/=
meta/recipes-graphics/wayland'&gt;wayland&lt;/a&gt;/&lt;a
 href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphics/wayland/weston'&gt;=
weston&lt;/a&gt;/&lt;a href=3D'/cgit/cgit.cgi/poky/tree/meta/recipes-graphi=
cs/wayland/weston/weston.png'&gt;weston.png&lt;/a&gt;&lt;/div&gt;&lt;div cl=
ass=3D'content'&gt;blob: ea8b7e0e233c86301a88e5bc925f09b3de2f9dec (&lt;a hr=
ef=3D'/cgit/cgit.cgi/poky/plain/meta/recipes-graphics/wayland/weston/weston=
.png'&gt;plain&lt;/a&gt;)<br>
&gt; &gt; &#43;&lt;table summary=3D'blob content' class=3D'bin-blob'&gt;<br=
>
&gt; &gt; &#43;&lt;tr&gt;&lt;th&gt;ofs&lt;/th&gt;&lt;th&gt;hex dump&lt;/th&=
gt;&lt;th&gt;ascii&lt;/th&gt;&lt;/tr&gt;&lt;tr&gt;&lt;td class=3D'right'&gt=
;0000&lt;/td&gt;&lt;td class=3D'hex'&gt; 89 50 4e 47 0d 0a 1a 0a 00 00 00 0=
d 49 48 44 52&nbsp;&nbsp;&nbsp; 00 00 00 25 00 00 00 30 08 06 00 00 00 96 8=
5 b3 &lt;/td&gt;&lt;td class=3D'hex'&gt;.PNG........IHDR...%...0........&lt=
;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0020&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 2b 00 00 00 04 67 41 4d 41 00 00 b1 8f 0b fc 61&nbsp;&nbsp;=
&nbsp; 05 00 00 00 01 73 52 47 42 00 ae ce 1c e9 00 00 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;&#43;....gAMA......a.....sRGB.......&lt;/td&gt;&lt;/tr&gt;<b=
r>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0040&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 00 20 63 48 52 4d 00 00 7a 26 00 00 80 84 00 00&nbsp;&nbsp;=
&nbsp; fa 00 00 00 80 e8 00 00 75 30 00 00 ea 60 00 00 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..cHRM..z&amp;amp;..............u0...`..&lt;/td&gt;&lt;/tr&g=
t;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0060&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 3a 98 00 00 17 70 9c ba 51 3c 00 00 00 06 62 4b&nbsp;&nbsp;=
&nbsp; 47 44 00 ff 00 ff 00 ff a0 bd a7 93 00 00 00 09 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;:....p..Q&amp;lt;....bKGD..............&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0080&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 70 48 59 73 00 00 06 5a 00 00 06 5a 01 60 79 c1&nbsp;&nbsp;=
&nbsp; 63 00 00 08 1f 49 44 41 54 58 c3 ed 98 59 6c 5c &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;pHYs...Z...Z.`y.c....IDATX...Yl\&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;00a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 57 19 c7 7f e7 de 59 6c 8f 77 3b b6 53 37 4e 42&nbsp;&nbsp;=
&nbsp; 52 a2 38 4d 23 a5 01 b7 d0 36 05 85 b6 34 05 5a &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;W.....Yl.w;.S7NBR.8M#....6...4.Z&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;00c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; a4 aa 08 85 4d e2 05 89 07 88 04 3c a0 96 b2 54&nbsp;&nbsp;=
&nbsp; 42 28 b4 f0 50 40 55 29 12 95 8a 04 88 48 28 11 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;....M......&amp;lt;...TB(..P@U).....H(.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;00e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 4e 1a 53 4a 5d 96 94 24 34 4d 4b 63 37 bb e3 24&nbsp;&nbsp;=
&nbsp; 8e b7 f1 78 16 cf 9d 7b 0f 0f df 5d 67 ee c4 15 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;N.SJ]..$4MKc7..$...x...{...]g...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0100&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 52 79 ca 27 8d e6 de 73 cf f9 be ff f9 7f cb 59&nbsp;&nbsp;=
&nbsp; e0 3d 16 ad b5 f7 6b d7 5a 9b 5a eb 65 c7 a8 ff &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;Ry.'...s.......Y.=3D....k.Z.Z.e...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0120&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 07 a8 88 41 f5 9e 9b bc 2e d7 e5 ba fc cf 52 93&nbsp;&nbsp;=
&nbsp; 9f cb a5 b0 3e e4 3f 36 00 3d 40 3f d0 07 34 03 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...A..........R.....&amp;gt;.?6.=3D@?..4.&lt;/td&gt;&lt;/tr&=
gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0140&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 06 50 00 a6 81 09 e0 32 90 03 50 3b 7c dd 69 c0&nbsp;&nbsp;=
&nbsp; 02 9c 7a e5 21 d2 ea 0e 5a 07 b4 01 47 c3 a0 f4 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.P.....2..P;|.i...z.!...Z...G...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0160&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 01 a0 40 92 26 36 a2 b8 07 83 ed c0 20 9a 2e a0&nbsp;&nbsp;=
&nbsp; 09 45 c2 d5 67 03 45 20 0b bc 03 fc 1d a3 71 98 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..@.&amp;amp;6...........E..g.E.......q.&lt;/td&gt;&lt;/tr&g=
t;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0180&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d6 6d 47 50 e6 22 5b 5f 4a 02 15 40 03 19 d7 de&nbsp;&nbsp;=
&nbsp; 19 20 e7 d9 52 5a eb 04 e0 b8 3f 80 0f b8 b3 7b &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.mGP.&quot;[_J..@........RZ....?....{&lt;/td&gt;&lt;/tr&gt;<=
br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;01a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 1b 58 05 ac c0 5e b4 98 fc e5 6a a6 f6 3e 88 93&nbsp;&nbsp;=
&nbsp; bf 1f cc 3e f2 6f 2a d0 d0 b0 06 54 12 ac 29 58 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.X...^....j..&amp;gt;.....&amp;gt;.o*....T..)X&lt;/td&gt;&lt=
;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;01c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 9a 8c f7 47 b2 33 8b d1 30 4a 69 f2 59 14 07 d8&nbsp;&nbsp;=
&nbsp; b2 af 48 f7 ce 15 c0 93 c0 7d c0 b7 81 67 3c 12 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...G.3..0Ji.Y.....H......}...g&amp;lt;.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;01e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 94 d6 fa 71 e0 37 c0 c9 10 7b 1a b8 09 78 9e 4a&nbsp;&nbsp;=
&nbsp; 6e 8e e3 9f 9a a3 74 f6 01 9c 72 0b 66 0b 24 da &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...q.7...{...x.Jn.....t...r.f.$.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0200&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 60 f1 b8 cc 23 dd 0f 2a 01 d6 2c 58 d3 d7 88 12&nbsp;&nbsp;=
&nbsp; 0d 90 07 f6 b2 c4 13 dc af d7 02 7f 70 c3 60 0f &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;`...#..*..,X................p.`.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0220&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; f0 0d 0f 54 02 78 0d 98 f4 1a 74 10 54 9f 06 86&nbsp;&nbsp;=
&nbsp; 30 12 36 a9 5e 98 7d c9 0c 74 87 1c 5f 38 5d 15 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...T.x....t.T...0.6.^.}..t.._8].&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0240&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 08 0a d2 7d 50 9e 06 6d 79 81 e1 7d cc 00 bb 48&nbsp;&nbsp;=
&nbsp; b1 85 4b bf 1e 67 e5 e7 d3 6e fb 54 78 0a 06 70 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...}P..my..}...H..K..g...n.Tx..p&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0260&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 30 ec 4f 46 57 81 52 e0 2c ad 97 1e 8d 26 03 5f&nbsp;&nbsp;=
&nbsp; 33 49 f7 05 c6 c3 91 e8 bf 2b 30 1a 85 b5 28 90 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;0.OFW.R.,....&amp;amp;._3I.......&#43;0...(.&lt;/td&gt;&lt;/=
tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0280&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 38 d9 4c f9 f2 43 a1 18 f4 49 f1 40 59 80 a1 b5&nbsp;&nbsp;=
&nbsp; 96 cc 5a ba 08 2f b2 8d 99 e1 bb 7c 15 2d b7 42 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;8.L..C...I.@Y.....Z../.....|.-.B&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;02a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d7 bd b5 76 74 88 a2 d4 0a 68 be 19 94 01 4b 97&nbsp;&nbsp;=
&nbsp; 40 57 ea 43 52 40 b2 cb 9b 5a 19 f4 64 58 b9 01 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...vt....h....K.@W.CR@...Z..dX..&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;02c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 98 2e ad 9e a5 55 c0 93 2c be f1 fe 40 49 02 7a&nbsp;&nbsp;=
&nbsp; 3f 03 4d eb 43 8a 4d 68 bf 0d da 86 dc 98 9a 86 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.....U..,...@I.z?.M.C.Mh........&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;02e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; dc 51 70 96 58 56 cc 26 68 18 90 67 67 c9 20 77&nbsp;&nbsp;=
&nbsp; 6c 15 28 f4 fc ab 3e 28 1b 58 64 44 01 a4 80 6f &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.Qp.XV.&amp;amp;h..gg..wl.(...&amp;gt;(.XdD...o&lt;/td&gt;&l=
t;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0300&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 01 77 52 3c 1d 75 41 eb ad 90 ec 0c c5 94 09 f6&nbsp;&nbsp;=
&nbsp; 22 e4 ff 23 ac 68 07 b4 ed 4e b5 51 12 c0 9f 80 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.wR&amp;lt;.uA.........&quot;..#.h...N.Q....&lt;/td&gt;&lt;/=
tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0320&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 01 66 63 c0 6e 66 33 b4 6c 95 77 6b 26 cd a9 47&nbsp;&nbsp;=
&nbsp; bf c2 b0 ea e7 c8 76 19 ae 94 82 11 e5 99 ba 07 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.fc.nf3.l.wk&amp;amp;..G......v.........&lt;/td&gt;&lt;/tr&g=
t;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0340&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d8 05 40 e9 1c d8 f9 40 71 a2 13 56 ee 82 96 2d&nbsp;&nbsp;=
&nbsp; ee 0c cb 90 3b 01 95 6c 2d 13 ba 2c d9 e8 bf 6b &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..@....@q..V...-....;..l-..,...k&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0360&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 70 ac e0 bd eb 5e 48 76 c9 f3 ec 08 cc be 38 44&nbsp;&nbsp;=
&nbsp; 92 2f a3 2b 4a 1f 12 a6 7c 2e 80 af 22 85 13 96 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;p....^Hv......8D./.&#43;J...|...&quot;...&lt;/td&gt;&lt;/tr&=
gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0380&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 2e 44 0d 2a 13 7a 1e 86 44 73 6d 06 fa 2f 6e 83&nbsp;&nbsp;=
&nbsp; b6 c1 29 4a fd 6a 1b 02 23 1d c4 58 b2 0d 3a 3f &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.D.*.z..Dsm../n...)J.j..#..X..:?&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;03a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; e6 f6 b3 60 66 3f 38 96 02 be 04 0c 02 18 a1 65&nbsp;&nbsp;=
&nbsp; 63 3b 70 87 af df 9a 95 80 0d 8b 53 82 d2 c5 5a &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...`f?8........ec;p........S...Z&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;03c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 66 1a d7 c1 4d 7b 60 e0 eb 02 c0 17 1b 0a ef 08&nbsp;&nbsp;=
&nbsp; 73 ca 14 c5 99 8d d0 bc 49 3e 97 af 42 ee 75 af &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;f...M{`.........s.......I&amp;gt;..B.u.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;03e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; f3 6a e0 11 2f a6 40 82 fd 21 c2 01 6f e7 a1 32&nbsp;&nbsp;=
&nbsp; 57 15 a0 ad 01 ed 9e 18 0d b0 ee 07 30 b0 1b d6 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.j../.@..!..o..2W...........0...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0400&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 3e 06 1d 1f 11 26 55 52 fe ad 19 89 37 65 4a 42&nbsp;&nbsp;=
&nbsp; b4 dd 01 89 0e 17 d4 65 59 09 02 c6 77 02 37 78 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;&amp;gt;....&amp;amp;UR....7eJB.......eY...w.7x&lt;/td&gt;&l=
t;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0420&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; a0 fa 7d 96 82 40 90 58 a8 06 90 ec 88 74 21 d5&nbsp;&nbsp;=
&nbsp; 2b 25 03 a4 d2 f7 7d 0e cc 06 c9 54 23 25 ec 18 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..}..@.X.....t!.&#43;%....}....T#%..&lt;/td&gt;&lt;/tr&gt;<b=
r>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0440&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 0d 02 d2 6c 86 8e a0 d2 50 18 83 ca 42 d8 c2 06&nbsp;&nbsp;=
&nbsp; e0 76 af d2 0d 02 37 46 31 d9 a0 ab d2 db 6c 10 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...l....P...B....v....7F1.....l.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0460&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 10 61 69 bf 13 1a d7 04 ef 6d b7 4b e6 e5 df 16&nbsp;&nbsp;=
&nbsp; d4 89 56 c8 6c 12 40 9d 1f 85 f6 bb 83 be d9 c3 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.ai......m.K......V.l.@.........&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0480&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; e0 54 c2 4c 65 80 bb 3c a6 36 02 8d 11 63 2a 29&nbsp;&nbsp;=
&nbsp; b4 47 a9 0a ea 0b 40 22 23 f5 4b 25 83 b6 86 7e &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.T.Le..&amp;lt;.6...c*).G....@&quot;#.K%...~&lt;/td&gt;&lt;/=
tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;04a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 61 ce 63 b9 92 83 85 c3 30 f7 67 64 dd 6c 91 76&nbsp;&nbsp;=
&nbsp; 6b 0e b2 7f 23 46 b6 7a a0 d6 d6 7e 73 c4 e7 d5 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;a.c.....0.gd.l.vk...#F.z...~s...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;04c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d2 b8 5e 96 21 8d 18 6f ff b0 db bd 2c d9 aa 52&nbsp;&nbsp;=
&nbsp; d0 fb 48 50 97 d0 c2 7a b2 13 da 6e 8b ba ae 30 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..^.!..o....,..R..HP...z...n...0&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;04e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 16 77 c8 5b 6d c8 f4 e9 8e b0 61 34 4a 65 8e ab&nbsp;&nbsp;=
&nbsp; 41 4d 1b 82 d9 76 7d 1c 12 ed f2 3c b3 0f 2e fc &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.w.[m.....a4Je..AM...v}....&amp;lt;....&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0500&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 54 9e 3b ee 86 d6 6d 41 e9 d0 40 db 87 c4 8d 9e&nbsp;&nbsp;=
&nbsp; e4 4f 40 65 3e 8e a9 4e 0f 54 e0 ba e6 4d b2 86 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;T.;...mA..@......O@e&amp;gt;..N.T...M..&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0520&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d5 5b 4f 9b d6 41 fa 46 48 f7 40 d7 7d d2 66 2f&nbsp;&nbsp;=
&nbsp; c2 c4 33 b0 70 54 6a 4f b2 13 fa 3e 0b 86 19 8c &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.[O..A.FH.@.}.f/..3.pTjO...&amp;gt;....&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0540&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 6b fd a0 04 bc 27 c5 d3 b5 89 e4 06 80 e1 ce 23&nbsp;&nbsp;=
&nbsp; 28 b7 95 05 28 8c bb 33 b4 6b 87 24 7b 84 89 ee &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;k....'.........#(...(..3.k.${...&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0560&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 4f 06 f5 26 fb 0f c8 8e 42 71 5c b6 2c 00 dd 0f&nbsp;&nbsp;=
&nbsp; 08 ab 1a 30 d3 d0 7c 4b 54 4f dd bd 17 96 b7 eb &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;O..&amp;amp;....Bq\.,......0..|KTO......&lt;/td&gt;&lt;/tr&g=
t;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0580&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 0c fc 54 3a 17 7c 2e 5f a9 1d a2 0c 58 fb a8 fb&nbsp;&nbsp;=
&nbsp; ec 06 f8 f4 7e a8 e4 a1 78 4a c0 f5 3c 2c 19 d8 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..T:.|._....X.......~...xJ..&amp;lt;,..&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;05a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; bd 13 16 df 82 f4 0d 90 19 0c 74 54 b2 90 7f ab&nbsp;&nbsp;=
&nbsp; 1e a8 9c c7 d4 f9 d8 cf a5 b3 f1 ab 7e aa 4f 7e &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..........tT................~.O~&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;05c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 1e b3 0b af b9 6e 5c 82 ab 7f 74 97 14 05 2b bf&nbsp;&nbsp;=
&nbsp; 08 4d ef 83 96 6d e2 72 df ec bf 21 77 bc de 4d &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.....n\...t...&#43;..M...m.r...!w..M&lt;/td&gt;&lt;/tr&gt;<b=
r>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;05e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; c6 84 57 a7 4e 22 9b f9 44 e4 73 f1 94 04 63 75&nbsp;&nbsp;=
&nbsp; 6d 0a 4b f9 52 94 dd dc 31 71 4d aa 4f 96 94 0d &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..W.N&quot;..D.s...cum.K.R...1qM.O...&lt;/td&gt;&lt;/tr&gt;<=
br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0600&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 4f 4b 05 37 52 51 b6 53 5d 50 5c 88 d3 f8 a6 57&nbsp;&nbsp;=
&nbsp; 12 4e 00 57 a3 6e 02 4a 13 02 ec 5a 32 f7 57 d9 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;OK.7RQ.S]P\....W.N.W.n.J...Z2.W.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0620&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 18 a6 7b e5 67 5d 0d e2 0a 25 c9 d0 36 14 1d 93&nbsp;&nbsp;=
&nbsp; d9 28 07 8e da 38 b7 80 51 0f d4 59 e0 58 4d 97 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..{.g]...%..6....(...8..Q..Y.XM.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0640&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 4a 16 b2 ff ac 0f 48 db 12 43 5a bb c5 b6 ec ae&nbsp;&nbsp;=
&nbsp; 99 b3 d7 1e 73 fe 29 98 7f 35 ce 7d 13 61 50 05 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;J.....H..CZ.........s.)..5.}.aP.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0660&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 60 1f c1 31 4b 24 d5 27 d5 d8 2e c4 1b a8 64 65&nbsp;&nbsp;=
&nbsp; 81 4e 75 09 ab d6 9c 80 ca 1d bd 06 b5 0a a9 42 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;`..1K$.'......de.Nu............B&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0680&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 4e dc c7 97 81 31 43 ed f0 1b f6 03 d1 94 70 8a&nbsp;&nbsp;=
&nbsp; e2 3e 6b 2a 5e 7f ee 08 5c f9 9d 6c 69 0c 53 ea &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;N....1C.......p..&amp;gt;k*^...\..li.S.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;06a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 90 46 36 6e 4e 31 7e 4c 79 52 4a 47 ed 1e 7e 01&nbsp;&nbsp;=
&nbsp; 78 01 b0 c2 9b bc f3 c0 af 90 ed b1 cb c4 bc 2c &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.F6nN1~LyRJG..~.x..............,&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;06c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 05 c5 b3 75 40 bd 2e 0c d9 79 99 bd 4a 08 11 0b&nbsp;&nbsp;=
&nbsp; 87 65 9b 5c e3 3a 07 ce fd 18 ae fc 36 4e db 7e &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...u@....y..J....e.\.:......6N.~&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;06e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 60 14 97 47 42 6c 3d 0f fc 25 d2 d5 ca c2 ec c1&nbsp;&nbsp;=
&nbsp; 18 1d 0e 14 42 86 b5 25 95 1d a0 3c 05 33 c3 b5 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;`..GBl=3D..%..........B..%...&amp;lt;.3..&lt;/td&gt;&lt;/tr&=
gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0700&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 43 f2 c7 61 e6 4f 71 95 fc 3c f0 14 72 dc 8f 6c&nbsp;&nbsp;=
&nbsp; 87 41 32 f0 bb 48 c0 05 32 73 50 32 2c 2c 76 b1 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;C..a.Oq..&amp;lt;..r..l.A2..H..2sP2,,v.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0720&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 7e 66 6a c4 78 78 6d 73 8a 70 6e 0f e4 4f 56 07&nbsp;&nbsp;=
&nbsp; 78 09 f8 11 72 28 46 ed 08 81 0a b1 f5 0a f0 18 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;~fj.xxms.pn..OV.x...r(F.........&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0740&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 5e 95 57 48 e0 9e f9 7e 74 43 66 4d 8b eb e2 44&nbsp;&nbsp;=
&nbsp; 21 6e 0f 7f 9f 1f 85 e9 7d d5 80 6c e0 17 48 d8 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;^.WH...~tCfM...D!n......}..l..H.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0760&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; f8 18 22 4c 55 b9 f1 3b 3e 30 34 4c 3e 07 e3 bb&nbsp;&nbsp;=
&nbsp; 83 42 99 3b 22 ec d5 bb ec b5 e6 a1 e0 5e 4f d8 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..&quot;LU..;&amp;gt;04L&amp;gt;....B.;&quot;........^O.&lt;=
/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0780&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 39 98 f8 99 84 42 20 15 e0 39 e0 7b 40 21 64 bb&nbsp;&nbsp;=
&nbsp; c6 7d 1e b0 0a f0 34 b0 1b f7 48 8d b6 04 d8 f1 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;9....B...9.{@!d..}....4...H.....&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;07a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 07 e1 ec 13 12 b0 76 89 ba e2 94 61 6e 44 fe 2f&nbsp;&nbsp;=
&nbsp; 3e 2b ee 0c 26 90 07 7e 02 7c 13 98 0b 03 f2 88 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;......v....anD./&amp;gt;&#43;..&amp;amp;..~.|......&lt;/td&g=
t;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;07c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 8e 15 f7 94 a3 90 53 ce e3 c8 1e de 8c 3f 5e d5&nbsp;&nbsp;=
&nbsp; 91 e4 0a d9 d8 cd bf 12 8e af 31 e0 87 c8 4d 4f &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;......S......?^...........1...MO&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;07e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; a9 1a d0 b2 aa 43 c7 af 1e e0 0b c8 d9 6c 43 1c&nbsp;&nbsp;=
&nbsp; c3 f5 95 f8 56 2e 01 bf 07 7e 8e dc 7d e9 38 40 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.....C.......lC.....V....~..}.8@&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0800&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; b1 a0 42 d7 8b 41 d9 1d f1 ae 55 18 00 3e e1 fe&nbsp;&nbsp;=
&nbsp; 6e 41 76 ac 89 78 d5 38 48 41 1c 03 0e 00 7b 81 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..B..A....U..&amp;gt;..nAv..x.8HA....{.&lt;/td&gt;&lt;/tr&gt=
;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0820&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 37 80 4a 3d 30 cb 81 52 40 17 30 07 d8 fe 15 e3&nbsp;&nbsp;=
&nbsp; 21 df 5c 86 d6 cd 9b 28 9e d9 80 bd b8 06 39 a2 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;7.J=3D0..R@.0.....!.\....(......9.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0840&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; b5 ba 13 59 04 ae 00 a7 91 85 7e dc d5 a3 97 03&nbsp;&nbsp;=
&nbsp; f3 6e 98 f2 af c8 6a 2e 63 a5 4f 02 b0 a9 cc 6b &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;...Y......~......n....j.c.O....k&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0860&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 5e ee f0 16 34 45 e8 aa f2 dd 82 58 16 54 0c b0&nbsp;&nbsp;=
&nbsp; 30 c0 7a 61 5e 5d a2 bd 33 97 55 d5 ae 42 3f 07 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;^...4E.....X.T..0.za^]..3.U..B?.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0880&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; d0 71 37 c4 f5 e2 01 c4 1d 83 c8 55 f4 12 e2 96&nbsp;&nbsp;=
&nbsp; 0b 40 27 72 ed dc 8a 14 bf 02 70 8e 60 4b dd 84 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.q7........U.....@'r......p.`K..&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;08a0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 64 ea 2c f0 af 90 be 0c 70 b3 3b b6 1b 18 76 c7&nbsp;&nbsp;=
&nbsp; d6 c8 7f 01 68 32 fd 92 51 5f 34 1b 00 00 00 25 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;d.,.....p.;...v.....h2..Q_4....%&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;08c0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 74 45 58 74 64 61 74 65 3a 63 72 65 61 74 65 00&nbsp;&nbsp;=
&nbsp; 32 30 31 33 2d 30 31 2d 31 36 54 31 32 3a 31 31 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;tEXtdate:create.2013-01-16T12:11&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;08e0&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 3a 33 34 2b 30 30 3a 30 30 e9 0b 13 43 00 00 00&nbsp;&nbsp;=
&nbsp; 25 74 45 58 74 64 61 74 65 3a 6d 6f 64 69 66 79 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;:34&#43;00:00...C...%tEXtdate:modify&lt;/td&gt;&lt;/tr&gt;<b=
r>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0900&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 00 32 30 31 33 2d 30 31 2d 31 36 54 31 32 3a 31&nbsp;&nbsp;=
&nbsp; 31 3a 33 31 2b 30 30 3a 30 30 ca 6e 84 58 00 00 &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;.2013-01-16T12:11:31&#43;00:00.n.X..&lt;/td&gt;&lt;/tr&gt;<b=
r>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0920&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; 00 19 74 45 58 74 53 6f 66 74 77 61 72 65 00 77&nbsp;&nbsp;=
&nbsp; 77 77 2e 69 6e 6b 73 63 61 70 65 2e 6f 72 67 9b &lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt;..tEXtSoftware.www.inkscape.org.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;tr&gt;&lt;td class=3D'right'&gt;0940&lt;/td&gt;&lt;td cl=
ass=3D'hex'&gt; ee 3c 1a 00 00 00 00 49 45 4e 44 ae 42 60 82 &lt;/td&gt;&lt=
;td class=3D'hex'&gt;.&amp;lt;.....IEND.B`.&lt;/td&gt;&lt;/tr&gt;<br>
&gt; &gt; &#43;&lt;/table&gt;<br>
&gt; &gt; &#43;&lt;/div&gt; &lt;!-- class=3Dcontent --&gt;<br>
&gt; &gt; &#43;&lt;div class=3D'footer'&gt;generated&nbsp; by cgit v0.9.1 a=
t 2013-09-17 12:41:48 (GMT)&lt;/div&gt;<br>
&gt; &gt; &#43;&lt;/div&gt; &lt;!-- id=3Dcgit --&gt;<br>
&gt; &gt; &#43;&lt;/body&gt;<br>
&gt; &gt; &#43;&lt;/html&gt;<br>
&gt; &gt; diff --git a/meta-arago-extras/recipes-graphics/wayland/weston_1.=
3.0.bb b/meta-arago-extras/recipes-graphics/wayland/weston_1.3.0.bb<br>
&gt; &gt; new file mode 100644<br>
&gt; &gt; index 0000000..61735e2<br>
&gt; &gt; --- /dev/null<br>
&gt; &gt; &#43;&#43;&#43; b/meta-arago-extras/recipes-graphics/wayland/west=
on_1.3.0.bb<br>
&gt; &gt; @@ -0,0 &#43;1,148 @@<br>
&gt; &gt; &#43;SUMMARY =3D &quot;Weston, a Wayland compositor&quot;<br>
&gt; &gt; &#43;DESCRIPTION =3D &quot;Weston is the reference implementation=
 of a Wayland compositor&quot;<br>
&gt; &gt; &#43;HOMEPAGE =3D &quot;<a href=3D"http://wayland.freedesktop.org=
">http://wayland.freedesktop.org</a>&quot;<br>
&gt; &gt; &#43;LICENSE =3D &quot;MIT&quot;<br>
&gt; &gt; &#43;LIC_FILES_CHKSUM =3D &quot;<a href=3D""></a>file://COPYING;m=
d5=3D275efac2559a224527bd4fd593d38466 \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://sr=
c/compositor.c;endline=3D23;md5=3Daa98a8db03480fe7d500d0b1f4b8850c">
file://src/compositor.c;endline=3D23;md5=3Daa98a8db03480fe7d500d0b1f4b8850c=
</a>&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;SRC_URI =3D &quot;git://anongit.freedesktop.org/wayland/west=
on;protocol=3Dgit \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://weston.png">file://weston.png</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://weston.desktop">file://weston.desktop</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://terminal.png">file://terminal.png</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://pattern.png">file://pattern.png</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://profile">file://profile</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.pa=
tch">
file://0001-compositor-drm-Change-path-of-gbm.h-to-gbm-gbm.h.patch</a> \<br=
>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 <a href=3D"file://0002-Makefile-Include-option-to-search-in-include-drm.pa=
tch">
file://0002-Makefile-Include-option-to-search-in-include-drm.patch</a> \<br=
>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0003-input-=
source-prevent-input-disable-during-repaint.patch">
file://0003-input-source-prevent-input-disable-during-repaint.patch</a> \<b=
r>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0005-temp-h=
ack-to-enable-weston-1.3.patch">file://0005-temp-hack-to-enable-weston-1.3.=
patch</a> \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href=3D"file://0006-weston=
-drm-Enable-multiple-displays.patch">file://0006-weston-drm-Enable-multiple=
-displays.patch</a> &quot;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;SRCREV =3D &quot;95659c03219b057d9d703b04cf89bc0329ce947a&qu=
ot; <br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;S =3D &quot;${WORKDIR}/git&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;PR =3D &quot;r3&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;inherit autotools pkgconfig useradd<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;DEPENDS =3D &quot;xkbcommon gdk-pixbuf pixman cairo glib-2.0=
 jpeg mtdev libpam&quot;<br>
&gt; &gt; &#43;DEPENDS &#43;=3D &quot;wayland libgbm omap5-sgx-ddk-um-linux=
 pango&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;EXTRA_OECONF =3D &quot;--disable-android-compositor \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-simple-egl-clients \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --enable-fbdev-compositor \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --enable-setuid-install \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-tablet-shell \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-xwayland \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --enable-simple-clients \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --enable-clients \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-libunwind \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-rpi-compositor \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --disable-rdp-compositor \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --prefix=3D${STAGING_DIR_TARGET} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; --with-libtool-sysroot=3D${STAGING_DIR_TARGE=
T}&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;PACKAGECONFIG ??=3D &quot;${@base_contains('DISTRO_FEATURES'=
, 'wayland', 'kms wayland', '', d)} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@base_contains('DISTRO_F=
EATURES', 'x11', 'x11', '', d)} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@base_contains('DISTRO_F=
EATURES', 'opengles2', 'gles', '', d)} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ${@base_contains('DISTRO_F=
EATURES', 'pam', 'launch', '', d)} \<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &quot;<br>
&gt; &gt; &#43;#<br>
&gt; &gt; &#43;# Compositor choices<br>
&gt; &gt; &#43;#<br>
&gt; &gt; &#43;# Weston on KMS<br>
&gt; &gt; &#43;PACKAGECONFIG[kms] =3D &quot;--enable-drm-compositor,--disab=
le-drm-compositor,drm udev libgbm mtdev&quot;<br>
&gt; &gt; &#43;# Weston on Wayland (nested Weston)<br>
&gt; &gt; &#43;PACKAGECONFIG[wayland] =3D &quot;--enable-wayland-compositor=
,--disable-wayland-compositor,libgbm&quot;<br>
&gt; &gt; &#43;# Weston on X11<br>
&gt; &gt; &#43;PACKAGECONFIG[x11] =3D &quot;--enable-x11-compositor,--disab=
le-x11-compositor,virtual/libx11 libxcb libxcb libxcursor cairo&quot;<br>
&gt; &gt; &#43;# Headless Weston<br>
&gt; &gt; &#43;PACKAGECONFIG[headless] =3D &quot;--enable-headless-composit=
or,--disable-headless-compositor&quot;<br>
&gt; &gt; &#43;# Weston on framebuffer<br>
&gt; &gt; &#43;PACKAGECONFIG[fbdev] =3D &quot;--enable-fbdev-compositor,--d=
isable-fbdev-compositor,udev mtdev&quot;<br>
&gt; &gt; &#43;# weston-launch<br>
&gt; &gt; &#43;PACKAGECONFIG[launch] =3D &quot;--enable-weston-launch,--dis=
able-weston-launch,libpam&quot;<br>
&gt; &gt; &#43;# Use cairo-gl or cairo-glesv2<br>
&gt; &gt; &#43;PACKAGECONFIG[gles] =3D &quot;--with-cairo-glesv2,,virtual/l=
ibgles2&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;do_install_append() {<br>
&gt; &gt; &#43;&nbsp;&nbsp; # Weston doesn't need the .la files to load mod=
ules, so wipe them<br>
&gt; &gt; &#43;&nbsp;&nbsp; rm -f ${D}/${libdir}/weston/*.la<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp; for feature in ${DISTRO_FEATURES}; do<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 # If X11, ship a desktop file to launch it<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 if [ &quot;$feature&quot; =3D &quot;x11&quot; ]; then<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/=
applications<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install ${WORKDIR}/weston.=
desktop ${D}${datadir}/applications<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -d ${D}${datadir}/=
icons/hicolor/48x48/apps<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install ${WORKDIR}/weston.=
png ${D}${datadir}/icons/hicolor/48x48/apps<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; fi<br>
&gt; &gt; &#43;&nbsp;&nbsp; done<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install ${WORKDIR=
}/terminal.png ${D}${datadir}/icons/hicolor/48x48/apps<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install ${WORKDIR=
}/pattern.png ${D}${datadir}/icons/hicolor/48x48/apps<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}/usr=
/bin/weston-clients<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-calibrator ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-clickdot ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-cliptest ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-dnd ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-editor ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-eventdemo ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-flower ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-fullscreen ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-image ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-keyboard ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-multi-resource ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-resizor ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-simple-egl ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-simple-im ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-simple-shm ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-simple-touch ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-smoke ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-subsurfaces ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-desktop-shell ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-info ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-screenshooter ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-tablet-shell ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-terminal ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-transformed ${D}/usr/bin/weston-clients/<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}/usr=
/libexec<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-desktop-shell ${D}/usr/libexec/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-screenshooter ${D}/usr/libexec/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/clients/w=
eston-tablet-shell ${D}/usr/libexec/<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;&nbsp;&nbsp; mkdir -p ${D}/home/root<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mkdir -p ${D}/hom=
e/root/.config<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${S}/weston.in=
i ${D}/home/root/.config/<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cp ${WORKDIR}/pro=
file ${D}/home/root/.profile<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;do_configure() {<br>
&gt; &gt; &#43;&nbsp;&nbsp; aclocal -I ${STAGING_DIR_TARGET}/usr/share/aclo=
cal<br>
&gt; &gt; &#43;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ./autogen.sh --pr=
efix=3D/usr --host=3Darm-linux --with-libtool-sysroot=3D${STAGING_DIR_TARGE=
T} --enable-weston-launch<br>
&gt; &gt; &#43;}<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;PACKAGES &#43;=3D &quot;${PN}-examples&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;FILES_${PN} =3D &quot;${bindir}/weston* ${bindir}/wcap-decod=
e ${libexecdir} ${datadir} ${libdir}/weston/* /home/root/.profile /home/roo=
t/.config/* /usr/libexec/weston-desktop-shell /usr/libexec/weston-screensho=
oter /usr/libexec/weston-tablet-shell&quot;
<br>
&gt; &gt; &#43;FILES_${PN}-examples =3D &quot;${bindir}/*&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;FILES_${PN}-dbg &#43;=3D &quot;${bindir}/weston-clients/.deb=
ug&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;RDEPENDS_${PN} &#43;=3D &quot;xkeyboard-config&quot;<br>
&gt; &gt; &#43;RRECOMMENDS_${PN} =3D &quot;liberation-fonts&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;USERADD_PACKAGES =3D &quot;${PN}&quot;<br>
&gt; &gt; &#43;GROUPADD_PARAM_${PN} =3D &quot;--system weston-launch&quot;<=
br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;INSANE_SKIP_weston &#43;=3D &quot;dev-deps&quot;<br>
&gt; &gt; &#43;<br>
&gt; &gt; &#43;FILESEXTRAPATHS_prepend :=3D &quot;${THISDIR}:&quot;<br>
&gt; &gt; -- <br>
&gt; &gt; 1.7.9.5<br>
&gt; &gt; <br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; meta-arago mailing list<br>
&gt; &gt; meta-arago@arago-project.org<br>
&gt; &gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta=
-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br=
>
&gt; _______________________________________________<br>
&gt; meta-arago mailing list<br>
&gt; meta-arago@arago-project.org<br>
&gt; <a href=3D"http://arago-project.org/cgi-bin/mailman/listinfo/meta-arag=
o">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
</div>
</span></font>
</body>
</html>

--_000_24B88602B5904F49971CAF899152529B80B3E4DBDE04entticom_--
