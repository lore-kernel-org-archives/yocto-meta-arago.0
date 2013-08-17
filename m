Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 1CB4F52A67
	for <meta-arago@arago-project.org>;
	Sat, 17 Aug 2013 15:38:45 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r7HFcifD009439
	for <meta-arago@arago-project.org>; Sat, 17 Aug 2013 10:38:44 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r7HFci5V013596
	for <meta-arago@arago-project.org>; Sat, 17 Aug 2013 10:38:44 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Sat, 17 Aug 2013 10:38:43 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r7HFchiq022257;
	Sat, 17 Aug 2013 10:38:43 -0500
Date: Sat, 17 Aug 2013 11:38:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Maupin, Chase" <chase.maupin@ti.com>
Message-ID: <20130817153842.GK4931@edge>
References: <CF956B779D819D41BBC043B7082161D5444396@DBDE04.ent.ti.com>
	<7D46E86EC0A8354091174257B2FED101596C4484@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <7D46E86EC0A8354091174257B2FED101596C4484@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHv3] KMSCube: Add Demo 3D graphics application
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
X-List-Received-Date: Sat, 17 Aug 2013 15:38:45 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Fri, Aug 16, 2013 at 01:50:23PM +0000, Maupin, Chase wrote:
> >-----Original Message-----
> >From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> >bounces@arago-project.org] On Behalf Of Hingolikar, Mrinmayee
> >Sent: Friday, August 16, 2013 6:00 AM
> >To: meta-arago@arago-project.org
> >Subject: [meta-arago] [PATCHv3] KMSCube: Add Demo 3D graphics
> >application
> >
> >
> >* Showcases 3D graphics on SGX using kms and gbm
> >
> >v2:
> >
> >* Added DEPENDS for libdrm, libgbm and omap-sgx userspace
> >* INSANE_SKIP to avoid package dependencies
> >
> >v3:
> >
> >* Remove inc file as we have a version only .bb file. This
> >  fixes the review comment received with v1.
> >
> >Signed-off-by: Siddharth Heroor <heroor@ti.com>
> >Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> >---
> > .../recipes-graphics/kmscube/kmscube_1.0.0.bb      |   18
> >++++++++++++++++++
> > 1 files changed, 18 insertions(+), 0 deletions(-)  create mode
> >100644 meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> >
> >diff --git a/meta-arago-extras/recipes-
> >graphics/kmscube/kmscube_1.0.0.bb b/meta-arago-extras/recipes-
> >graphics/kmscube/kmscube_1.0.0.bb
> >new file mode 100644
> >index 0000000..e18e398
> >--- /dev/null
> >+++ b/meta-arago-extras/recipes-graphics/kmscube/kmscube_1.0.0.bb
> >@@ -0,0 +1,18 @@
> >+SUMMARY = "Demo application to showcase 3D graphics on SGX using
> >kms and gbm"
> >+HOMEPAGE = "http://git.ti.com"
> >+LICENSE = "BSD"
> >+LIC_FILES_CHKSUM =
> >"file://kmscube.c;beginline=1;endline=23;md5=8b309d4ee67b7315ff738
> >1270dd631fb"
> >+
> >+DEPENDS = "libdrm libgbm-glsdk omap5-sgx-ddk-um-linux"
> 
> Have these dependencies such as omap5-sgx and libgbm-glsdk been submitted 
> and accepted?

There were some unaddressed comments if I remember correctly...

> 
> >+
> >+COMPATIBLE_MACHINE = "omap-a15"
> >+
> >+inherit autotools pkgconfig
> >+
> >+SRC_URI = "git://git.ti.com/glsdk/kmscube.git;protocol=git"
> >+
> >+S = "${WORKDIR}/git"
> >+
> >+SRCREV = "5a03757c0aa52eff44fb0d8ac0529f8cc18b1da0"
> >+
> >+INSANE_SKIP_kmscube += "dev-deps"
> >--
> >1.7.0.4
> >
> >_______________________________________________
> >meta-arago mailing list
> >meta-arago@arago-project.org
> >http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

