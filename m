Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id B924152986
	for <meta-arago@arago-project.org>;
	Thu, 27 Mar 2014 15:36:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2RFaRfT007566
	for <meta-arago@arago-project.org>; Thu, 27 Mar 2014 10:36:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2RFaRSc002280
	for <meta-arago@arago-project.org>; Thu, 27 Mar 2014 10:36:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Thu, 27 Mar 2014 10:36:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2RFaQ4h006100;
	Thu, 27 Mar 2014 10:36:26 -0500
Date: Thu, 27 Mar 2014 11:36:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20140327153625.GE12929@edge>
References: <1395863802-31820-1-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015CF5BE1B@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015CF5BE1B@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] qt4-embedded-gles: skip package when sgx is not set in MACHINE_FEATURES
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
X-List-Received-Date: Thu, 27 Mar 2014 15:36:27 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Mar 27, 2014 at 02:55:05PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Wednesday, March 26, 2014 2:57 PM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH] qt4-embedded-gles: skip package when
> >sgx is not set in MACHINE_FEATURES
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >qt4-embedded-gles depends on virtual/egl and libgles-omap3, but
> >the latter has
> >strict COMPATIBLE_MACHINE setting. Latest versions of BitBake
> >report these
> >missing dependencies as error during parsing, but treat as non-
> >critical error
> >and proceeds with the build. Unfortunately, the return code is
> >non-zero, even
> >though there were 0 build errors. One way to resolve this is to
> >set similar
> >COMPATIBLE_MACHINE list for qt4-embedded-gles recipe, or check for
> >"sgx" flag
> >in MACHINE_FEATURES.
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-qt/qt4/qt4-embedded-gles_4.8.5.bbappend         | 13
> >++++++++++++-
> > 1 file changed, 12 insertions(+), 1 deletion(-)
> >
> >diff --git a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
> >gles_4.8.5.bbappend b/meta-arago-distro/recipes-qt/qt4/qt4-
> >embedded-gles_4.8.5.bbappend
> >index f9e5810..e7a1dad 100644
> >--- a/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
> >gles_4.8.5.bbappend
> >+++ b/meta-arago-distro/recipes-qt/qt4/qt4-embedded-
> >gles_4.8.5.bbappend
> >@@ -1,3 +1,14 @@
> > require arago-qt4.inc
> >
> >-PR := "${PR}.0"
> >+PR := "${PR}.1"
> >+
> >+# Some deps are missing when sgx is not set, skip this package
> >+python __anonymous() {
> >+    features = bb.data.getVar("MACHINE_FEATURES", d, 1)
> >+    if not features:
> >+        return
> >+    pkgn = bb.data.getVar("PN", d, 1)
> >+    pkgv = bb.data.getVar("PV", d, 1)
> 
> I like the solution, but what are pkgn and pkgv for?  Were you planning on 
> using these in the message below?

Indeed, those are leftovers from the versioned output. Don't need those now, I 
will remove them.


> >+    if "sgx" not in features:
> >+        raise bb.parse.SkipPackage('qt4-embedded-gles needs
> >dependencies derived from "sgx" in MACHINE_FEATURES')
> >+}
> >--
> >1.8.3.2
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

