Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3E9F8529DD
	for <meta-arago@arago-project.org>;
	Fri, 30 Jan 2015 18:53:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t0UIrk7F020121
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:53:46 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIrj38005606
	for <meta-arago@arago-project.org>; Fri, 30 Jan 2015 12:53:45 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 30 Jan 2015 12:53:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t0UIriZ5017244;
	Fri, 30 Jan 2015 12:53:45 -0600
Date: Fri, 30 Jan 2015 13:53:44 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20150130185344.GN21328@edge>
References: <1421978253-6468-1-git-send-email-sam.nelson@ti.com>
	<1421978253-6468-2-git-send-email-sam.nelson@ti.com>
	<4F9216F96E5DF9428610502835A9F4905810CC63@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F4905810CC63@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH v2 2/2] libnl: Update recipe from 3.2.22 to 3.2.24
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
X-List-Received-Date: Fri, 30 Jan 2015 18:53:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ack

On Thu, Jan 29, 2015 at 03:52:17AM +0000, Nelson, Sam wrote:
> Ping.
> 
> > -----Original Message-----
> > From: Nelson, Sam
> > Sent: Thursday, January 22, 2015 8:58 PM
> > To: meta-arago@arago-project.org
> > Cc: Nelson, Sam
> > Subject: [PATCH v2 2/2] libnl: Update recipe from 3.2.22 to 3.2.24
> > 
> > - removed two patches already adressed in newer version
> > - Updated autotools-brokensep  to autotools
> > - Added some private files to be installed to allow libnl extensions.
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > 
> > ---
> > Changes from previous version of the patch
> > - Added some of the patches back
> > - Added update patch files
> > 
> > Planning to  send as similar patch to oe-core  as well.
> > Once accepted can be removed here
> > ---
> > ---
> >  .../{libnl-2.0 => libnl-3.2.24}/fix-pc-file.patch  |   14 +++++-----
> >  .../fix-pktloc_syntax_h-race.patch                 |   27 ++++++++++++--------
> >  .../libnl/{libnl_3.2.22.bb => libnl_3.2.24.bb}     |   15 +++++++----
> >  3 files changed, 34 insertions(+), 22 deletions(-)
> >  copy meta-arago-extras/recipes-support/libnl/{libnl-2.0 => libnl-3.2.24}/fix-
> > pc-file.patch (52%)
> >  copy meta-arago-extras/recipes-support/libnl/{libnl-2.0 => libnl-3.2.24}/fix-
> > pktloc_syntax_h-race.patch (57%)
> >  rename meta-arago-extras/recipes-support/libnl/{libnl_3.2.22.bb =>
> > libnl_3.2.24.bb} (74%)
> > 
> > diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
> > b/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
> > similarity index 52%
> > copy from meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
> > copy to meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-
> > file.patch
> > index 85afe8f..0a7f2fc 100644
> > --- a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pc-file.patch
> > +++ b/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-pc-file.patch
> > @@ -4,14 +4,14 @@ Some packages are asking only for libnl-2.0, but expects
> > to get also
> >  libnl-genl, libnl-nf libnl-route, easiest way to fix them is here.
> > 
> >  Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > -Index: libnl-2.0/libnl-2.0.pc.in
> > +Index: libnl-3.2.24/libnl-3.0.pc.in
> > 
> > ==============================================================
> > =====
> > ---- libnl-2.0.orig/libnl-2.0.pc.in
> > -+++ libnl-2.0/libnl-2.0.pc.in
> > -@@ -6,5 +6,5 @@
> > +--- libnl-3.2.24.orig/libnl-3.0.pc.in
> > ++++ libnl-3.2.24/libnl-3.0.pc.in
> > +@@ -6,5 +6,5 @@ includedir=@includedir@
> >   Name: libnl
> >   Description: Convenience library for netlink sockets
> >   Version: @PACKAGE_VERSION@
> > --Libs: -L${libdir} -lnl
> > -+Libs: -L${libdir} -lnl -lnl-genl -lnl-nf -lnl-route
> > - Cflags: -I${includedir}
> > +-Libs: -L${libdir} -lnl-@MAJ_VERSION@
> > ++Libs: -L${libdir} -lnl-@MAJ_VERSION@ -lnl-genl-@MAJ_VERSION@ -lnl-nf-
> > @MAJ_VERSION@ -lnl-route-@MAJ_VERSION@
> > + Cflags: -I${includedir}/libnl@MAJ_VERSION@
> > diff --git a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-
> > pktloc_syntax_h-race.patch b/meta-arago-extras/recipes-
> > support/libnl/libnl-3.2.24/fix-pktloc_syntax_h-race.patch
> > similarity index 57%
> > copy from meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-
> > pktloc_syntax_h-race.patch
> > copy to meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-
> > pktloc_syntax_h-race.patch
> > index ea32e82..1939ee2 100644
> > --- a/meta-arago-extras/recipes-support/libnl/libnl-2.0/fix-pktloc_syntax_h-
> > race.patch
> > +++ b/meta-arago-extras/recipes-support/libnl/libnl-3.2.24/fix-
> > pktloc_syntax_h-race.patch
> > @@ -6,24 +6,31 @@ newer version so we can assume this issue is fixed
> > upstream
> > 
> >  Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
> > 
> > -Index: libnl-2.0/lib/Makefile.am
> > +Index: libnl-3.2.24/lib/Makefile.am
> > 
> > ==============================================================
> > =====
> > ---- libnl-2.0.orig/lib/Makefile.am
> > -+++ libnl-2.0/lib/Makefile.am
> > -@@ -27,11 +27,16 @@ CLEANFILES = \
> > - 	route/pktloc_grammar.c route/pktloc_grammar.h \
> > - 	route/pktloc_syntax.c route/pktloc_syntax.h
> > +--- libnl-3.2.24.orig/lib/Makefile.am
> > ++++ libnl-3.2.24/lib/Makefile.am
> > +@@ -46,9 +46,12 @@ CLEANFILES = \
> > 
> > -+BUILT_SOURCES = route/pktloc_syntax.h route/pktloc_grammar.h
> > -+
> >   # Hack to avoid using ylwrap. It does not function correctly in combination
> >   # with --header-file=
> >  +route/pktloc.lo: route/pktloc_syntax.h route/pktloc_grammar.h
> >  +route/pktloc_grammar.h: route/pktloc_grammar.c
> >   route/pktloc_grammar.c: route/pktloc_grammar.l
> > - 	$(LEX) --header-file=route/pktloc_grammar.h $(LFLAGS) -o $@ $^
> > + 	$(AM_V_GEN) $(FLEX) --header-file=route/pktloc_grammar.h
> > $(LFLAGS) -o $@ $^
> > 
> >  +route/pktloc_syntax.h: route/pktloc_syntax.c
> >   route/pktloc_syntax.c: route/pktloc_syntax.y
> > - 	$(YACC) -d $(YFLAGS) -o $@ $^
> > + 	$(AM_V_GEN) $(YACC) -d $(YFLAGS) -o $@ $^
> > 
> > +@@ -100,7 +103,9 @@ BUILT_SOURCES = \
> > + 	route/cls/ematch_grammar.c \
> > + 	route/cls/ematch_syntax.c \
> > + 	route/pktloc_grammar.c \
> > +-	route/pktloc_syntax.c
> > ++   route/pktloc_syntax.c \
> > ++   route/pktloc_syntax.h \
> > ++   route/pktloc_grammar.h
> > +
> > + EXTRA_DIST = \
> > + 	route/pktloc_grammar.l \
> > diff --git a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb b/meta-
> > arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> > similarity index 74%
> > rename from meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
> > rename to meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> > index a299bfb..073322b 100644
> > --- a/meta-arago-extras/recipes-support/libnl/libnl_3.2.22.bb
> > +++ b/meta-arago-extras/recipes-support/libnl/libnl_3.2.24.bb
> > @@ -12,14 +12,19 @@ DEPENDS = "flex-native bison-native"
> >  SRC_URI = "http://www.infradead.org/~tgr/${BPN}/files/${BP}.tar.gz \
> >             file://fix-pktloc_syntax_h-race.patch \
> >             file://fix-pc-file.patch \
> > -           file://fix-lib-cache_mngr.c-two-parentheses-bugs.patch \
> > -           file://0001-fix-double-free-caused-by-freeing-link-af_data-in-rt.patch \
> >            "
> > 
> > -SRC_URI[md5sum] = "2e1c889494d274aca24ce5f6a748e66e"
> > -SRC_URI[sha256sum] =
> > "c7c5f267dfeae0c1a530bf96b71fb7c8dbbb07d54beef49b6712d8d6166f629b
> > "
> > +SRC_URI[md5sum] = "6e0e7bad0674749d930dd9f285343d55"
> > +SRC_URI[sha256sum] =
> > "fb8d6e5dc8af5b85bc6d00a71582a68a01e6a3f7d1664d4a646e289a99dd68
> > 16"
> > 
> > -inherit autotools-brokensep pkgconfig
> > +inherit autotools pkgconfig
> > +
> > +do_install_append() {
> > +#   Install private files to allow libnl extensions
> > +    install -d ${D}${includedir}/netlink-private
> > +    cp -r ${S}/include/netlink-private/cache-api.h ${D}${includedir}/netlink-
> > private/
> > +    cp -r ${S}/include/netlink-private/object-api.h ${D}${includedir}/netlink-
> > private/
> > +}
> > 
> >  FILES_${PN} = "${libdir}/libnl-3.so.* \
> >                 ${libdir}/libnl.so.* \
> > --
> > 1.7.9.5
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

