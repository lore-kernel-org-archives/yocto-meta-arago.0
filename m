Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id E42BB52099
	for <meta-arago@arago-project.org>;
	Wed,  2 Oct 2013 13:40:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r92DeGJA006132;
	Wed, 2 Oct 2013 08:40:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DeGYg013634;
	Wed, 2 Oct 2013 08:40:16 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 2 Oct 2013 08:40:16 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r92DeF4r026480;
	Wed, 2 Oct 2013 08:40:15 -0500
Date: Wed, 2 Oct 2013 09:40:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131002134015.GD31698@edge>
References: <1380611472-23600-1-git-send-email-denis@denix.org>
	<1380611472-23600-8-git-send-email-denis@denix.org>
	<7D46E86EC0A8354091174257B2FED1015977A5D7@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015977A5D7@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 07/13] webkit-examples: enable building and packaging of examples
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
X-List-Received-Date: Wed, 02 Oct 2013 13:40:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 02, 2013 at 12:57:56PM +0000, Maupin, Chase wrote:
> Some more explanation would be helpful here.  What is in the examples that 
> you need to build and package?

There are examples in the examples :) Seriously though, those are just basic 
qtwebkit examples - standard ones Qt comes with. The point is there's a recipe 
for them, but it doesn't build or package them, so pretty much useless, 
besides the sources. We don't really need them, I was just testing and 
experimenting with them.


> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> >Sent: Tuesday, October 01, 2013 2:11 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCH 07/13] webkit-examples: enable
> >building and packaging of examples
> >
> >From: Denys Dmytriyenko <denys@ti.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >---
> > .../recipes-qt/qt5/qtwebkit-examples/examples-build.patch
> >| 9 +++++++++
> > .../recipes-qt/qt5/qtwebkit-examples_5.1.0.bbappend
> >| 5 +++++
> > 2 files changed, 14 insertions(+)
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
> >examples/examples-build.patch
> > create mode 100644 meta-arago-distro/recipes-qt/qt5/qtwebkit-
> >examples_5.1.0.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-
> >examples/examples-build.patch b/meta-arago-distro/recipes-
> >qt/qt5/qtwebkit-examples/examples-build.patch
> >new file mode 100644
> >index 0000000..d7dc6ae
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-examples/examples-
> >build.patch
> >@@ -0,0 +1,9 @@
> >+diff -uNr qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-
> >examples.pro qtwebkit-examples-opensource-src-5.1.0/qtwebkit-
> >examples.pro
> >+--- qtwebkit-examples-opensource-src-5.1.0-orig/qtwebkit-
> >examples.pro	2013-07-02 03:10:27.000000000 -0400
> >++++ qtwebkit-examples-opensource-src-5.1.0/qtwebkit-examples.pro
> >	2013-09-29 21:31:10.761137146 -0400
> >+@@ -2,4 +2,4 @@
> >+
> >+ load(qt_parts)
> >+
> >+-SUBDIRS += doc
> >++SUBDIRS += doc examples
> >diff --git a/meta-arago-distro/recipes-qt/qt5/qtwebkit-
> >examples_5.1.0.bbappend b/meta-arago-distro/recipes-
> >qt/qt5/qtwebkit-examples_5.1.0.bbappend
> >new file mode 100644
> >index 0000000..7e41331
> >--- /dev/null
> >+++ b/meta-arago-distro/recipes-qt/qt5/qtwebkit-
> >examples_5.1.0.bbappend
> >@@ -0,0 +1,5 @@
> >+FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
> >+
> >+SRC_URI += "file://examples-build.patch"
> >+
> >+PR_append = "-arago0"
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

