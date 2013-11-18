Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id ADEAE5296F
	for <meta-arago@arago-project.org>;
	Mon, 18 Nov 2013 18:29:54 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rAIITr7Q008439
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:29:53 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIITrdU020920
	for <meta-arago@arago-project.org>; Mon, 18 Nov 2013 12:29:53 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 18 Nov 2013 12:29:53 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rAIITrbF000764;
	Mon, 18 Nov 2013 12:29:53 -0600
Date: Mon, 18 Nov 2013 13:29:52 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20131118182952.GG19813@edge>
References: <1384789460-12883-1-git-send-email-Chase.Maupin@ti.com>
	<7D46E86EC0A8354091174257B2FED10159827996@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED10159827996@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] input-utils: fix fetch issue
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
X-List-Received-Date: Mon, 18 Nov 2013 18:29:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Nov 18, 2013 at 02:44:31PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: Maupin, Chase
> >Sent: Monday, November 18, 2013 9:44 AM
> >To: meta-arago@arago-project.org
> >Cc: Maupin, Chase
> >Subject: [PATCH] input-utils: fix fetch issue
> >
> >* Input utils has not been fetchable since the alioth server
> >  went down.  So instead of using git pull the 1.0 release from
> >  the ftp server.
> >* More information on the server issues can be found at:
> >  http://lists.debian.org/debian-infrastructure-
> >announce/2013/11/msg00001.html
> >
> >Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
> >---
> > .../{input-utils_git.bb => input-utils_1.0.bb}     |   10 +++++--
> >---
> > 1 files changed, 5 insertions(+), 5 deletions(-)
> > rename meta-arago-extras/recipes-devtools/input-utils/{input-
> >utils_git.bb => input-utils_1.0.bb} (71%)
> >
> >diff --git a/meta-arago-extras/recipes-devtools/input-utils/input-
> >utils_git.bb b/meta-arago-extras/recipes-devtools/input-
> >utils/input-utils_1.0.bb
> >similarity index 71%
> >rename from meta-arago-extras/recipes-devtools/input-utils/input-
> >utils_git.bb
> >rename to meta-arago-extras/recipes-devtools/input-utils/input-
> >utils_1.0.bb
> >index 30a7454..6fbc8b6 100644
> >--- a/meta-arago-extras/recipes-devtools/input-utils/input-
> >utils_git.bb
> >+++ b/meta-arago-extras/recipes-devtools/input-utils/input-
> >utils_1.0.bb
> >@@ -7,13 +7,13 @@ LIC_FILES_CHKSUM =
> >"file://COPYING;md5=8ca43cbc842c2336e835926c2166c28b"
> > PV = "1.0"
> > PR = "r0"
> 
> Not sure if this needs a PR bump.  Thoughts?

Is this the same exact version in tar as was supposed to be fetched from git? 
Then no PR bump is needed. Moreover, I believe for most people it would be the 
first time they are able to build anyway, as recipes went in right when the 
debian server went down, so nobody was able to build this before.


> >-BRANCH ?= "master"
> >-SRCREV = "230a22bda95ea5616251b43db418f9df445651b6"
> >-
> >-SRC_URI = "git://git.debian.org/collab-maint/input-
> >utils.git;protocol=git;branch=${BRANCH}"
> >+SRC_URI = "http://ftp.de.debian.org/debian/pool/main/i/input-
> >utils/input-utils_1.0.orig.tar.gz"
> > SRC_URI_append_arm = " file://0001-autoconf-fix-for-cross-
> >compilation-for-ARM.patch"
> >
> >-S = "${WORKDIR}/git"
> >+SRC_URI[md5sum] = "3e58772e8647093b1de2f2c90bfb9ee8"
> >+SRC_URI[sha256sum] =
> >"ab6f550f01bb5fcede492ab88711d82bacee4229cf2f5dc55a349b3bff4e3b13"
> >+
> >+S = "${WORKDIR}/input-1.0"
> >
> > do_compile () {
> >     oe_runmake
> >--
> >1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

