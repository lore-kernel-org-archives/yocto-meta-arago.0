Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 01F10529AD
	for <meta-arago@arago-project.org>;
	Wed, 16 Mar 2016 18:25:25 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u2GIPPJi018308
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:25:25 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIPPdl015592
	for <meta-arago@arago-project.org>; Wed, 16 Mar 2016 13:25:25 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 16 Mar 2016 13:25:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u2GIPOfc006368;
	Wed, 16 Mar 2016 13:25:24 -0500
Date: Wed, 16 Mar 2016 14:25:09 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160316182508.GD29659@edge>
References: <1458071653-17553-1-git-send-email-j-stiffler@ti.com>
	<56E9A40C.6080704@ti.com>
MIME-Version: 1.0
In-Reply-To: <56E9A40C.6080704@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, xuj@ti.com
Subject: Re: [PATCH 0/8] Add LibArch and LinAlg
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
X-List-Received-Date: Wed, 16 Mar 2016 18:25:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Jake,

I was on the fence about this particular set. What are your requirement and 
priority here?

-- 
Denys


On Wed, Mar 16, 2016 at 02:21:00PM -0400, Jacob Stiffler wrote:
> Denys,
> 
> What are the chances of this making it into the 2015.03 release?
> 
> Thank you,
> Jake
> 
> On 3/15/2016 3:54 PM, Jacob Stiffler wrote:
> >Integrate Library Architecture and Framework (LibArch)
> >and TI Linear Algebra Library (LinAlg)
> >
> >Jacob Stiffler (8):
> >   libarch: Add version 1.0.0.0
> >   libarch-examples: Add examples for libarch version 1.0.0.0
> >   arago-source-ipk: Enable libarch-examples-src
> >   linalg: Add Linear Algebra Library version 1.2.0.0
> >   linalg-examples: And Linear Algebra Library examples
> >   arago-source-ipk: Enable linalg-examples-src
> >   packagegroup-arago-tisdk-addons: k2hk-evm: Integrate linalg
> >   ti-tisdk-makefile: Add linalg-examples target
> >
> >  .../conf/distro/arago-source-ipk.conf              |  7 ++
> >  .../packagegroup-arago-tisdk-addons-sdk-host.bb    |  3 +-
> >  .../packagegroup-arago-tisdk-addons-sdk-target.bb  |  3 +-
> >  .../packagegroup-arago-tisdk-addons.bb             |  3 +-
> >  .../ti-tisdk-makefile/Makefile_linalg-examples     | 39 ++++++++++++
> >  .../ti-tisdk-makefile/ti-tisdk-makefile_1.0.bb     |  4 +-
> >  .../recipes-ti/includes/arago-paths.inc            |  7 ++
> >  .../recipes-ti/libarch/libarch-examples_git.bb     | 36 +++++++++++
> >  meta-arago-extras/recipes-ti/libarch/libarch.inc   | 32 ++++++++++
> >  .../recipes-ti/libarch/libarch_git.bb              | 25 ++++++++
> >  .../recipes-ti/linalg/linalg-examples_git.bb       | 74 ++++++++++++++++++++++
> >  meta-arago-extras/recipes-ti/linalg/linalg.inc     | 43 +++++++++++++
> >  meta-arago-extras/recipes-ti/linalg/linalg_git.bb  | 23 +++++++
> >  13 files changed, 295 insertions(+), 4 deletions(-)
> >  create mode 100644 meta-arago-distro/recipes-tisdk/ti-tisdk-makefile/ti-tisdk-makefile/Makefile_linalg-examples
> >  create mode 100644 meta-arago-extras/recipes-ti/includes/arago-paths.inc
> >  create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch-examples_git.bb
> >  create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch.inc
> >  create mode 100644 meta-arago-extras/recipes-ti/libarch/libarch_git.bb
> >  create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg-examples_git.bb
> >  create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg.inc
> >  create mode 100644 meta-arago-extras/recipes-ti/linalg/linalg_git.bb
> >
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

